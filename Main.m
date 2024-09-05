clear
clc


disp('Simulation Started')



%%%Get planet parameters
earth

%%%Initial Conditions
altitude = 500*1000; %%meters
x0 = R + altitude; %%meters
y0 = 0;
xdot0 = 0;
inclination = 81*pi/180;
semi_major = norm([x0;y0]);
vcircular = sqrt(mu/semi_major);
ydot0 = vcircular*cos(inclination);

state0 = [x0;y0;xdot0;ydot0];

%%%Need time window
period = 2*pi/sqrt(mu)*semi_major^(3/2);
number_of_orbits = 1;
tspan = [0 period*number_of_orbits];

%%%This is where we integrate the equations of motion
[tout,stateout] = ode45(@Satellite,tspan,state0);

%%%convert state to kilometers
stateout = stateout/1000;

%%%extract the state vector
xout = stateout(:,1);
yout = stateout(:,2);

%%%make an 2d earth
theta = linspace(0,2*pi,100);
X = R*cos(theta)/1000;
Y = R*sin(theta)/1000;

%%%plot orbit
fig = figure(1);
clf
hold on
set(fig, 'color','white')
plot(xout,yout,'b-','LineWidth',2)
plot(X,Y,'k-','LineWidth',2)
grid on
surf(X,Y,Z,'EdgeColor','none')
axis equal
