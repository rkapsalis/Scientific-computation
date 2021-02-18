function [y]= tensor_paths(A,k)
%Author: Ρ.ΚΑΨΑΛΗΣ, ΑΜ 1056289, Date:17/02/2021
%-------erotima 3.1-----------
G(:,:,1) = A^1;
for j=2:k
    G(:,:,j) = A*G(:,:,j-1);
end
G = tensor(G);
%-------erotima 3.2-----------
for i=1:3
    for j=1:3
      E = tenmat(G(i,j,:),1);
    end
end
C = sum(tenmat(G(i,j,:),1).data);
%-------erotima 3.3-----------
D = collapse(G,1:k);
disp(C);
disp(D)
end
