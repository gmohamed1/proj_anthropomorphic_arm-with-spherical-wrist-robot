function L =Lagrange()
syms q1 q2 q3 q4 q5 q6
q=[q1 q2 q3 q4 q5 q6];
syms m m1 m2 m3 m4 m5 m6 
m=[m1 m2 m3 m4 m5 m6];
potential_energy(q,m);
syms I Ix Ixy Ixz Iyx Iy Iyz Izx Izy Iz
syms Ix1 Ix2 Ix3 Ix4 Ix5 Ix6
syms Ixy1 Ixy2 Ixy3 Ixy4 Ixy5 Ixy6
syms Ixz1 Ixz2 Ixz3 Ixz4 Ixz5 Ixz6
syms Iyx1 Iyx2 Iyx3 Iyx4 Iyx5 Iyx6
syms Iy1 Iy2 Iy3 Iy4 Iy5 Iy6
syms Iyz1 Iyz2 Iyz3 Iyz4 Iyz5 Iyz6
syms Izx1 Izx2 Izx3 Izx4 Izx5 Izx6
syms Izy1 Izy2 Izy3 Izy4 Izy5 Izy6
syms Iz1 Iz2 Iz3 Iz4 Iz5 Iz6
Ix=[Ix1 Ix2 Ix3 Ix4 Ix5 Ix6];
Ixy=[Ixy1 Ixy2 Ixy3 Ixy4 Ixy5 Ixy6];
Ixz=[Ixz1 Ixz2 Ixz3 Ixz4 Ixz5 Ixz6];
Iyx=[Iyx1 Iyx2 Iyx3 Iyx4 Iyx5 Iyx6];
Iy=[Iy1 Iy2 Iy3 Iy4 Iy5 Iy6];
Iyz=[Iyz1 Iyz2 Iyz3 Iyz4 Iyz5 Iyz6];
Izx=[Izx1 Izx2 Izx3 Izx4 Izx5 Izx6];
Izy=[Izy1 Izy2 Izy3 Izy4 Izy5 Izy6];
Iz=[Iz1 Iz2 Iz3 Iz4 Iz5 Iz6];
I=sym('a',[3,3,6]);
for i=1:6
    I(:,:,i)=[Ix(i) Ixy(i) Ixz(i);Iyx(i) Iy(i) Iyz(i);Izx(i) Izy(i) Iz(i)];
end

syms q1dot q2dot q3dot q4dot q5dot q6dot
qdot=[q1dot q2dot q3dot q4dot q5dot q6dot];
[U_i,PosVectorCOM] = potential_energy(q, m);
T_i =kinemtic_energy(q, qdot, m, I);
T_total=0;
U_total=0;
for i=1:6
    T_total=T_total+T_i(i);
    U_total=U_total+U_i(i);
end
L=simplify(T_total-U_total);
end
