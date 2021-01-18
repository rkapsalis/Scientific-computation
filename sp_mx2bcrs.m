function [val,col_idx,row_blk] = sp_mx2bcrs(A,nb)
%Author: Ρ.ΚΑΨΑΛΗΣ, ΑΜ 1056289, Date:17/01/2021

%A is a rectangular matrix nxn
n = size(A);
%initializations
blck_no = 0;
col_idx = 0;
row_idx = 0;
nnzb = 0;
temp_blk_array = [];
val = [];
row_blk = [];
blck_row = [];

%for any block row
for x=1:nb:(n-nb+1) 
    rowCount = 0; %row change flag
    nnzb = 0; % column counter 
    %set non zero block counter to zero
    blck_row_no = 0;
    
    %for any block column
    for y=1:nb:(n-nb+1)  

        nnzb = nnzb + 1;
        block = A(x:x+nb-1,y:y+nb-1);

        if(any(block(:)~=0))      
          %rowCount = 0;
          %get non-zero blocks of every row
          blck_row_no = blck_row_no + 1;
          %get total non-zero blocks
          blck_no = blck_no + 1;
          %get elements to store in val later
          temp_blk_array = [temp_blk_array,block];
          %get column index
          col_idx(blck_no) = nnzb;
          %row change flag
          rowCount = 1;
        end

    end
    %if row has at least 1 non zero block
    if(rowCount==1)
        if(row_idx==0)
           %increment row index counter
           row_idx = row_idx + 1;
           %store non-zero blocks for this row
           blck_row(row_idx) = blck_row_no;
           %calculate row block
           row_blk(row_idx) = blck_no;            
        else 
            %increment row index counter
            row_idx = row_idx + 1;
            %store non-zero blocks for this row
            blck_row(row_idx) = blck_row_no; 
            %calculate row block
            row_blk(row_idx) = row_blk(row_idx-1) + blck_row(row_idx-1);
        end
    end
end
%calculate last row_blk
if(rowCount==1)
   %increment row index counter
   row_idx = row_idx + 1;
   %store non-zero blocks for this row
   blck_row(row_idx) = blck_row_no;
   %calculate row block
   row_blk(row_idx) = row_blk(row_idx-1) + blck_row(row_idx-1);
end
val = reshape(temp_blk_array,[nb,nb,blck_no]);
end
