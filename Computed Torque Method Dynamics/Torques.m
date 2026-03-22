function T = Torques(L, q, qdot)
syms q1 q2 q3 q4 q5 q6
q=[q1 q2 q3 q4 q5 q6];
syms q1dot q2dot q3dot q4dot q5dot q6dot
qdot=[q1dot q2dot q3dot q4dot q5dot q6dot];
syms t q_1dot(t) q_2dot(t) q_3dot(t) q_4dot(t) q_5dot(t) q_6dot(t)
syms q1ddot q2ddot q3ddot q4ddot q5ddot q6ddot
qddot=[q1ddot q2ddot q3ddot q4ddot q5ddot q6ddot];
syms T PartialLPartialdot PartialLPartialangle
T=sym('a',[6,1]);
PartialLPartialdot=sym('a',[6,1]);
PartialLPartialangle=sym('a',[6,1]);
for i=1:6
    PartialLPartialdot(i)=diff(L,qdot(i));
    PartialLPartialdot(i)=subs(PartialLPartialdot(i),[q1dot q2dot q3dot q4dot q5dot q6dot],[q_1dot(t) q_2dot(t) q_3dot(t) q_4dot(t) q_5dot(t) q_6dot(t)]);
    PartialLPartialangle(i)=diff(L,q(i));
    T(i)=simplify(diff(PartialLPartialdot(i),t)-PartialLPartialangle(i));
    T(i)=subs(T(i),[diff(q_1dot(t),t),diff(q_2dot(t),t),diff(q_3dot(t),t),diff(q_4dot(t),t),diff(q_5dot(t),t),diff(q_6dot(t),t),],[qddot(1),qddot(2),qddot(3),qddot(4),qddot(5),qddot(6)]);
end
eqns=[T(1),T(2),T(3),T(4),T(5),T(6)];
 vars=[qddot(1),qddot(2),qddot(3),qddot(4),qddot(5),qddot(6)];
 vars2=[q1dot^2, q2dot^2, q3dot^2, q4dot^2, q5dot^2, q6dot^2];
 vars3=[q1dot^2*q2dot^2*q3dot^2*q4dot^2*q5dot^2*q6dot^2];
 [M,G] = equationsToMatrix(eqns,vars);
 C= equationsToMatrix(eqns,vars2);
 B=equationsToMatrix(eqns,vars3);
 
 syms t1 t2 t3 t4 t5 t6
 T=[t1;t2;t3;t4;t5;t6];
 T=transpose(M)*transpose(vars)+transpose(C)*transpose(vars2)+B*vars3+G;
end

