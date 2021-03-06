[p,q] = meshgrid(0:0.1:1,0:0.1:1);
u = [[2 2];[-1 3];[3 -1];[-4 -4]]
p_u = u(1,1)*p.*q+u(2,1)*p.*(1-q)+u(3,1)*(1-p).*(q)+u(4,1)*(1-p).*(1-q)
q_u = u(1,2)*p.*q+u(2,2)*p.*(1-q)+u(3,2)*(1-p).*(q)+u(4,2)*(1-p).*(1-q)

hold on;
surf(p,q,p_u);
surf(p,q,q_u);
