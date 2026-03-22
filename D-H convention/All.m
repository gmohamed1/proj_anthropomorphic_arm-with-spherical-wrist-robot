
syms q_1 q_2 q_3 q_4 q_5 q_6
syms alpha_1 alpha_2 alpha_3 alpha_4 alpha_5  alpha_6
syms a_1 a_2 a_3 a_4 a_5 a_6
syms d_1 d_2 d_3 d_4 d_5 d_6
T_g_sym= sym('a', [4,4,6]);
%T_g_num= NaN(4,4,6);
T_g_num=sym('b',[4,4,6]);
l0=2;
l1=2;
l2=2;
l3=2;
l4=2;
l5=2;
l6=2;


DH_Table=[q_1 l0 l1 pi/2;q_2 0 l2 0;q_3 0 0 pi/2;q_4 l3+l4 0 -pi/2;q_5 0 0 pi/2;q_6 l5+l6 0 0]; 

i=1;
q=[q_1 q_2 q_3 q_4 q_5 q_6];
alpha=[alpha_1 alpha_2 alpha_3 alpha_4 alpha_5  alpha_6];
a = [a_1 a_2 a_3 a_4 a_5 a_6];
d = [d_1 d_2 d_3 d_4 d_5 d_6];
%Symbolic
while i<7
   
    T_g=[cos(q(i)) -sin(q(i))*cos(alpha(i)) sin(q(i))*sin((alpha(i))) a(i)*cos((q(i)));
        sin(q(i)) cos(q(i))*cos(alpha(i)) -cos(q(i))*sin(alpha(i)) a(i)*sin(q(i)) ;
        0 sin(alpha(i)) cos(alpha(i)) d(i);
        0 0 0 1];
    T_g_sym(:,:,i)=T_g;
    
    i=i+1;
 
end 

T_EE_SYM = T_g_sym(:,:,1)*T_g_sym(:,:,2)*T_g_sym(:,:,3)*T_g_sym(:,:,4)*T_g_sym(:,:,5)*T_g_sym(:,:,6);
%Numeric
for i=1:6
    for j=2:4
            if j==2
              d(i)=DH_Table(i,j);
            elseif j==3
              a(i)=DH_Table(i,j);
            else    
              alpha(i)=DH_Table(i,j);
            end
    end
end
%q=[0 0 0 0 0 0];
i=1;
while i<7
   
    T_g_n=[cos(q(i)) -sin(q(i))*cos(alpha(i)) sin(q(i))*sin((alpha(i))) a(i)*cos((q(i)));
        sin(q(i)) cos(q(i))*cos(alpha(i)) -cos(q(i))*sin(alpha(i)) a(i)*sin(q(i)) ;
        0 sin(alpha(i)) cos(alpha(i)) d(i);
        0 0 0 1];
    T_g_num(:,:,i)=T_g_n;
    
    i=i+1;
 
end 
T_EE_NUM = T_g_num(:,:,1)*T_g_num(:,:,2)*T_g_num(:,:,3)*T_g_num(:,:,4)*T_g_num(:,:,5)*T_g_num(:,:,6);
