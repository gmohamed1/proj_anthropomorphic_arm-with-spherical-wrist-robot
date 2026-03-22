function [Jacobian] = Jacobian_matrix(q)

positions = forward_pos_kin(q);
angles = Orientation(q);

for i=1:3
    for j=1:6
        Jacobian(i,j) = diff(positions(i),q(j));
        
    end
end

for i=1:3
    for j=1:6
        Jacobian(i+3,j) = diff(angles(i),q(j));
        
    end
end



end

