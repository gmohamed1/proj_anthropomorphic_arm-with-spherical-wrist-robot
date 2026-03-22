function q_dot=inverse_velocity_kinematics(q,V_F)
%j_inv= inverse_jacobian_matrix(q)
 J=jacobian_matrix_num(q);
 r=rank(J)
 b=zeros(4,6);
 for i=1:4
     for j =1:6
         b(i,j)=J(i,j);
     end
 end
 a=b
 r=rank(a)       
 [RB,p]= rref(J);

j_inv=pinv(b)
x=V_F;
 q_dot=j_inv*transpose(V_F)

end

