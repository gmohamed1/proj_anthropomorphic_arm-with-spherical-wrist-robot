syms q_1 q_2 q_3 q_4 q_5 q_6
syms q_1dot q_2dot q_3dot q_4dot q_5dot q_6dot
 syms q1_dd q2_dd q3_dd q4_dd q5_dd q6_dd
 
%  q_0=[10,10,10,10,10,10]
%  max_iter = 10
%  x_desired = [12;0;2]
%    q=[0 0 0 0 0 0]; 
 %inverse_position_kinematics(max_iter,q_0,x_desired) 
%      q_dot=[1 0 0 0 0 0];
%   q_dd = [0 0 2 0 0 0];
%   v_f = [0 12 0 0];
%   A_F = [0 1 2];
     q=[q_1 q_2 q_3 q_4 q_5 q_6];
 %   q_dot=[q_1dot q_2dot q_3dot q_4dot q_5dot q_6dot];
%   q_double_dot = [q1_dd q2_dd q3_dd q4_dd q5_dd q6_dd];
%q_0=[10,10,20,30,40,50];
%  forward_acceleration_kinematics(q,q_dot,q_dd)
%b=Orientation(q);
%    jacobian_matrix_num(q)
% forward_velocity_kinematics(q,q_dot)
%   b=jacobian_matrix(q);
%    jacobian_derivative_num(q,q_dot)
 % b=inverse_jacobian_matrix(q)
%   rref(jacobian_matrix(q))
%  inverse_velocity_kinematics(q,v_f)
%  inverse_acceleration_kinematics(q,q_dot,A_F)
%test(5)
% end_effector_positionn(q)


X0=[12 0 2];
XF=[8 0 6];
tic
task_traj_01(X0,XF,1)
toc


