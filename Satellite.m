function dstatedt = Satellite(t,state)
%%%state0 = = [x0;y0;z0;xdot0;ydot0;zdot0];


x = state(1);
y = state(2);
xdot = state(3);
ydot = state(4);



%%%inertia and mass
m = 5.344; %%kilograms

%%%kinematics
vel = state(3:4);

%%Gravity Model
earth
r = state(1:2); 
rho = norm(r);
rhat = r/rho;
Fgrav = (-G*M*m/rho^2)*rhat;

%%%dynamics
F = Fgrav;
accel = F/m;

dstatedt = [vel;accel];
