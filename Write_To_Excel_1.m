function [ Trial ] = Write_To_Excel_1(Trial_Num,D_Type,Radius,Vel,Delta_t,Sig,Num,Pen,Int,Mean_T,Mean_L,CI_T1,CI_T2,CI_L1,CI_L2)
xlswrite('Sigma_Data.xlsx',Trial_Num,'Data_Adj_Time_Int',['A',num2str(Trial_Num+2)]);
if (strcmp(D_Type,'Bimodal'))
    xlswrite('Sigma_Data.xlsx',{D_Type},'Data_Adj_Time_Int',['B',num2str(Trial_Num+2)]);
else
    xlswrite('Sigma_Data.xlsx',{D_Type},'Data_Adj_Time_Int',['B',num2str(Trial_Num+2)]);
end
xlswrite('Sigma_Data.xlsx',Radius,'Data_Adj_Time_Int',['C',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',Vel,'Data_Adj_Time_Int',['D',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',Delta_t,'Data_Adj_Time_Int',['E',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',Sig,'Data_Adj_Time_Int',['F',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',Num,'Data_Adj_Time_Int',['G',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',Pen,'Data_Adj_Time_Int',['H',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',Int,'Data_Adj_Time_Int',['I',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',{Mean_T},'Data_Adj_Time_Int',['J',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',{Mean_L},'Data_Adj_Time_Int',['K',num2str(Trial_Num+2)]);
string1 = ['[',num2str(CI_T1),',',num2str(CI_T2),']'];
string2 = ['[',num2str(CI_L1),',',num2str(CI_L2),']'];
xlswrite('Sigma_Data.xlsx',{string1},'Data_Adj_Time_Int',['L',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',{string2},'Data_Adj_Time_Int',['M',num2str(Trial_Num+2)]);
if (strcmp(D_Type,'Bimodal'))
    xlswrite('Sigma_Data.xlsx',1-Mean_T/129.61,'Data_Adj_Time_Int',['N',num2str(Trial_Num+2)]);
else
    xlswrite('Sigma_Data.xlsx',1-Mean_T/125.46,'Data_Adj_Time_Int',['N',num2str(Trial_Num+2)]);
end
Trial = Trial_Num + 1;
end

