clear all
clc

%% Load Airfoil Data

[BID,r,dr,A_t,c] = LoadGeometry('Airfoil_17.txt');

%% Load Lift and Drag Coefficients

[AlphaTable] = LoadCoefficients('Alpha_Data.txt');

%% General Variable

U           = 8;                                                            % Rated wind speed              [m/s]

Omega = 7.55*8/63;
%Omega       = 8 * 2 * pi / 60;                                             % Rotation speed                [rad/s]

A_po        = 0;                                                            % Pitch angle                   [rad]

B           = 3;                                                            % Number of blades              [-]

R_hub       = 1.5;                                                          % Hub radius                    [m]

R_rot       = 63;                                                           % Rotor radius                  [m]

Rho         = 1.225;                                                        % Air density                   [kg/m^3]

Output      = zeros(length(BID),13);                                             % Preallocate Output matrix

for node = 1:length(BID)

    PrintProgress(node,i,1);

    a    = 0;                                                               % Initialize a                  [-]
    ap   = 0;                                                               % Initialize a'                 [-]

    LTSR = (Omega * r(node)) / U;                                           % Local Tip Speed Ratio         [-]

    i    = 1;                                                               % Counts loops to convergence
    con  = 0;                                                               % Convergence flag 0 = no convergence

    %for i = 1:20
    while con == 0

        alast    = a;                                                       % Last value of a
        aplast   = ap;                                                      % Last value of a'

        [phi,~]  = InflowAngle(U,a,Omega,r(node),ap);                       % Inflow Angle                  [rad]

        [F]      = Corrections(B,R_rot,r(node),phi,R_hub);                  % Correction Factor             [-]

        [alpha]  = AngleOfAttack(A_t(node),A_po,phi);                       % Angle of Attack               [rad]

        [CL,CD]  = CoefficientLookup(alpha,BID(node));                      % Lift and drag coefficients    [-]

        [sigmap] = LocalSolidity(B,c(node),r(node));                        % Local Solidity                [-]

        [CT]     = ThrustCoefficient(sigmap,a,CL,phi,CD);                   % Thrust Coefficient            [-]
        
        [a,ap]   = InductionFactors(F,CT,phi,sigmap,CL,CD);                 % Induction Factors             [-]

        [con,i]  = Convergence(i,a,ap,alast,aplast);

     end

     Output(node,:) = [node,a,ap,CT,phi,alpha,CL,CD,LTSR,sigmap,r(node),dr(node),c(node)];

     PrintProgress(node,i,2);
end

%[Power,Torque,Thrust] = RotorPower(Rho,U,Omega,Output,length(BID))