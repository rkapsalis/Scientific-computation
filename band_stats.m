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
 for k=0:p-1
    % create band matrix
    Aband = spdiags( spdiags(A, -k:k), -k:k, N, N );
    % convert sparse matrix to full
    Aband = full( Aband );
    % non zero elements of band matrix
    nz_Aband = nnz(Aband);
    % number of non zero elements in relation to A
    rnnz = nz_Aband/nz_A;
    % relative error
    rerr = norm(A - Aband,'fro')/norm(A,'fro');
    % append rerr and rnnz to P array
    P = [P; rnnz, rerr];
 end
 disp(Aband);
 disp("P-matrix")
 disp(P);
 y = (1:2:2*p-1);
figure();
plot(y,P(:,1),y,P(:,2));
title(mxid);
xlabel('k');
legend('rnnz','rerr');
disp(k);
end
