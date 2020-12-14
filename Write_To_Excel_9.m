function [ Trial ] = Write_To_Excel_9( Trial_Num, D_c, R_c, B_c, V_c, Sigma, Check_Time, Chased,n )
xlswrite('Multi_Chaser.xlsx',Trial_Num,'Periodic_Sig2',['A',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',D_c,'Periodic_Sig2',['B',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',R_c,'Periodic_Sig2',['C',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',B_c,'Periodic_Sig2',['D',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',V_c,'Periodic_Sig2',['E',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',Sigma,'Periodic_Sig2',['F',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',Check_Time,'Periodic_Sig2',['G',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',Chased,'Periodic_Sig2',['H',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',n,'Periodic_Sig2',['I',num2str(Trial_Num+2)]);
Trial = Trial_Num + 1;

end
