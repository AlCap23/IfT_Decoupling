# coding: utf8
"""
	Contains the transfer function class for transfer function with time delay;
	Contains the order reduction techniques;
"""

# Import the python package numpy
import numpy as np 




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
			b = 0.0
		elif L / ( T+ L ) > 0.3:
			b = 1.0
		else:
			b = (1.0-0.0)/(0.3-0.2)* ( L / (T+L) - 0.2 )
	elif structure == 'PID':
		KP = 1.0 / K * (0.2 + 0.45 * T / L_P)
		TI = ( 0.4*L_P + 0.8 * T ) / ( L_P +  0.1 * T )
		TD = ( 0.5 * L_P * T ) / ( 0.3 * L_P + T )

		if L / ( T + L ) > 0.5:
			b = 1.0
		else:
			b = 0.0
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




