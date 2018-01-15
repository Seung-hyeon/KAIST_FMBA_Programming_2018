x = -20:0.2:20;

y = -20:0.2:20;

[x,y] = meshgrid(x, y);

r = sqrt(x.^2 + y.^2);
z = sin(r) ./ r;

surf(x, y, z);

title('sin(r)/r')

xlabel('x')

ylabel('y')

zlabel('z')

colorbar()