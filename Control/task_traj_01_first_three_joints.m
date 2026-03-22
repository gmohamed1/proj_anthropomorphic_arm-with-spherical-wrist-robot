function  Task_Space01 = task_traj_01_first_three_joints(X0, Xf, tf,t)
%%straight line trajectory
alpha_x=(Xf(1)-X0(1))/tf;
alpha_y=(Xf(2)-X0(2))/tf;
alpha_z=(Xf(3)-X0(3))/tf;
x=0;
y=0;
z=0;
x=X0(1)+alpha_x*t;
y=X0(2)+alpha_y*t;
z=X0(3)+alpha_z*t;
X=[x;y;z];
q=inverse_position_kinematics(5,[0 0 0 0 0 0],X);
Task_Space01=[x ;y; z];
end

