function j_inv= inverse_jacobian_matrix(q)
syms q_1 q_2 q_3 q_4 q_5 q_6;
q_sym=[q_1 q_2 q_3 q_4 q_5 q_6];
[T_return,X]=end_effector_positionn(q_sym);
P1_1=diff(X(1),q_sym(1));
P1_2=diff(X(1),q_sym(2));
P1_3=diff(X(1),q_sym(3));
P1_4=diff(X(1),q_sym(4));
P1_5=diff(X(1),q_sym(5));
P1_6=diff(X(1),q_sym(6));
P2_1=diff(X(2),q_sym(1));
P2_2=diff(X(2),q_sym(2));
P2_3=diff(X(2),q_sym(3));
P2_4=diff(X(2),q_sym(4));
P2_5=diff(X(2),q_sym(5));
P2_6=diff(X(2),q_sym(6));
P3_1=diff(X(3),q_sym(1));
P3_2=diff(X(3),q_sym(2));
P3_3=diff(X(3),q_sym(3));
P3_4=diff(X(3),q_sym(4));
P3_5=diff(X(3),q_sym(5));
P3_6=diff(X(3),q_sym(6));
j_sym=[P1_1 P1_2 P1_3 P1_4 P1_5 P1_6;P2_1 P2_2 P2_3 P2_4 P2_5 P2_6;P3_1 P3_2 P3_3 P3_4 P3_5 P3_6];


j_num=vpa(subs(j_sym, [q_sym(1),q_sym(2),q_sym(3),q_sym(4),q_sym(5),q_sym(6)], [q(1),q(2),q(3),q(4),q(5),q(6)]));

j_inv=pinv(j_num);

end

