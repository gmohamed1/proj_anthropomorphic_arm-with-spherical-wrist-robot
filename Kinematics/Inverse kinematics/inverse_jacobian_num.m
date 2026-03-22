function j_num= inverse_jacobian_num(q)

j_sym=0;

j_num=vpa(subs(j_sym, [q_1,q_2,q_3,q_4,q_5,q_6], [q(1),q(2),q(3),q(4),q(5),q(6)]));


end

