function [val,col_idx,row_blk] = sp_mx2bcrs(A,nb)
%Author: Ρ.ΚΑΨΑΛΗΣ, ΑΜ 1056289, Date:17/01/2021
%A is a rectangular matrix nxn
blck_no = 0;
col_idx = 0;
row_idx = 0;
nnzb = 0;
sth = [];
val = [];
row_blk = [];
blck_row = [];

for x=1:nb:(n-nb+1)
    rowCount = 0; %row counter -- notifier
    nnzb = 0; % column counter 
    blck_row_no = 0;
    for y=1:nb:(n-nb+1)

        nnzb = nnzb + 1;
        block = A(x:x+nb-1,y:y+nb-1);

        if(any(block(:)~=0))      
          %rowCount = 0;
          blck_row_no = blck_row_no + 1;
          blck_no = blck_no + 1;
          sth = [sth,block];
          col_idx(blck_no) = nnzb;
          rowCount = 1;
        end

    end
    if(rowCount==1)
        if(row_idx==0)
           row_idx = row_idx + 1;
           blck_row(row_idx) = blck_row_no;
           row_blk(row_idx) = blck_no;            
        else 
            row_idx = row_idx + 1;
            blck_row(row_idx) = blck_row_no;            
            row_blk(row_idx) = row_blk(row_idx-1) + blck_row(row_idx-1);
        end
    end
end
if(rowCount==1)
   row_idx = row_idx + 1;
   blck_row(row_idx) = blck_row_no;           
   row_blk(row_idx) = row_blk(row_idx-1) + blck_row(row_idx-1);
end
val = reshape(sth,[nb,nb,blck_no]);
end
