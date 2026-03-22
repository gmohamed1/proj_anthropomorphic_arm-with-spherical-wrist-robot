function T = transformation_func(q,d,a,alpha)
  
    T=[cosd(q) -sind(q)*cosd(alpha) sind(q)*sind((alpha)) a*cosd((q));
        sind(q) cosd(q)*cosd(alpha) -cosd(q)*sind(alpha) a*sind(q) ;
        0 sind(alpha) cosd(alpha) d;
        0 0 0 1];

end
