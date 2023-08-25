% Accessability.m

function [ A ] = Accessability( Board )

A = zeros(12,12);
for i = 3:10
    for j = 3:10 
        if Board(i,j) == 1.0;
        else
           if Board(i+2,j+1) == 0;  A(i,j) = A(i,j)+1; end
           if Board(i+2,j-1) == 0;  A(i,j) = A(i,j)+1; end
           if Board(i-2,j+1) == 0;  A(i,j) = A(i,j)+1; end
           if Board(i-2,j-1) == 0;  A(i,j) = A(i,j)+1; end
           if Board(i+1,j+2) == 0;  A(i,j) = A(i,j)+1; end
           if Board(i+1,j-2) == 0;  A(i,j) = A(i,j)+1; end
           if Board(i-1,j+2) == 0;  A(i,j) = A(i,j)+1; end
           if Board(i-1,j-2) == 0;  A(i,j) = A(i,j)+1; end 
        end
    end
end

end