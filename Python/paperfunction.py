# coding: utf8
"""
	Contains controller design rules for AMIGO;
	Contains the order reduction techniques and identification;
	Contains functions for simulation via dymola -> DYMOLA INTERFACE IS NEEDED.
"""

# Import the python package numpy
import numpy as np 
# Import integration from scipy
import scipy.integrate as integrate
# Import pandas for Data storage
import pandas as pd
# Import the dymola interface for simulation
from dymola.dymola_interface import DymolaInterface 
# Import modelicares for result files
import modelicares as mres


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


def DECENTRAL_CONTROLLER(K,T,L, structure = "PI", pairing = np.empty):
	""" 
	Computes a decentralized controller for a given first order plus time delay system. 

	Uses the AMIGO algorithm as given by Astroem et.al., Advanced PID Control

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
# Model Reduction and Identification
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


def FOTD_AREA_IDENTIFICATION(y, u , time, u_0 = 0.0,  derivativeCompensation = False):
	"""
	Identifies a first order plus time delay model from a given step response.
	Uses area based / integration methods as can be derived via the step response, e.g. given in

	A new method to estimate a first-order plus time delay model from step response, Fedele, 2009

	Modification have been made to approximate the model for strong differential behaviour.

	Inputs:
	y : List of floats or numpy array, output array of the step experiment.
	u : Float, Amplitude of step
	time : List of floats or numpy array, array of time values.

	Optional:
	u_0 : Float, Initial value for input. Default is 0.0
	derivativeCompensation: Boolean, compensates strong derivative action. Default is False.

	Returns:
	K : Float, Gain of the FOPTD model
	T : Float, Lag of the FOPTD model
	L : Float, Delay of the FOPTD model
	"""

	# Check, if the values are numpy array
	if type(y) != np.ndarray:
		y = np.array(y)
	if type(time) != np.ndarray:
		time = np.array(time)

	# Check if all arrays have the same size:
	if (y.shape != time.shape):
		raise Exception("Size of the arrays is not equal. Please check the provided arrays.")

	# Check if u_0 is float
	if type(u_0) != float:
		raise Exception("u_0 has to be of type float.")
	# Check if u is float
	if type(u) != float:
		raise Exception("u has to be of type float.")
	# Check, if derivative Compensation is boolean
	if type(derivativeCompensation) != bool:
		raise Exception("derivativeCompensation has to be of type bool.")

	# Check, if output is sufficiently different
	if np.abs(y[0]-y[-1]) < 1e-3*np.max(y):
		raise Exception("Nearly no change of output. Sufficient excitation is needed.")
	# Check, if input is sufficiently excitated
	if np.abs(np.max(u) - u_0) < 1e-3*np.max(u):
		raise Exception("Nearly no excitation of input. Sufficient excitation is needed.")

	# Truncate the arrays for 98 % of final value. Compensates integrative behaviour.
	time = time[np.where(abs(y) <= 0.98*abs(y)[-1])]
	y = y[np.where(abs(y) <= 0.98*abs(y)[-1])]

	# Calculate the static gain
	K = (y[-1] - y[0]) / (u - u_0) *  1./0.98
	
	# Check cases for derivative compensation

	# No compensation
	if not derivativeCompensation:

		# Compute the average residence time 
		Tar = 1./K * integrate.simps(y[-1] - y , time)

		# Compute the lag
		T = 1./K * np.exp(1) * integrate.simps(y[np.where(time < Tar)], time[np.where(time < Tar)])

		# Compute the delay
		L = Tar - T

	# Compensation active
	if derivativeCompensation:
		
		# Find the maximum of the array
		i_max = np.argmax(abs(y))
		
		# Check if index is not zero
		if i_max < 1:
			raise Exception("Time resolution is not sufficiently. Please repeat experiment with higher resolution.")
		
		# Truncate the array for maximum
		time_d = time[:i_max]
		y_d = y[:i_max]

		# Compute the scaled gain
		K_S = (y_d[-1]-y_d[0]) / (u - u_0)

		# Compute the average residence time
		Tar = 1./K_S * integrate.simps(y_d[-1]-y_d , time_d)

		# Compute the lag
		T = 1./K_S * integrate.simps(y_d[np.where(time_d <= Tar)], time_d[np.where(time_d <= Tar)])

		# Compute the delay
		L = Tar-T

	# Return the model parameter
	return K, T, L

def AREA_BASED_APPROXIMATION(K,T,L,D):
	""" 
	Approximate the sum of a first order plus time delay system when a static decoupler is used based on time integration. 

	Leverages the fact that:

	K * ( T + L ) = \int_0^inf ( y(inf) - y(t) ) dt

	Inputs:
	K : List of Lists of Floats or Numpy Array, Gain of the FOTD model.
	T : List of Lists of Floats or Numpy Array, Lag of the FOTD model.
	L : List of Lists of Floats or Numpy Array, Delay of the FOTD model.
	D : List of Lists of Floats or Numpy Array, Static decoupler applied to the system.
	
	Returns:
	K : Numpy Array, New gain of the system
	T : Numpy Array, New lag of the system
	L : Numpy Array, New delay of the system
	"""

	# Check if K, T and L are numpy arrays and convert if necessary
	if type(K) != np.ndarray:
		K = np.array(K)
	if type(T) != np.ndarray:
		T = np.array(T)
	if type(L) != np.ndarray:
		L = np.array(L)
	if type(D) != np.ndarray:
		D = np.array(D)

	# Check the parameter array sizes
		if (K.shape != T.shape) or (K.shape != L.shape) or (K.shape != D.shape) :
			raise Exception("Shape of the parameter arrays is not equal. Please check the parameter inputs.")

	# Compute the new system parameter

	# New gain,  Strictly linear algebra, K+ = K*D
	K_M = np.dot(K,D)

	# New delay, use the external time delay so that L+ = min(L)
	L_M = np.diag(np.min(np.transpose(L), axis = 0))

	# New lag, use the fact that T+ + L+ = inv(K+) * (K x (T+L))*D, where x is element wise multiplication / Hadamard product
	T_M = np.dot( np.linalg.inv(K_M) , np.dot( np.multiply( K , np.add(T, L ) ) , D ) ) - L_M

	return K_M, T_M, L_M 

#########################################################################################
# Simulation Setup via Dymola
#########################################################################################

def Stability(y,y_r):
	"""
	Simple function to check stability. Takes the systems output y and its set point y_r.
	Calculates the error. If the absolute error is increasing, the system is unstable.

	Inputs:
	y : Numpy Array, Systems output
	y_r : Numpy Array, Systems set point

	Returns:
	True, if system is not stable
	"""

	return np.all(np.abs(y_r-y)[:,1:] - np.abs(y_r-y)[:,:-1] > 0 )

def Simulate_FOPTD(k,t,l, time):
	"""
	Simple simulator for a first order plus time delay;

	g = K / (T*s+1) * e^( -L * s )

	In the time domain corresponding to

	y = K*( 1 - e^( -(t-L)/T ) ) * Heavyside(t-L)

	Inputs:
	k : Float, Gain of the FOPTD.
	t : Float, Lag of the FOPTD.
	l : Float, Delay of the FOPTD.
	time : numpy array, contains the time values.

	Returns:
	y : numpy array, contains the outputs
	"""

	# Check the input data structure
	if (type(k) != float ) or (type(t) != float) or (type(l) != float):
		raise Exception("Model parameter must be of type float.")
	if type(time) != np.ndarray:
		raise Exception("Time must be of type np.ndarray.")
	# Check if time is strictly increasing
	if not np.all(np.diff(time) > 0):
		raise Exception("Time must be strictly monotonic increasing!")
	y = []
	for times in time:
		if times < l:
			y.append(0)
		else:
			y.append(k*(1-np.exp(-(times-l)/t)))
	return np.array(y)


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

def Simulation_Results(Path):
	"""
	Import the result file from a dymola simulation.
	Returns the values for y1, y2, u1, u2, IAE1, IAE2, IE1, IE2 and time in a pandas datafram.

	Input:
	Path : String, Relative path to results.

	Return:
	Results : Pandas Dataframe
	"""

	# Load the Results
	res, lins = mres.load(Path)

	# Get the Data    
	y1 = res["y_1"].values()[0]
	u1 = res["u_1"].values()[0]
	y2 = res["y_2"].values()[0]
	u2 = res["u_2"].values()[0]
	IAE1 = res["IAE_1.y"].values()[0]
	IAE2 = res["IAE_2.y"].values()[0]
	IE1 = res["IE_1.y"].values()[0]
	IE2 = res["IE_2.y"].values()[0]
	time = res["Time"].values()[0]

	# Make a dict
	data = {"time" : time ,"y1" : y1,"y2" : y2,"u1" : u1,"u2" : u2,"IAE1" : IAE1,"IAE2" : IAE2,"IE1" : IE1, "IE2": IE2}
	# Make a Dataframe
	Results = pd.DataFrame(data = data)
	return Results