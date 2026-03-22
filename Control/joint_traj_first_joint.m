function Joint_Space = joint_traj_first_joint(q0, qf, qdot0, qdotf, tf,t)
C0=q0;
C1=qdot0;
syms C2 C3 eqns eqn eqndot
%ts=0.1;
S=NaN(2,6);
for i=1:1
   eqn=C2*(tf^2)+C3*(tf^3)==-C0(i)-C1(i)*tf+qdotf(i);
   eqndot=2*C2*(tf)+3*C3*(tf^2)==-C1(i)+qdotf(i);
   [A,B]=equationsToMatrix([eqn, eqndot], [C2, C3]);
   S(:,i)=linsolve(A,B);  
end
qs=0;
global j
j=1;
%for t=ts:ts:tf
  for i=1:1
    qs(j,i)=C0(i)+C1(i)*t+S(1,i)*(t^2)+S(2,i)*(t^3);
  end
  j=j+1;
%end
Joint_Space=qs;

