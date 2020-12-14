function [ Trial ] = Write_To_Excel_6(Trial_Num,D_Type,Radius,Vel,Delta_t,Sig,Num,Pen,Int,Err,Mean_T,Mean_L,CI_T1,CI_T2,CI_L1,CI_L2,time)
xlswrite('Time_vs_Sigma (Error).xlsx',Trial_Num,'Sheet1',['A',num2str(Trial_Num+2)]);
if (strcmp(D_Type,'Bimodal'))
    xlswrite('Time_vs_Sigma (Error).xlsx',{D_Type},'Sheet1',['B',num2str(Trial_Num+2)]);
else
    xlswrite('Time_vs_Sigma (Error).xlsx',{D_Type},'Sheet1',['B',num2str(Trial_Num+2)]);
end
xlswrite('Time_vs_Sigma (Error).xlsx',Radius,'Sheet1',['C',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma (Error).xlsx',Vel,'Sheet1',['D',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma (Error).xlsx',Delta_t,'Sheet1',['E',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma (Error).xlsx',Sig,'Sheet1',['F',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma (Error).xlsx',Num,'Sheet1',['G',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma (Error).xlsx',Pen,'Sheet1',['H',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma (Error).xlsx',Err,'Sheet1',['I',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma (Error).xlsx',{Mean_T},'Sheet1',['J',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma (Error).xlsx',{Mean_L},'Sheet1',['K',num2str(Trial_Num+2)]);
string1 = ['[',num2str(CI_T1),',',num2str(CI_T2),']'];
string2 = ['[',num2str(CI_L1),',',num2str(CI_L2),']'];
xlswrite('Time_vs_Sigma (Error).xlsx',Int,'Sheet1',['L',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma (Error).xlsx',{string1},'Sheet1',['M',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma (Error).xlsx',{string2},'Sheet1',['N',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma (Error).xlsx',time,'Sheet1',['O',num2str(Trial_Num+2)]);
Trial = Trial_Num + 1;
end

