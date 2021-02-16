n=500; 
A = spdiags((1:n)',(0),n,n);
xsol = ones(n,1);
b = A*xsol;

[x,fl0,rr0,it0,r] = pcg(A,b,1e-6,4*n,[],[],zeros(n,1));
if(fl0==0)
    disp("yes")
end

n=500;
A = spdiags([linspace(1,2,n/2)';linspace(1000,1001,n/2)'],(0),n,n);
xsol = ones(n,1); 
b = A*xsol;

[x1,fl1,rr1,it1,r1] = pcg(A,b,1e-6,4*n,[],[],zeros(n,1));
if(fl0==0)
    disp("yes")
end

yline(1e-6,'r--');

set(0, 'DefaultAxesFontSize', 18);
set(0, 'DefaultLineLineWidth', 2);

figure;
% str = {'Straight Line Plot','from 1 to 10'};
% annotation('textbox',dim,'String',str,'FitBoxToText','on');
semilogy(0:length(r)-1,r/norm(2),'bo-'); hold on;
semilogy(0:length(r1)-1,r1/norm(2),'g-'); hold on;
txt = {'Norm 2 of residual error:',rr0};
text(75,1000,txt,'FontSize',14)
l  = norm(rr0,2);
yline(1e-6,'r--');

legend('No preconditioner');
xlabel('Iteration number')
ylabel('Relative residual')
