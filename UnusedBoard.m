% UnusedBoard.m

function [ Board, Moves ] = UnusedBoard()

Board = zeros(12,12)+1;
Board([3:10],[3:10]) = 0;

Moves = zeros(12,12);

end