clear; clc;

success = 'N';
while success == 'N'

[ Board, Moves ] = UnusedBoard();
Access           = Accessability( Board );
nMove            = 0; 

% First Move
[v,h]      = RandStart();
Board(v,h) = 1;
nAvMov     = Access(v,h)-1;  
Access     = Accessability( Board );
nMove      = nMove+1;
Moves      = SaveMove( Moves, v, h, nMove ); 
 

% OtherMoves 
while  nAvMov ~= -1 && nMove~=63 
    [V,H]      = NextMove(Board,Access,Moves,nMove); 
    Board(V,H) = 1;  
    nAvMov     = Access(V,H); 
    nMove      = nMove+1;
    Moves      = SaveMove( Moves, V, H, nMove );
    Access     = Accessability( Board );
end

% Last Moves
if nMove == 63
   [Moves, nMove] = LastMove(Board,Moves,nMove);  
end

if nMove == 64
   ShowCore(Moves);
   ShowMoves(Moves);
   success = 'Y';
end
 
end

 