function Joint_Space = joint_traj(q0, qf, qdot0, qdotf, tf)
C0=q0;
C1=qdot0;
syms C2 C3 eqns
ts=1;
eqns=NaN(6,2);
for i=1:6
   eqn=C2*(tf^2)+C3*(tf^3)==-C0(i)-C1(i)*tf+qdotf(i);
   eqns(i,1)=eqn
   
end
for i=1:6
   eqndot=2*C2*(tf)+3*C3*(tf^2)==-C1(i)+qdotf(i);
   eqns(i,2)=eqndot
   
end
S=zeros(6,2);
for i=1:6
    [A,B]=equationsToMatrix([eqns(i,1), eqns(i,2)], [C2, C3])
    S(i)=linsolve(A,B)
end
qs=zeros(6,1);
for t=0:ts:tf
   for i=1:6
    qs(i)=C0(i)+C1(i)*t+S(i,1)*(t^2)+S(i,2)*(t^3);
   end
   Joint_Space=qs;
end

end
