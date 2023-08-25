% LastMove.m

function [Moves, nMove] = LastMove( Board, Moves, nMove )

for i=3:10
    for j=3:10
        if Board(i,j) == 0
           v = i;
           h = j;
        end
    end
end

N = [ v-1 h-2
      v-2 h-1
      v-2 h+1
      v-1 h+2
      v+1 h+2
      v+2 h+1
      v+2 h-1
      v+1 h-2 ];

for i=1:8
    x = Moves( N(i,1), N(i,2) );
    if x == nMove
       Moves(v,h) = nMove+1;
       nMove = nMove+1;
    end
end

end