function [ percent_area ] = Search_Area( Grid_Matrix )
summation = sum(Grid_Matrix(:));
all_area = pi()/4*size(Grid_Matrix,1)*size(Grid_Matrix,2);
percent_area = summation/all_area;
end

