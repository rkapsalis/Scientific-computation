function [G]= tensor_paths(A,k)
%Author: Ρ.ΚΑΨΑΛΗΣ, ΑΜ 1056289, Date:17/02/2021
G(:,:,1) = A;
for j=2:k
    G(:,:,j) = A*G(:,:,j-1);
end
G = tensor(G);
end