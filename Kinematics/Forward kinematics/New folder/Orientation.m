function [Angles] = Orientation(q)
T = Total_T(q)
for i=1:3
    for j=1:3
     R(i,j) = T(i,j);   
    end
end

x = forward_pos_kin(q);


pos = transpose(R*[1;1;1])

for i=1:3
Angles(i) = atand(1/pos(i));
end
% pos = R*transpose(x) ;

% alpha = atand(pos(1,1));
% beta = atand(pos(2,1));
% gamma = atand(pos(3,1));

% beta =  -asind(T(3,1));
% alpha = atand((T(3,2)/cosd(beta))/(T(3,3)/cosd(beta)));
% gamma = atand((T(2,1)/cosd(beta))/(T(1,1)/cosd(beta)));
%  Angles = [alpha, beta, gamma];

end

