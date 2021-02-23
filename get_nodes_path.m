function [c]= get_nodes_path(G,i,j)
%Author: Ρ.ΚΑΨΑΛΗΣ, ΑΜ 1056289, Date:19/02/2021
if(isa(G,'tensor'))
   c = collapse(G(i,j,:));
else
    disp("G must be tensor, please try again.");
    return
end
