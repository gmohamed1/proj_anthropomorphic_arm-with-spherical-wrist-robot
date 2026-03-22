function T_i =kinemtic_energy(q, qdot, m, I)
syms q1 q2 q3 q4 q5 q6
[T_return,X]=end_effector_positionn(q);
for i=2:6
         T_return(:,:,i)=T_return(:,:,i-1)*T_return(:,:,i);
    
end
syms RotationalMatrices
RotationalMatrices=sym('a',[3,3,6]);
for i=1:6
    RotationalMatrices(:,:,i)=T_return(1:3,1:3,i);
end
syms T_rotation T_trans
T_rotation=sym('a',[6,1]);
T_trans=sym('a',[6,1]);
syms w
w=sym('a',[3,6]);
for i=1:6
    w(:,i)=[0;0;qdot(i)];
end
%%link 1 (rotation only)
T_rotation(1)=0.5*transpose(w(:,1))*I(:,:,1)*w(:,1);
T_trans(1)=0;

%%link 2 to 6 (rotational + translational)

% Calculating rotational K.E
syms OmegasMatrices 
OmegasMatrices=sym('a',[3,1,6]);
OmegasMatrices(:,1)=w(:,1);
value=w(:,1);
  for i=2:6 
       value=value+RotationalMatrices(:,:,i-1)*w(:,i);
       OmegasMatrices(:,i)=value;
   end
for i=2:6
 T_rotation(i)=simplify(0.5*transpose(OmegasMatrices(:,i))*I(:,:,i)*OmegasMatrices(:,i));
end


% Calculating trans. K.E
syms VelocityVectorCOM
VelocityVectorCOM=sym('a',[3 6]);
[U_i,PosVectorCOM]= potential_energy(q, m);
syms q_1(t) q_2(t) q_3(t) q_4(t) q_5(t) q_6(t);
PosVectorCOM = subs(PosVectorCOM,[q1,q2,q3,q4,q5,q6],[q_1(t),q_2(t),q_3(t),q_4(t),q_5(t),q_6(t)]);
VelocityVectorCOM = diff(PosVectorCOM,t);
syms q1dot q2dot q3dot q4dot q5dot q6dot
VelocityVectorCOM = subs(VelocityVectorCOM,[diff(q_1(t),t),diff(q_2(t),t),diff(q_3(t),t),diff(q_4(t),t),diff(q_5(t),t),diff(q_6(t),t),],[qdot(1),qdot(2),qdot(3),qdot(4),qdot(5),qdot(6)]);
for i=2:6
 T_trans(i)=simplify(0.5*m(i)*transpose(VelocityVectorCOM(:,i))*VelocityVectorCOM(:,i));
end


% Calculating total K.E 
syms T_i
T_i=sym('a',[6,1]);
for i=1:6
    T_i(i)=T_rotation(i)+T_trans(i);
end
end
