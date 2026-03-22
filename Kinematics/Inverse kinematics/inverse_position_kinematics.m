function  q_new = inverse_position_kinematics(max_iterations,q_0,X)
i=0;
q_00=q_0;
while i< max_iterations
    j_inv=inverse_jacobian_matrix(q_00);
    [tt,qq] = end_effec_num(q_00);
    q_new=transpose(q_00)-(j_inv)*(transpose(qq)-X);
    for i=1:6
        if(q_new(i,1)>360 | q_new(i,1)<-360 )
            q_new(i,1)=mod(q_new(i,1),360);
        end
    end
    q_00=transpose(q_new)
    q = q_new;

    i=i+1;
end
end

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              