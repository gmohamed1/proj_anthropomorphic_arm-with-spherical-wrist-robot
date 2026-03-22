function X = end_effector_position(q)
l0=2;
l1=2;
l2=2;
l3=2;
l4=2;
l5=2;
l6=2;
DH_Table=[q(1) l0 l1 90;q(2) 0 l2 0;q(3)+90 0 0 90;q(4) l3+l4 0 -90;q(5) 0 0 90;q(6) l5+l6 0 0];
T= sym('a', [4,4,6]);

for i=1:6
    for j=1:4
            if j==2
              d(i)=DH_Table(i,j);
            elseif j==3
              a(i)=DH_Table(i,j);
            elseif j==1
                q(i)=DH_Table(i,j);
            else 
              alpha(i)=DH_Table(i,j);

            end
    end
    
    B=transformation_func(q(i),d(i),a(i),alpha(i));
     T(:,:,i)=B
    
end

T_EE=T(:,:,1)*T(:,:,2)*T(:,:,3)*T(:,:,4)*T(:,:,5)*T(:,:,6);
Xpos=T_EE(1,4)
Ypos=T_EE(2,4)
Zpos=T_EE(3,4)
X= [Xpos,Ypos,Zpos]; %position vector
end
