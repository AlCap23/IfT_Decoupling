
import numpy as np

# Step Information of SISO system

 

def Step_Info(y,t, p=0.02, yr = 1):

    """

    Returns the Rise Time, Overshoot, Settling Time and Steady State

    of a given signal. Requires y, yr, t and optional a percentage for settling time

    """

 

   # Check for Steady State

    # Does series converge?

    yss = y[-1]

 

    # Get the rising time as the time

    # First value above 0.1 steady state

    index1 = np.where(y>0.1*yss)

    # First value equal 0.9 steady state

    index2 = np.where(y>0.9*yss)

    # Rising Time

    # Check if empty

    if index1[0].size == 0:

        t_rise = np.NaN

    elif index2[0].size == 0:

        t_rise = np.NaN

    else:

        t_rise = t[index2[0][-1]]-t[index1[0][0]]

 

    # Overshoot for values above steady state

    # Get all values

    mp = np.abs(y[np.where(abs(y)>abs(yss))])

    # Check if empty

    if mp.size == 0:

        mp = 0.

    else:

        mp = np.abs((np.max(mp)-np.abs(yss))/np.abs(yss))

 

 

    # Settling time for all value between a certain percentage

    index = np.where(np.logical_and(abs(y)<(1+p)*abs(yss), abs(y)>(1-p)*abs(yss)))

    # Ceck if empty

    if index[0].size ==0:

        t_settle = np.NaN

    else:

        t_settle = t[index[0][0]] -t[0]

 

 

    return t_rise,mp,t_settle,yss

 

def Disturbance_Info(y,t,p=0.02):

    # Check for Steady State

    # Does series converge to original value

    yr = y[0]

    if np.abs(y[-1]-yr) < 1e-2 :

        yss = y[-1]

    else:

        yss = y[0]   

 

    # Maximum Overshoot for values above steady state

    # Get all values

    mp = np.abs(y-yss)

    mp_max = np.argmax(mp)

    if mp[mp_max] < 1e-5:

        tp = 0.

    else:

        tp = t[mp_max]-t[0]

 

 

    # Check if empty

    if mp.size == 0:

        mp = 0.

    else:

        mp = mp[mp_max]

 

 

    # Settling time for all value between a certain percentage, after overshoot

    if abs(yss) < 1e-2:

        index = np.where(np.logical_and(abs(y[mp_max:])<(+p), abs(y[mp_max:])>(-p)))

    else:   

        index = np.where(np.logical_and(abs(y[mp_max:])<(1+p)*yss, abs(y[mp_max:])>(1-p)*yss))

    # Ceck if empty

    if index[0].size ==0:

        t_settle = 0.

    elif mp < 1e-3 :

        t_settle = 0.

    else:

        t_settle = t[index[0][0]] - t[0]

 

 

    return tp,mp,t_settle,yss

 

# Integral Identification of first order time delay

 

def Integral_Identification(y,u,t):

    """Returns a FOTD Model from the given data.

    y - array of outputs

    u - array of inputs -> Maybe change to scalar!

    t - array of time values

    """

   

    # If the output is zero return emtpy function

    if np.max(abs(y)) == 0:

        return 0,0,0

 

    # Truncate for Maximum value of abs(y) has reached 98 %

    #i_end = np.argmax(abs(y),axis=0)

    i_end = np.argmax(abs(y)[np.where(abs(y)<=0.98*np.max(abs(y)))])

    # If Last indice is used

    if i_end <= 0:

        i_end = 1

    yp = y[0:i_end]

    up = u[0:i_end]

    tp = t[0:i_end]

    # Get steady state Gain

    KM = (y[np.argmax(abs(y),axis=0)]-y[0])/(u[-1])

    # Get the Residence Time

    Tar = 1/np.abs(up[-1])*np.sign(up[0])/KM * np.trapz(yp[-1]-yp,tp)

    # Time Constant

    T = 1/np.abs(up[-1])*np.sign(up[0])* np.exp(1)/KM*np.trapz(yp[np.where(tp<=Tar)],tp[np.where(tp<=Tar)])

    # Delay

    L = Tar-T

    # Check if all arguments are valid

    if (T < 0):

        print("Error - Negative lag - Using 20 instead")

        T = 20

    if (L < 1e-2):

        print("Error - Small delay - Using 0 instead")

        if (L > 0):

            L = 0

       else:   

            L = 0

    return KM,T,L

 

# Algrotihm for computing gain of first order time delay

 

def FOTD_Gain(K,T,L,w=0):

    """Computes the gain of a first order time delay system at a given frequency"""

    # Check if all dimensions match

    if (K.shape != T.shape) or (K.shape != L.shape) or (L.shape != T.shape):

        print("Shapes of parameter array are not equal!")

        return np.NaN

    # Steady State

    if w==0:

        return K

    # System Dimension

    if K.ndim == 1:

        # Using system Identity by multiplying with the complex conjugate

        G = 1/(T**2 * w**2 +1)*(K-1j*T*w)*(np.cos(-L*w)+1j*np.sin(-L*w))

    else:

        outputs,inputs = K.shape

        # Create a system within the complex numbers

        G = np.zeros_like(K, dtype=complex)

        for i in range(0,inputs):

            for o in range(0,outputs):

                # Using system Identity by multiplying with the complex conjugate

                G[o][i] = 1 /(T[o][i]**2 * w**2 +1) * ( K[o][i] - 1j*T[o][i]*w) *(np.cos(-L[o][i]*w)+1j*np.sin(-L[o][i]*w))

    return G

 

# Algorithm for computing the RGA

 

def RGA(K,T,L,w=0):

    """Takes a FOTD System and computes the RGA of the system"""

    if (K.shape != T.shape) or (K.shape != L.shape) or (L.shape != T.shape):

        print("Shapes of parameter array are not equal!")

    # Compute the System

    G = FOTD_Gain(K,T,L,w)

    # Calculate the RGA

    RGA = np.multiply(G, np.transpose(np.linalg.inv(G)))

    return RGA

 

# Algorithm for AMIGO Tuning

 

def AMIGO_Tune(K,T,L, structure = 'PI', Minimal_Delay=0.3): #-------------------------------------------------------------------------ÄNDERUNG -------------------------------------------------------------------------

    """Computes the PI(D) controller parameter based on AMIGO algorithm;

       Parameter are returned as parallel notation KP,KI,KD and set point;

       Needs first order time delay parameter as input

 

      

    """

    # Check for small delay

    if L < Minimal_Delay*T:

        if Minimal_Delay*T < 1e-2:

            L_P = 1e-2

        else:

            L_P = Minimal_Delay*T

    else:

        L_P = L

    # PI Controller

    if structure == 'PI':

        # Parameter as Defined in Aström et. al., Advanced PID Control,p.229

        KP = 0.15/K + (0.35 - L_P*T /(L_P+T)**2)*T/(K*L_P)

        TI = 0.35*L_P+(13*L_P*T**2)/(T**2+12*L_P*T+7*L_P**2)

        TD = 0.0

        # Set Point Weight, Derived from Fig. 7.2, p. 230

        if L/(T+L) < 0.2:

            b = 0.0

        elif L/(T+L) > 0.3:

            b = 1.0

        else:

            # Approximate as Linear Function

            b = 0.0 + (1.0 - 0.0)/(0.3-0.2)*(L/(T+L)-0.2) 

 

    elif structure == 'PID':

        KP = 1/K*(0.2+0.45*T/L_P)

        TI = (0.4*L_P + 0.8*T)/(L_P+0.1*T)*L

        TD = (0.5*L_P*T)/(0.3*L_P+T)

        # Set Point Weight, as given on p.235

        # PRÜFEN!!!

        if L/(T+L) > 0.5:

            b = 1

        else:

            b = 0.0

    else:

        print("Undefined controller Structure")

        return np.NaN

    KI = KP/TI

    KD = KP*TD

    return [KP,KI,KD],b

 

# Algortihm for AMIGO Detuning

 

def AMIGO_DETUNE(K,T,L,params,KP, MS = 1.4, structure = 'PI'):

    """Detunes the AMIGO parameter according to Astrom"""

    # Check for small delay

    if L < 1e-1:

        L = 1e-1

    # Calculate normalized Time

    tau = L/(L+T)

    # Needed Parameter

    alpha_D = (MS-1)/MS # See p.255 Eq. 7.19

    beta_D = MS*(MS+np.sqrt(MS**2-1))/2# See p.257 Eq. 7.24

   

    # Define old set of parameter

   

    KP0 = params[0]

    KI0 = params[1]

    KD0 = params[2]

  

    #print "TAU="+str(tau)

    if structure=='PI':

        # Use normalized time to determine Process as explained on p.255 f.

       

        if tau > 0.1:

            KI = KI0*(K*KP+alpha_D)/(K*KP0+alpha_D)  # Formel stimmt

           

        else:

            # Needed constrain for switch case,See p. 258 Eq. 7.27

            c = KP*K - KP0*K*(L+T)/(beta_D*(alpha_D+KP*K)) - alpha_D

            c=1;  #-----------------------------------------------------------DIESE ZEILE IST EIGENTLICH FALSCH, aber die darauffolgende Formel für c< klappt nicht

            if c < 0:

                KI = beta_D*(alpha_D+KP*K)**2/(K*(L+T))  # Formel nicht sinnvoll -------------------------------------------------------------------------ÄNDERUNG NOTWENDIG-------------------------------------------------------------------------

            else:

                KI = KI0*(alpha_D+KP*K)/(alpha_D+KP0*K)  #FORMEL RICTHIG

        #print "KP0="+str(KP0)

        #print "KI0="+str(KI0)

        #print "KI="+str(KI)

        return [KP,KI,0.0]#--------------------------------------------------------------------------------------------------------------------------------geändert----------------------------------------------------------------------------------------------------

    if structure == 'PID':

        print("Not implemented")

        return np.NaN

    else:

        print("Undefined controller Structure")

        return np.NaN        

 

# ALgorithm for computing decentralized controller based on RGA

 

def Control_Decentral(K,T,L, w = 0, b=np.empty, structure = 'PI', pairing = np.empty):

    """ Computes decentralised controller with AMIGO algorithm based on RGA pairing"""

    # Compute SISO Case

    if K.ndim <= 1:

        # Using system Identity by multiplying with the complex conjugate

        params, b0 = AMIGO_Tune(K,T,L)

        # If b is not given, use b from AMIGO

        if b == np.empty:

            B = b0

            #Kr = [b0*params[0], params[1], params[2]]

            Ky = params

        else:

            B  = b

            Ky = params

        D = 1

    # Compute general MIMO Case

    else:

        # Systems dimensions

        outputs,inputs = K.shape

        # Create an empty controller

        Ky = np.zeros([outputs,inputs,3])

        B = np.zeros([outputs,inputs])

        D = np.eye(outputs,inputs)

        # Compute RGA -> Checks for Shape

        LG = RGA(K,T,L,w)

        # Get Pairing as an array for every column

        if pairing == np.empty:

            Pairing = np.argmax(LG, axis=0)

        else:

            Pairing = pairing

        # Iterate through the pairing

        for o in range(0,outputs):

            # Best Pairing

            i = Pairing[o]

            # Compute controller via recursion

            Ky[o][i],B[o][i],d = Control_Decentral(K[o][i],T[o][i],L[o][i],b)

    return Ky, B, D

 

# Algorithm for computing a decoupling control based on Aström

 

def Control_Astrom(K,T,L,H, MS= None, w = 0, b=np.empty, structure = 'PI'):

    """Computes a Decoupling Controller via Aström Algortihm based on FOTD"""

   

    # Check Input for Maximum Sensitivity

    if MS is None:

        MS = 1.4*np.eye(K.shape[0],K.shape[1])

 

    # Compute Determinant of Maximum Sensitivity

    ms = np.linalg.det(MS)

 

    # Compute SISO Case

    if K.ndim <= 1:

        return Control_Decentral(K,T,L,w,b,structure)

    # Compute General MIMO Case

   else:

       

        # Systems dimensions

        outputs,inputs = K.shape

        # Check dimensions

        if (K.shape != T.shape) or (K.shape != H.shape) or (K.shape != MS.shape) or (K.shape != L.shape) or (L.shape != T.shape):

            print("Shapes of parameter array are not equal!")

            return np.NaN

       

        # Create an empty controller

        Ky = np.empty([outputs,inputs,3])

        B = np.empty([outputs,inputs])

       

        # Compute the decoupler

        D = np.linalg.inv(K)

        # Compute the interaction indeces

        # Since d/ds(Q*K) = d/ds(Q)*K = d/ds(G) we can write the Taylor coefficient

        Gamma = np.abs(np.dot(np.multiply(-K,T+L),D))

        #print(Gamma)

        # Set main diagonal to zero

        np.fill_diagonal(Gamma,0)

        # Get the maximum of each row

        GMax = np.argmax(Gamma,axis=1)

        #print(GMax)

        # Get the new System --> das machen wir mittlerweile anders

        Tt = np.dot(np.multiply(K,np.add(T,L)),D)-np.diag(np.max(L,axis=1))#np.dot(K,np.dot(np.transpose(np.add(T,L)),D))-np.diag(np.max(L,axis=1))

        Lt = np.diag(np.max(np.transpose(L),axis=0))

        Kt = np.eye(K.shape[0],K.shape[1])

               

 

        # Iterate through the outputs

        for o in range(0,outputs):

            # Estimate the new system parameter

            # Get the maximal delay

            #l = np.max(L[o][:])

            l = Lt[o][o]

            # Add the systems gain -> scaled to 1 because of inversion

            k = Kt[o][o]

            # Get the array of gains

            # Get the system time constant as weighted sum

            t = Tt[o][o]

            # Calculate the detuning frequency

            R = 0.8

            wc_min = 2.0/R * (t+l)/((t+l)**2 + t**2)

            # Design a controller based on estimated system

            ky, b0, d = Control_Decentral(k,t,l,w,b,structure)

            # Test for Interaction

            # We detune the controller of the n-th output in such a way that the maximum of the n-th row is sufficiently small

            # Current maximum interaction

            gmax = Gamma[GMax[o]][o]

           

            # Check for set point weight, either given

            if b == np.empty:

                # Or computed from AMIGO_TUNE

                b = b0

           

            # Check for structure

            if structure == 'PI':

                #Minimal Delay L>=Minimal_Delay*T for AMIGO

                Minimal_Delay=0.3

                # Set counter for while

                counter=0

                # Set shrinking rate

                shrink_rate = 0.95

                # Check if decoupling is needed

                ky0=ky # --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------#ÄNDERUNG -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

                                                              

                while (np.abs(H[o][o]/(ms*gmax)) - np.sqrt( (b*ky[0]*wc_min)**2 + ky[1]**2 ) < 0):

                    if counter > 5:

                        #print "Minimal_delay-Erhöhung"

                        ##print('Maximal Iteration for detuning reached! Abort')

                        #Minimal_Delay+=0.2

                        #print "Restart Amigo with Minimal_Delay "+str(Minimal_Delay)

                        ##print ky

                        #ky0,b=AMIGO_Tune(K=k,T=t,L=l,Minimal_Delay=Minimal_Delay)

                        #ky=ky0

                        #counter=0

                        print "Detuning not working"

                        break

                        #break

                    # Detune the controller with the shrinking rate

                    else:

                        print "Detuning"

                        ky = AMIGO_DETUNE(k,t,l,ky0,shrink_rate*ky[0])  #--------------------------------------------------------------------------------------------------------------------------------------------------#ÄNDERUNG ----------------------------------------------------------------------------------------------------------

                    # Increment counter

                    counter += 1

                print("Aström Detuning Iterations:" +str(counter))

                # Get the controller parameter

                Ky[o][o][:] = ky

                B[o][o] = b

       

        # Get the Minor diagonals

 

 

        return Ky,B,D

 

 

# Modified Detuning

def Control_Decoupled(K,T,L,H, MS= None, w = 0, b=np.empty, structure = 'PI', method ='dynamic', pairing = np.empty):

    # Check Input for Maximum Sensitivity

    if MS is None:

        MS = 1.4*np.eye(K.shape[0],K.shape[1])

   

    # Compute Determinant of Maximum Sensitivity

    ms = np.linalg.det(MS)

 

    # Compute SISO Case

    if K.ndim <= 1:

        return Control_Decentral(K,T,L,w,b,structure)

   

    # Compute General MIMO Case

    else:

 

        # Compute a decentralized control structure based on RGA

        Ky, B, D = Control_Decentral(K,T,L, w , b, structure, pairing = pairing)

 

        # Calculate the Pairing

        if pairing == np.empty:

            # Compute RGA -> Checks for Shape

            LG = RGA(K,T,L,w)

            Pairing = np.argmax(LG, axis=0)

        else:

            Pairing = pairing

       

        # Compute the Taylor Series

        Gamma =  np.multiply(-K,T+L)

 

        # Initialize

        # Gain

        KD = np.zeros_like(Gamma)

        # Interaction

        GD = np.zeros_like(Gamma)

 

        # Get the Diagonal entries for decoupling

        for outputs in range(0,K.shape[0]):

            inputs = Pairing[outputs]

            KD[outputs][inputs] = K[outputs][inputs]

            GD[outputs][inputs] = Gamma[outputs][inputs]

   

        # Get the Antidiagonal

        # Gain

        KA = K-KD

        # Interaction

        GA = Gamma-GD

       

        # Define the splitter

        S = -np.dot(np.linalg.inv(KD),KA)

       

        # Get the interaction relative to the gain

       

        if method == 'dynamic':

            # Interaction relative to the dynamic of the interaction

            GammaA = np.abs(np.dot(np.linalg.inv(GD),GA) + S)

        elif method == 'static':

            # Interaction relative to the gain

            GammaA = np.abs(np.dot(np.linalg.inv(KD),np.add(GA,np.dot(GD,S))))

        else:

            # Interaction relative to the dynamic of the interaction

            GammaA = np.abs(np.dot(np.linalg.inv(GD),GA) + S)

        #print(GammaA)

       

        

        # Get the maximum of each row

        GMax = np.argmax(GammaA,axis=1)

        #print(GMax)

        #Iterate through the outputs

        for outputs in range(0,K.shape[0]):

            inputs = Pairing[outputs]

           

            # Test the current controller for interaction

            # Every controller has the dimension 3 for kp, ki, kd

            ky = Ky[outputs][inputs]

            #kr = Kr[outputs][inputs]

 

            # Get the current parameter

            k = K[outputs][inputs]

            t = T[outputs][inputs]

            l = L[outputs][inputs]

 

            # Calculate the detuning frequency

            R = 0.8

            wc_min = 2.0/R * (t+l)/((t+l)**2 + t**2)

 

            # Check for set point weight, either given

            if b == np.empty:

                # Or computed from AMIGO_TUNE

                b = B[outputs][inputs]

           

            gmax = GammaA[GMax[outputs]][outputs]

            #print(gmax)

            # Check for PI Structure

            if structure == 'PI':

                                                              

                # Define the counter

                counter = 0

                # Set shrinking rate

                shrink_rate = 0.9

              

                while (np.abs(H[outputs][outputs]/(ms*gmax)) - np.sqrt( (b*ky[0]/wc_min)**2 + ky[1]**2 ) < 0):

                    if counter > 5:

                        #print('Maximal Iteration for detuning reached! Abort')

                        break

                    # Detune the controller with the shrinking rate   

                    ky = AMIGO_DETUNE(k,t,l,ky,shrink_rate*ky[0])

                    # Increment counter

                    counter += 1

                print("Modified Detuning Iterationts "+str(counter))

                # Get the controller parameter

                Ky[outputs][inputs][:] = ky

                #Kr[outputs][inputs][:] = [b*ky[0], ky[1], ky[2]]

           

        # Return the controller with splitter

        return Ky,B,np.eye(K.shape[0],K.shape[1])+S

 

 

################################# MIMO FUNCTIONS FOR SIMULATION############################

 

def tf_system(ss, omega):

    # Get the matrices

    A = ss['A']

    B = ss['B']

    C = ss['C']

    D = ss['D']

    # Make a I matrix ( depends on the states)

    I = np.eye(A.shape[0])

    # The Transfer Function

    G = np.dot(np.dot(C,np.linalg.inv(omega*1j*I-A)),B)+D

   

    return G

 

# Compute a controller for a given KY, B, D

def compute_pi(KY, B, D):

    # Make KPR,KPY, KIR and KIY

    KPR = np.zeros((2,2))

    KPY = np.zeros((2,2))

    KIR = np.zeros((2,2))

    KIY = np.zeros((2,2))

 

    # Fill with values

    for outputs in range(0,2):

        for inputs in range(0,2):

            # Proportional Controller

            KPY[outputs,inputs] = KY[outputs,inputs,0]

            # Intergral Controller

            KIY[outputs,inputs] = KY[outputs,inputs,1]

 

    # Implement Set-point Weight

    KPR = np.dot(B,KPY)

    KIR = KIY

 

    # Implement Decoupler

    KPR = np.dot(D,KPR)

    KIR = np.dot(D,KIR)

    KPY = np.dot(D,KPY)

    KIY = np.dot(D,KIY)

 

    return KPR, KIR, KPY, KIY

 

# Compute the sensitivity function of a closed loop

# Takes system, controller and frequency

def compute_sensitivity(ss,KY,B,D,omega):

    # Compute the transfer function matrix

    G = tf_system(ss, omega)

    # Compute the controller

    KPR, KIR, KPY, KIY = compute_pi(KY,B,D)

    # Compute the sensitivity

    S = np.linalg.inv(np.eye(2,2)+np.dot(G,np.add(KPY,1/(omega*1j)*KIY)))

    return S

 

# Compute complementary sensitivity of a closed loop

# Takes system, controller and frequency

def compute_complementarysensitivity(ss, KY, B, D, omega):

    # Compute the transfer function matrix

    G = tf_system(ss, omega)

    # Compute the controller

    KPR, KIR, KPY, KIY = compute_pi(KY,B,D)

    # Compute the sensitivitiy

    S = compute_sensitivity(ss, KY, B, D, omega)

    # Compute the complementary sensitivity

    T = np.dot(S,np.dot(G, np.add(KPR,1/(omega*1j)*KIR) ))

    return T

 

 

#TUBScolorscale = [

#    '#ffc82a','#ffd355','#ffde7f','#ffe9aa','#fff4d4',

#    '#e16d00','#e78a33','#eda766','#f3c599','#f9e2cc',

#    '#711c2f','#8d4959','#aa7782','#c6a4ac','#e3d2d5',

#    '#acc13a', '#bdcd61','#cdda89','#dee6b0','#eef3d8','#6d8300','#8a9c33','#a7b566','#c5cd99','#e2e6cc','#00534a','#33756e','#669892','#99bab7','#ccdddb',

#    '#66b4d3','#85c3dc','#a3d2e5','#c2e1ed','#e0f0f6','#00709b','#338daf','#66a9c3','#99c6d7','#cce2eb','#003f57','#336579','#668c9a','#99b2bc','#ccd9dd',

#    '#8a307f','#a15999','#b983b2','#d0accc','#e8d6e5','#511246','#74416b','#977190','#b9a0b5','#dcd0da','#4c1830','#704659','#947483','#b7a3ac','#dbd1d6'

#]

# Only Main Colors

# Black, Red, Yellow, Orange, Dark Red, Light Green, Green, Dark Green, Light Blue, Blue, Dark Blue, Light Violet, Violet, Dark Violet

# 0      1    2       3       4         5            6      7           8           9     10         11             12     13

TUBScolorscale = [

    '#000000','#be1e3c','#ffc82a', '#e16d00', '#711c2f', '#acc13a', '#6d8300', '#00534a',

    '#66b4d3','#00709b','#003f57','#8a307f','#511246','#4c1830', '#FF00FF'

]

 

def cm2in(*tupl):

    """Stack overflow-> User gns-ank"""

    inch = 2.54

    if isinstance(tupl[0], tuple):

        return tuple(i/inch for i in tupl[0])

    else:

        return tuple(i/inch for i in tupl)
		