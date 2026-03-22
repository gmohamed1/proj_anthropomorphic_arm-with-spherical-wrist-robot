function [J_dot] = jacobian_derivative(q,q_dot)

J=jacobian_matrix(q);
syms q_1(t) q_2(t) q_3(t) q_4(t) q_5(t) q_6(t);
J = subs(J,[q_1,q_2,q_3,q_4,q_5,q_6],[q_1(t),q_2(t),q_3(t),q_4(t),q_5(t),q_6(t)]);
J_diff = diff(J,t);
J_dot = subs(J_diff,[diff(q_1(t),t),diff(q_2(t),t),diff(q_3(t),t),diff(q_4(t),t),diff(q_5(t),t),diff(q_6(t),t),],[q_dot(1),q_dot(2),q_dot(3),q_dot(4),q_dot(5),q_dot(6)]);

J_dot = subs(J_dot,[q_1(t),q_2(t),q_3(t),q_4(t),q_5(t),q_6(t)],[q(1),q(2),q(3),q(4),q(5),q(6)]);

end

