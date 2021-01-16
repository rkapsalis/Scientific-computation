function [val,col_idx,row_blk] = sp_mx2bcrs(A,nb)
%A is a rectangular matrix nxn
n = size(A);
Nd = n/nb;
blck_no = 0;
col_idx = 0;
row_idx = 0;
nnzb = 0;
sth = [];
val = [];
row_blk = [];
for x=1:nb:(n-nb+1)
    rowCount = 0; %row counter -- notifier
    nnzb = 0; % column counter    
    for y=1:nb:(n-nb+1)
        
        nnzb = nnzb + 1;
        block = A(x:x+nb-1,y:y+nb-1);
        
        if(any(block(:)~=0))
%           disp(block);
            if(rowCount==0)
                if(row_idx==0)
                   
                   row_idx = row_idx + 1;
                   row_ptr(row_idx) = blck_no;
                else 
                    row_idx = row_idx + 1;
                    row_ptr(row_idx) = blck_no;
                end
            end
          %rowCount = 0;
          blck_no = blck_no + 1;
          sth = [sth,block];
          col_idx(blck_no) = nnzb;

         end
    end
%     row_blk(x+1) = row_bl
end

val = reshape(sth,[nb,nb,blck_no]);
% disp(val);
% disp(col_idx);
disp(blck_no)
disp(row_ptr)