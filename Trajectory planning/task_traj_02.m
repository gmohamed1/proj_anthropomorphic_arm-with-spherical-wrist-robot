function Task_Space02 = task_traj_02(X0, Xf, tf)
%%helical trajectory
w=(4*180)/tf;
r=X0(1);
l1=X0(3);
c=(Xf(3)-l1)/tf;
ts=0.1;
x=zeros(1,tf/ts);
y=zeros(1,tf/ts);
z=zeros(1,tf/ts);
global i
i=1;
for t=0.1:ts:tf
    x(i)=r*cosd(w*t);
    y(i)=r*sind(w*t);
    z(i)=l1+c*t;
    q=inverse_position_kinematics(10,[0 0 0 0 0 0],X)
    i=i+1;
end
Task_Space02=[x ;y; z];
end

