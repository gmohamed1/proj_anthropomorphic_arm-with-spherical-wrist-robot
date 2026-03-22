function [U_i,PosVectorCOM] = potential_energy(q, m)
g=[0 0 -9.81];
[T_return,X]=end_effector_positionn(q);
syms PosVector
PosVector=sym('a',[3 6]);
for i=1:6
    PosVector(:,i)=T_return(1:3,4,i);
end
syms PosVectorCOM
PosVectorCOM=sym('a',[3 6]);
PosVectorCOM(:,1)=PosVector(:,1)/2;
value=PosVector(:,1);
for i=2:6
    PosVectorCOM(:,i)=value+PosVector(:,i)/2;
    value=value+PosVector(:,i);
end
syms U_i
U_i=sym('a',[6 1]);

for i=1:6
U_i(i)=simplify(m(i)*g*PosVectorCOM(:,i));
end
end
