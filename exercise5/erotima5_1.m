%Author: Ρ.ΚΑΨΑΛΗΣ, ΑΜ 1056289, Date:15/02/2021
%-----------------erotima 5.1.1----------------------
n=500; 
A = spdiags((1:n)',(0),n,n);
xsol = ones(n,1);
b = A*xsol;
% pcg without preconditioner
[x,fl0,rr0,it0,r] = pcg(A,b,1e-6,4*n,[],[],zeros(n,1));

%-----------------erotima 5.1.2----------------------
n=500;
C = spdiags([linspace(1,2,n/2)';linspace(1000,1001,n/2)'],(0),n,n);
xsol = ones(n,1); 
b1 = C*xsol;
% pcg without preconditioner
[x1,fl1,rr1,it1,r1] = pcg(C,b1,1e-6,4*n,[],[],zeros(n,1));

yline(1e-6,'r--');

set(0, 'DefaultAxesFontSize', 18);
set(0, 'DefaultLineLineWidth', 2);

figure;

semilogy(0:length(r)-1,r/norm(b),'bo-'); hold on;
semilogy(0:length(r1)-1,r1/norm(b1),'gs-'); hold on;
title("Convergence(5.1)")
yline(1e-6,'r--');

legend('A =spdiags([1:n]’,[0],n,n)','A =spdiags([linspace(1,2,n/2)’;linspace(1000,1001,n/2)’],[0],n,n)','tolerance');
xlabel('Iteration number')
ylabel('Relative residual')