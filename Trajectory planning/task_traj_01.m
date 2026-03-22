function  Task_Space01 = task_traj_01(X0, Xf, tf)
%%straight line trajectory
alpha_x=(Xf(1)-X0(1))/tf;
alpha_y=(Xf(2)-X0(2))/tf;
alpha_z=(Xf(3)-X0(3))/tf;
ts=0.1;
x=zeros(1,tf/ts);
y=zeros(1,tf/ts);
z=zeros(1,tf/ts);
i=1;
X=[X0(1);X0(2);X0(3)];
q0=inverse_position_kinematics(5,[0 0 0 0 0 0],X)
for t=0:ts:tf
   x(i)=X0(1)+alpha_x*t;
   y(i)=X0(2)+alpha_y*t;
   z(i)=X0(3)+alpha_z*t;
   X=[x(i);y(i);z(i)];
   q=inverse_position_kinematics(5,q0,X)
   q0=q;
   i=i+1;
end
Task_Space01=[x ;y; z];
end

