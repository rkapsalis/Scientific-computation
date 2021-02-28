function [y]= spmv_bcrs(y,val,col_idx,row_blk,x)
%Author: Ρ.ΚΑΨΑΛΗΣ, ΑΜ 1056289, Date:18/01/2021

%number of non-zero blocks
n = size(val,3);
%dimension of each block
m = size(val,1);
%dimension of A
y_size = size(y,1);
new_ar=[];
%block dimension of A
rb_size = size(row_blk,2);
%initializations
mul_no = 0;
val_counter = 0;
val_counter1 = 0;
k1=0;
k2=0;
l1=0;
l2=0;

row_idx = 0;
counter = 0;
%for every non-zero block
for l=1:m:y_size
    counter = counter +1;
    row_idx = row_idx+1;
    %store indices for x and y
    new_ar(counter,:) = [l,l+m-1];    
end

%for every row_blk element -1
for j=1:rb_size-1
    %get number of non-zero blocks of each row
    mul_no = row_blk(j+1)-row_blk(j);
   
    %for every non-zero block
    for k=1:mul_no
        if(k==1) %first block
           val_counter1 = val_counter1 + 1;
           %get indices for y
           l1 = new_ar(j,1);
           l2 = new_ar(j,2); 
        end
        %increment val counter
        val_counter = val_counter + 1;
        %get indices for x
        k1 = new_ar(col_idx(val_counter),1);
        k2 = new_ar(col_idx(val_counter),2);       
        %calculate update for each row
        y(l1:l2) = y(l1:l2) + val(:,:,val_counter)*x(k1:k2);        
    end    
end
end