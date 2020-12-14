function [ Grid_Matrix ] = Update_Grid( Grid_Matrix, Pos1, Pos2, Grid_Size )
x = ceil(Pos1/Grid_Size)+round(size(Grid_Matrix,1)/2);
y = ceil(Pos2/Grid_Size)+round(size(Grid_Matrix,2)/2);
Grid_Matrix(x,y) = 1;
end

