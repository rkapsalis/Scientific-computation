function [d]= get_all_paths(G)
%Author: Ρ.ΚΑΨΑΛΗΣ, ΑΜ 1056289, Date:19/02/2021
if(isa(G,'tensor'))
    d = collapse(G,3);
else
    disp("G must be tensor, please try again.");
    return
end
end
