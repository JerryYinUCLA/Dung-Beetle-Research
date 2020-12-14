function [ Trial ] = Write_To_Excel_8( Trial_Num, D_c, R_c, B_c, V_c, Error_Sig, Chased,n )
xlswrite('Multi_Chaser.xlsx',Trial_Num,'Error3',['A',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',D_c,'Error3',['B',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',R_c,'Error3',['C',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',B_c,'Error3',['D',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',V_c,'Error3',['E',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',Error_Sig,'Error3',['F',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',Chased,'Error3',['G',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',n,'Error3',['H',num2str(Trial_Num+2)]);
Trial = Trial_Num + 1;

end
