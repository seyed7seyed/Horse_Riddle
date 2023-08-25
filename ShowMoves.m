% ShowMoves.m

function ShowMoves( Moves )
 
Moves( [1,2,11,12], : ) = [];
Moves( :, [1,2,11,12] ) = [];


figure(93939); clf; hold on; axis equal;
xlim([0 18])
ylim([0 18])
title('The Knight is running!')
for i=1:2:17 
    plot([1 17],[i i],'-k','LineWidth',1)
    plot([i i],[1 17],'-k','LineWidth',1)
end

for n = 1:64
    for i=1:8
        for j = 1:8
            if Moves(i,j) == n
               h = 2*j-0.3;
               v = 18-2*i;
               text(h,v,num2str(n))
               pause(0.10)
            end
        end
    end
end
title('Congrats! The Knight made 64 moves!')
 
end