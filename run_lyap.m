%Code showing timeseries and lyapunov exponents
r=28;sigma=10;b=8/3;
Lorenz=@(t,x) [sigma*(x(2)-x(1));r*x(1)-x(2)-x(1)*x(3);x(1)*x(2)-b*x(3)]; 
% Use ode45, 0<t<200, initial value (x,y)=(1,0).
%set tolerances
options = odeset('RelTol',1e-4,'AbsTol',1e-4);
[t,xx]=ode45(Lorenz,[0 1000],[0,1,0],options);

figure(1)
plot3(xx(:,1),xx(:,2),xx(:,3))
%plot(xx(:,3))
hold on 
% Plot the trajectory.
fsize=15;
%axis([-10 10 -10 10])
xlabel('x','FontSize',fsize)
ylabel('y','FontSize',fsize)
print -depsc -painters  Phasespace_Lorenz.eps

%Calculating lyapunov exponents
[T,Res]=lyapunov(3,@lorenz_ext,@ode45,0,0.5,200,[0 1 0],10);
figure(2)
plot(T,Res);

title('Dynamics of Lyapunov exponents');
xlabel('Time'); ylabel('Lyapunov exponents');

print -depsc -painters  Lyapunovexponent.eps
