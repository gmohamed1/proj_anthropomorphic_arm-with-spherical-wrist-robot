function Task_Space03 = task_traj_03(X0, Xf, tf)
w=(4*pi)/tf;
r=X0(1);
l1=X0(3);
c=(Xf(3)-l1)/tf;
ts=0.1;
k=(r-(Xf(1)/cos(w*tf))/tf);
x=zeros(1,tf/ts);
y=zeros(1,tf/ts);
z=zeros(1,tf/ts);
global i
i=1;
for t=0.1:ts:tf
    x(i)=(r-k*t)*cos(w*t);
    y(i)=(r-k*t)*sin(w*t);
    z(i)=l1+c*t;
    q=inverse_position_kinematics(10,[0 0 0 0 0 0],X)
    i=i+1;
end
Task_Space03=[x ;y; z];
end



