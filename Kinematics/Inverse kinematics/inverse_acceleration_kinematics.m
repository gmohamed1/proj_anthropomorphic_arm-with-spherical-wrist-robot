function q_double_dot = inverse_acceleration_kinematics(q,q_dot,A_F)
J = jacobian_matrix(q);
 b=zeros(4,6);
 bb = zeros(4,6);
 for i=1:4
     for j =1:6
         b(i,j)=J(i,j);
     end
 end
j_inv = pinv(b)
j_dot = jacobian_derivative_num(q,q_dot)
%  r = rref(j_dot)

%  for i=1:4
%      for j =1:6
%          bb(i,j)=j_dot(i,j);
%      end
%  end
%  
%  for i=1:2
%          for j =1:6
%          bbb(i,j)=bb(i,j);
%      end    
%  end

q_double_dot = j_inv*(transpose(A_F)-(j_dot*transpose(q_dot)));

end

