syms q_1 q_2 q_3 q_4 q_5 q_6
syms q_1dot q_2dot q_3dot q_4dot q_5dot q_6dot
 syms q1_dd q2_dd q3_dd q4_dd q5_dd q6_dd
 
 q_0=[10,10,10,10,10,10];
 
 inverse_position_kinematics(20,q_0,[12;0;2])
 
 
%    q_dot=[2 1 5 3 4 7];
%    q=[0 0 0 0 1 0];
%   q_dd = [0 0 2 0 0 0];
%  v_f = [0 12 0 0];
%  A_F = [0 1 2 3 ];
%    q=[q_1 q_2 q_3 q_4 q_5 q_6];
%    q_dot=[q_1dot q_2dot q_3dot q_4dot q_5dot q_6dot];
%   q_double_dot = [q1_dd q2_dd q3_dd q4_dd q5_dd q6_dd];
%q_0=[10,10,20,30,40,50];
%  forward_acceleration_kinematics(q,q_dot,q_dd)
%b=Orientation(q);
%  jacobian_matrix(q)
% forward_velocity_kinematics(q,q_dot)
%b=jacobian_matrix(q);
 % jacobian_derivative(q,q_dot)
%   b=inverse_jacobian_matrix(q)
%   rref(jacobian_matrix(q))
% inverse_velocity_kinematics(q,v_f)
% inverse_acceleration_kinematics(q,q_dot,A_F)

% end_effector_positionn(q)
