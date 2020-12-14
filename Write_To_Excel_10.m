function [ Trial ] = Write_To_Excel_10( Trial_Num, D_c, R_c, B_c, V_c,Sigma, Error_Sig, Chased,n )
xlswrite('Multi_Chaser.xlsx',Trial_Num,'Error_Sig2',['A',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',D_c,'Error_Sig2',['B',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',R_c,'Error_Sig2',['C',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',B_c,'Error_Sig2',['D',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',V_c,'Error_Sig2',['E',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',Sigma,'Error_Sig2',['F',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',Error_Sig,'Error_Sig2',['G',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',Chased,'Error_Sig2',['H',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',n,'Error_Sig2',['I',num2str(Trial_Num+2)]);
Trial = Trial_Num + 1;

end
