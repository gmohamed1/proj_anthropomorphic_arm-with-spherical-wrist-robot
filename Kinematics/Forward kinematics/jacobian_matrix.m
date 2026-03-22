function  J = jacobian_matrix(q)

[T_return,X]=end_effector_positionn(q);
 for i=2:6
         T_return(:,:,i)=T_return(:,:,i-1)*T_return(:,:,i);
    
end


for i=1:6
    if i==1
         J_w(:,:,i)=sym([0;0;1]);
%         J_w(:,:,i)=[0;0;1];
    else
        J_w(:,:,i)=T_return(1:3,3,i);
    end
end
 
for i=1:6 
    if i==1
         O(:,:,i)=sym([0;0;0]);
%           O(:,:,i)=[0;0;0];
    else
   O(:,:,i) =  T_return(1:3,4,i);
    end
end
 for i=1:6
       
     J_v(:,:,i)=cross(J_w(:,:,i),(O(:,:,6)-O(:,:,i)));
 end
 %J = syms(6,6);
for i=1:6
    b(1:3,:,i)=J_v(:,:,i);
    b(4:6,:,i)=J_w(:,:,i);
    J(1:6,i) =b(:,:,i);
    
end



end


