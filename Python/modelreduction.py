# coding: utf8
"""
	Contains controller design rules for AMIGO;
	Contains the order reduction techniques;
	Contains functions for simulation via dymola -> DYMOLA INTERFACE IS NEEDED.
"""

# Import the python package numpy
import numpy as np 
# Import the dymola interface for simulation
from dymola.dymola_interface import DymolaInterface 



########################################################################################
# CONTROLLER FUNCTIONS
########################################################################################





def AMIGO_TUNE(K,T,L, structure = 'PI', Minimal_Delay = 0.3):
	"""
	Computes the PI(D) controller parameter based on AMIGO algorithm.
	
	Inputs:
	K : Float, Gain of the FOTD model.
	T : FLoat, Lag of the FOTD model.
	L : Float, Delay of the FOTD model.
	Optional:
	structure : String, Structure of the controller. Either PI oder PID. Standard is PI
	Minimal_Delay: Float, Minimal Delay in Terms of the Lag used to design controller. Standard is 0.3

	Returns:
	K  : List of controller Parameter, consisting of:
		KP : Float, Proportional gain of the controller
		KI : Float, Integral gain of the controller
		KD : Float, Derivative gain of the controller
	B  : Float, Set-point weight
	"""

	# Check for small delay
	if L < Minimal_Delay*T:
		if Minimal_Delay*T < 1e-2:
			L_P = 1e-2
		else:
			L_P = Minimal_Delay*T
	else:
		L_P = L

	# Check for structure
	if structure == 'PI':
		# Parameter as defined in Astroem et. al., Advanced PID control, p.229
		KP = 0.15 / K + ( 0.35 - L_P*T / (L_P+T)**2 ) * T / (K*L_P)
		TI = 0.35 * L_P + ( 13.*L_P*T**2 ) / (T**2 + 12.*L_P*T + 7*L_P**2 )
		TD = 0.0

		# Set-point weight, Derived from Fig. 7.2, p.230
		if L/( T + L ) < 0.2:
			B = 0.0
		elif L / ( T+ L ) > 0.3:
			B = 1.0
		else:
			B = (1.0-0.0)/(0.3-0.2)* ( L / (T+L) - 0.2 )
	elif structure == 'PID':
		KP = 1.0 / K * (0.2 + 0.45 * T / L_P)
		TI = ( 0.4*L_P + 0.8 * T ) / ( L_P +  0.1 * T )
		TD = ( 0.5 * L_P * T ) / ( 0.3 * L_P + T )

		if L / ( T + L ) > 0.5:
			B = 1.0
		else:
			B = 0.0
	else:
		raise  Exception('Undefined controller structure ! Please use either PI or PID.')

	# Compute the gains
	KI = KP / TI 
	KD = KP * TD

	# Return
	return [KP, KI, KD], B

def AMIGO_DETUNE(K,T,L, Controller, KP, MS = 1.4, structure = 'PI'):
	"""
	Detunes the AMIGO controller according to Astroem et.al.

	Inputs:
	K : Float, Gain of the FOTD model.
	T : FLoat, Lag of the FOTD model.
	L : Float, Delay of the FOTD model.
	Controller: List of controller parameter KP, KI, KD
	KP: Float, Next KP wished for
	Optional:
	MS : Float, Maximum Sensitivity
	structure: String, Controller structure

	Returns:
	K  : List of controller Parameter, consisting of:
		KP : Float, Proportional gain of the controller
		KI : Float, Integral gain of the controller
		KD : Float, Derivative gain of the controller
	B  : Float, Set-point weight
	"""

	# Get old parameter
	KP0 = Controller[0]
	KI0 = Controller[1]
	KD0 = Controller[2]

	# Compute needed variables
	alpha_D = ( MS - 1. ) / MS # p.255 Eq.7.19
	beta_D = MS * ( MS +  np.sqrt(MS**2 - 1.) ) / 2. # p.257 Eq.7.24

	# Detune the controller

	if structure == 'PI':
		# Use normalized time to determine Process
		if L / ( T + L ) > 0.1:
			KI = KI0*(K*KP+alpha_D)/(K*KP0+alpha_D)
		else:
			# ATTENTION! HERE IS THE SAME FORMULA!!! 
			# MICHAEL
			KI = KI0*(alpha_D+KP*K)/(alpha_D+KP0*K) 
	if structure == 'PID':
		raise Exception('PID detuning is not yet implemented!')
	else:
		raise Exception('Undefined controller structure ! Please use either PI or PID.')
	# Returns new KP and KI, old KD
	return [KP,KI,KD0]


def DECENTAL_CONTROLLER(K,T,L, structure = "PI", pairing = np.empty):
	""" 
	Computes a decentralized controller for a given first order plus time delay system. Uses the AMIGO algorithm as given by Astroem et.al.

	Inputs:
	K : List of Lists of Floats or Numpy Array, Gain of the FOTD model.
	T : List of Lists of Floats or Numpy Array, Lag of the FOTD model
	L : List of Lists of Floats or Numpy Array, Delay of the FOTD model

	Optional Input:
	structure : String, Controller structure. Either "PI" or "PID".
	pairing: List of Floats or Numpy Array, Pairings for the decentralized controller. First entry contains the input used for controlling the first output.

	Returns:
	C: List of Arrays containing the controller Parameter.
		KP : Numpy Array, Proportional Gain of the controller
		KI : Numpy Array, Integral Gain of the controller
		KD : Numpy Array, Integral Gain of the controller
	"""

	# Check if K, T and L are numpy arrays and convert if necessary
	if type(K) != np.ndarray:
		K = np.array(K)
	if type(T) != np.ndarray:
		T = np.array(T)
	if type(L) != np.ndarray:
		L = np.array(L)
	if type(pairing) != np.ndarray:
		pairing = np.array(pairing)

	# Check for single input, single output case:
	if K.ndim <= 1:
		# Give a message for the user
		print("Single Input Single Output system.")
		# Compute the controller parameter
		parameter, b = AMIGO_TUNE(K,T,L, structure = structure)
		# Simply return the parameter
		return parameter

	# Compute MIMO controller
	else:
		# Print a message for the user
		print("Multiple Input Multiple Output system.")
		
		# Check the parameter array sizes
		if (K.shape != T.shape) or (K.shape != L.shape) or (L.shape != T.shape):
			raise Exception("Shape of the parameter arrays is not equal. Please check the parameter inputs.")

		# Get the system size
		outputs, inputs = K.shape
		
		# Check if the pairing is defined sufficiently
		# Every output has an input defined
		if outputs != len(pairing):
			raise Exception("The given pairings are inconsistent with the systems outputs. Check either parameter or pairing.")
		# Every input is in pairing only once by getting all unique entries of pairing
		if pairing.size != np.unique(pairing).size:
			raise Exception("One or more inputs are used to control several outputs. Controller design is not possible! Please check pairing.")
		# Check if all pairings are positive and consistent with the number of inputs:
		if not ((np.all(pairing >= 1)) and ( np.all(pairing <= inputs )) ):
			raise Exception("The pairing uses inputs <= 1 or non existing inputs. Please check pairing. ")
		
		# Preallocate the parameter arrays
		KP = np.zeros([outputs, inputs])
		KI = np.zeros([outputs, inputs])
		KD = np.zeros([outputs, inputs])

		# Loop over the outputs setting a current output
		for c_out in range(0, outputs):
			
			# Get the corresponding pairing. 
			c_in = pairing[c_out] - 1

			# Compute the corresponding controller parameter
			parameter, b = AMIGO_TUNE(K[c_out,c_in], T[c_out, c_in], L[c_out,c_in], structure = structure)

			# Store the parameter
			KP[c_out, c_in] = parameter[0]
			KI[c_out, c_in] = parameter[1]
			KD[c_out, c_in] = parameter[2]

		return [KP, KI, KD]


#########################################################################################
# Model Reduction
#########################################################################################




def MODEL_TO_FOTD(NUM, DEN, L=0.0):
	"""
	Reduces the given Transfer function to a first order time delay model according to
	the simplification rules explained by Skogestadt et.al.
	Transfer function is assumed to be given in pole-zero notation
	
	g =  ( (T_1*s+1)(T_2 s+1)...) / ( (T_L1*s+1)(T_L2*s+1)...)

	The gain is assumed to be known!

	Inputs:
	NUM : List of floats or numpy array, Zeros of the Transfer Function numerator
	DEN : List of floats or numpy array, Poles of the transfer function denominator
	L : Float, Delay of the transfer function

	Returns:
	T : Float, Lag of the FOTD
	L : Float, Delay of the FOTD

	"""

	# Check if NUM and DEN are numpy array
	if type(NUM) is not np.ndarray:
		zeros = np.array(NUM)
	if type(DEN) is not np.ndarray:
		poles = np.array(DEN)

	# Sort the array of the poles in descending order
	poles = np.sort(poles)[::-1]
	
	# Get the zeros with a negative entry
	z_N = zeros[np.where(zeros < 0.0 )]

	# Get the zeros with a positive entry
	z_P = zeros[np.where(zeros > 0.0 )]
	
	# Get the delay
	L_D = L + 0.5 * poles[1] + np.sum(np.abs(z_N))
	
	# Get the lag
	T = poles[0] + 0.5 * poles[1] + np.sum(poles[2::])
	
	# Make model faster
	if T - np.sum(z_P) > poles[0] :
		T = T - np.sum(z_P)
	
	return T, L_D






#########################################################################################
# Simulation Setup via Dymola
#########################################################################################





def Initialize_Simulation(Path, Show = False):
	"""
	Initializes the simulation via dymola. 

	Inputs:
	Path : String, relative path to model
	Show : Boolean, Optional. Shows Dymola Window if True.
		   Default is False

	Returns:
	Model_Instance : Instance of the model in the dymola interface.
	"""

	Model_Instance = DymolaInterface(use64bit = True, showwindow = Show)
	Model_Instance.openModel(path = Path)

	return Model_Instance


def Run_Simulation(Model_Instance, Parameter):
	"""
	Runs the simulation of a modelica model via the dymola interface.
	
	Inputs:
	Parameter: Dict with the following setup parameter:

	Dict:
	Model : String, Model to simulate from the interface.
	Result: String, relative path to the storage location of the results.
	finalNames: List of String, Simulation results to store in result file.
	
	stopTime: Float, Stop time of the simulation.
	Intervals: Integer, Number of solver intervals.
	OutputInterval: Float, Time raster for the result file.
	Stepsize: Float, Simulation step size for the solver.
	
	Optional Parameter in Dict:
	startTime: Float, Optional. Start time of the simulation. Default is 0.0
	simTol: Float, Optional. Solver tolerance. Default is 1e-8
	initialNames: List of Strings, Model parameter to change.
	initialValues: List, Parameter values corresponding to the parameter to change. Must be included if initial Names are given.
	
	Returns:
	True, if simulation is sucessfull.
	"""

	# Check for Optional parameter

	# StartTime
	if "startTime" in Parameter:
		startTime = Parameter["startTime"]
	else:
		startTime = 0.0
	# Solver Tolerance
	if "simTol" in Parameter:
		simTol = Parameter["simTol"]
	else:
		simTol = 1e-7
	# initialNames
	if "initialNames" in Parameter:
		if "initialValues" in Parameter:
			initialNames = Parameter["initialNames"]
			initialValues = Parameter["initialValues"]
		else:
			raise Exception("Initial values for initial names are not given! Please enter valid intial values!")
	else:
		initialNames = []
		initialValues = []

	# Check if initial Names are forgotten
	if "initialValues" in Parameter and not "initialNames" in Parameter:
		raise Exception("Initial values are given but the corresponding set of parameter is not defined.")

	Model_Instance.simulateExtendedModel(
		Parameter["Model"],
		startTime = startTime,
		stopTime = Parameter["stopTime"],
		numberOfIntervals = Parameter["Intervals"],
		outputInterval = Parameter["OutputInterval"],
		method = "Dassl",
		tolerance = simTol,
		fixedstepsize = Parameter["Stepsize"],
		resultFile = Parameter["Result"],
		initialNames = initialNames,
		initialValues = initialValues,
		finalNames = Parameter["finalNames"],
		autoLoad = True
		)

	return


