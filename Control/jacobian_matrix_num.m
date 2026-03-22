function  J = jacobian_matrix_num(q)

J = zeros(6,6);

[T_return,X]=end_effec_num(q);
 for i=2:6
         T_return(:,:,i)=T_return(:,:,i-1)*T_return(:,:,i);
    
end

J_w=zeros(3,1,6);
J_v=zeros(3,1,6);
O=zeros(3,1,6);
for i=1:6
    if i==1
       %  J_w(:,:,i)=sym([0;0;1]);
         J_w(:,:,i)=[0;0;1];
    else
        J_w(:,:,i)=T_return(1:3,3,i);
    end
end
 
for i=1:6 
    if i==1
       %  O(:,:,i)=sym([0;0;0]);
          O(:,:,i)=[0;0;0];
    else
   O(:,:,i) =  T_return(1:3,4,i);
    end
end
 for i=1:6
       
     J_v(:,:,i)=cross(J_w(:,:,i),(O(:,:,6)-O(:,:,i)));
 end
 %J = syms(6,6);
 b = zeros(6,1,6);
for i=1:6
    b(1:3,1,i)=J_v(1:3,1,i);
    b(4:6,1,i)=J_w(1:3,1,i);
    J(1:6,i) =b(1:6,1,i);
    
end



end


