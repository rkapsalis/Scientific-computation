n=500;
m=100;
A = randn(n); 
xsol = rand(n,1);
b= A*xsol;
tol = 1e-6;
tic;[x,fl0,rr0,it0,r] = pcg(A,b,1e-6,4*n,[],[],zeros(n,1));toc;
tic;[x1,fl1,rr1,it1,rv1] = gmres(A,b,m,1e-6,4*n,[],[],zeros(n,1));toc;
tic;[x2,fl2,rr2,it2,rv2] = gmres(A,b,n,1e-6,4*n,[],[],zeros(n,1));toc;
tic;x = A\b;toc;

set(0, 'DefaultAxesFontSize', 18);
set(0, 'DefaultLineLineWidth', 2);
figure;

semilogy(0:length(r)-1,r/norm(2),'bo-'); hold on;
semilogy(0:length(rv1)-1,rv1/norm(2),'kd-');hold on;
semilogy(0:length(rv2)-1, rv2/norm(2), 'gp-'); hold on;
yline(tol,'r--');
legend('pcg','gmres_m','gmres_n','Tol','Location','East');
ylabel('final relative error');
xlabel('maxit');
