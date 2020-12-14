function [ Trial ] = Write_To_Excel_2(Trial_Num,D_Type,Radius,Vel,Delta_t,Sig,Num,Pen,Thresh,Mean_T,Mean_L,CI_T1,CI_T2,CI_L1,CI_L2)
xlswrite('Sigma_Data.xlsx',Trial_Num,'Data_Adj_Error_Bound',['A',num2str(Trial_Num+2)]);
if (strcmp(D_Type,'Bimodal'))
    xlswrite('Sigma_Data.xlsx',{D_Type},'Data_Adj_Error_Bound',['B',num2str(Trial_Num+2)]);
else
    xlswrite('Sigma_Data.xlsx',{D_Type},'Data_Adj_Error_Bound',['B',num2str(Trial_Num+2)]);
end
xlswrite('Sigma_Data.xlsx',Radius,'Data_Adj_Error_Bound',['C',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',Vel,'Data_Adj_Error_Bound',['D',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',Delta_t,'Data_Adj_Error_Bound',['E',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',Sig,'Data_Adj_Error_Bound',['F',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',Num,'Data_Adj_Error_Bound',['G',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',Pen,'Data_Adj_Error_Bound',['H',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',Thresh,'Data_Adj_Error_Bound',['I',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',{Mean_T},'Data_Adj_Error_Bound',['J',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',{Mean_L},'Data_Adj_Error_Bound',['K',num2str(Trial_Num+2)]);
string1 = ['[',num2str(CI_T1),',',num2str(CI_T2),']'];
string2 = ['[',num2str(CI_L1),',',num2str(CI_L2),']'];
xlswrite('Sigma_Data.xlsx',{string1},'Data_Adj_Error_Bound',['L',num2str(Trial_Num+2)]);
xlswrite('Sigma_Data.xlsx',{string2},'Data_Adj_Error_Bound',['M',num2str(Trial_Num+2)]);
if (strcmp(D_Type,'Bimodal'))
    xlswrite('Sigma_Data.xlsx',1-Mean_T/129.61,'Data_Adj_Error_Bound',['N',num2str(Trial_Num+2)]);
else
    xlswrite('Sigma_Data.xlsx',1-Mean_T/125.46,'Data_Adj_Error_Bound',['N',num2str(Trial_Num+2)]);
end
Trial = Trial_Num + 1;
end


