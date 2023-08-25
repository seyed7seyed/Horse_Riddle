% NextMove.m
%
%     2   3 
%   1       4
%       *
%   8       5
%     7   6
%


function [V,H,sf] = NextMove(Board,Access,Moves,nMove,sf)
 
for i=3:10; for j=3:10; if Moves(i,j)==nMove; v=i; h=j; end; end; end
 
% Neighbors --- N
N = [ v-1 h-2
      v-2 h-1
      v-2 h+1
      v-1 h+2
      v+1 h+2
      v+2 h+1
      v+2 h-1
      v+1 h-2 ]; 

% Finding Accessability of Neighbours
C = [ 1   Access( N(1,1), N(1,2) )
      2   Access( N(2,1), N(2,2) )
      3   Access( N(3,1), N(3,2) )
      4   Access( N(4,1), N(4,2) )
      5   Access( N(5,1), N(5,2) )
      6   Access( N(6,1), N(6,2) )
      7   Access( N(7,1), N(7,2) )
      8   Access( N(8,1), N(8,2) ) ];  

% Finding Unavailavle Rooms
Red = [];
for i=1:8
    if C( i,2 ) == 0    &&    Board( N(i,1), N(i,2) ) == 1
       Red = [ Red; i ];
    end
end
C(Red,:) = [];

% Sorting based on Accessability
n = size(C,1);  
for j=1:n-1
    for i=1:n-1
        [ i j ];
        if C(i+1,2) < C(i,2)
           temp    = C(i,:);
           C(i,:)  = C(i+1,:);
           C(i+1,:)= temp;
        end
    end
end

if length(C) >= 1
    minAccess = C(1,2);  
    minAccessRooms = [];
    for i = 1:n
        if C(i,2) == minAccess
         minAccessRooms = [ minAccessRooms; C(i,1) ];
        end
    end

    m = length(minAccessRooms);

    randy = [];
    for i = 1:m
        randy = [ randy; ceil(rand(1)*10000) ];
    end
    rMin = min(randy);
    for i = 1:m
        if randy(i) == rMin
           nMin = i;
        end
    end

    Winner = minAccessRooms(nMin);

    if Winner == 1
        V = v-1;
        H = h-2;
    elseif Winner == 2
        V = v-2;
        H = h-1;
    elseif Winner == 3
        V = v-2;
        H = h+1;
    elseif Winner == 4
        V = v-1;
        H = h+2;
    elseif Winner == 5
        V = v+1;
        H = h+2;
    elseif Winner == 6
        V = v+2;
        H = h+1;
    elseif Winner == 7
        V = v+2;
        H = h-1;
    elseif Winner == 8
        V = v+1;
        H = h-2;
    end

else
    V = v;
    H = h; 
end

end