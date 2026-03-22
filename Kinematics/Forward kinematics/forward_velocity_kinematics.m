function V = forward_velocity_kinematics(q,q_dot)

j = jacobian_matrix(q);
V = j*transpose(q_dot);
end


