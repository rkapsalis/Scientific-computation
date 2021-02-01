function P = band_stats(mxid, p)
%Author: Ρ.ΚΑΨΑΛΗΣ, ΑΜ 1056289, Date:01/02/2021
 [r,c] = size(mxid);
 
 if(isa(mxid,'integer'))
      A = ssget(mxid);
 elseif(isa(mxid,'char'))
      A = ssget(mxid);
 elseif(((r > 1) || (c > 1)) && isnumeric(mxid))
      A = mxid;
 else
     disp("Wrong input given, please try again.");
 end
 
 %non zero elements of matrix A
 nz_A = nnz(A);
 % size of matrix
 N = size(A,1);
 disp(N); 
 P = [];
 for k=1:2:2*p+1
    % create band matrix
    Aband = spdiags( spdiags(A, -k:k), -k:k, N, N );
    Aband = full( Aband );
    %non zero elements of band matrix
    nz_Aband = nnz(Aband);
    rnnz = nz_Aband/nz_A;
    rerr = norm(A - Aband,'fro')/norm(A,'fro');
    P = [P; rnnz, rerr];
 end
 disp(Aband);
 disp("P-matrix")
 disp(P);
 y = (1: 2: 2*p+1);
figure();
semilogy(y, P(:,1), 'r-*');
hold on
semilogy(y, P(:,2), 'b-o');
title('rnnz');
xlabel('k');
legend('rnnz','rerr');
end
