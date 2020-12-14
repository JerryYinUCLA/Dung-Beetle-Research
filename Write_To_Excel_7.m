function [ Trial ] = Write_To_Excel_7( Trial_Num, D_c, R_c, B_c, V_c, Check_Time, Chased,n )
xlswrite('Multi_Chaser.xlsx',Trial_Num,'Periodic3',['A',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',D_c,'Periodic3',['B',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',R_c,'Periodic3',['C',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',B_c,'Periodic3',['D',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',V_c,'Periodic3',['E',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',Check_Time,'Periodic3',['F',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',Chased,'Periodic3',['G',num2str(Trial_Num+2)]);
xlswrite('Multi_Chaser.xlsx',n,'Periodic3',['H',num2str(Trial_Num+2)]);
Trial = Trial_Num + 1;

end

