function [ Trial ] = Write_To_Excel_3(Trial_Num,D_Type,Radius,Vel,Delta_t,Sig,Num,Pen,Int,Mean_T,Mean_L,CI_T1,CI_T2,CI_L1,CI_L2,time)
xlswrite('Time_vs_Sigma.xlsx',Trial_Num,'Sheet3',['A',num2str(Trial_Num+2)]);
if (strcmp(D_Type,'Bimodal'))
    xlswrite('Time_vs_Sigma.xlsx',{D_Type},'Sheet3',['B',num2str(Trial_Num+2)]);
else
    xlswrite('Time_vs_Sigma.xlsx',{D_Type},'Sheet3',['B',num2str(Trial_Num+2)]);
end
xlswrite('Time_vs_Sigma.xlsx',Radius,'Sheet3',['C',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma.xlsx',Vel,'Sheet3',['D',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma.xlsx',Delta_t,'Sheet3',['E',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma.xlsx',Sig,'Sheet3',['F',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma.xlsx',Num,'Sheet3',['G',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma.xlsx',Pen,'Sheet3',['H',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma.xlsx',Int,'Sheet3',['I',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma.xlsx',{Mean_T},'Sheet3',['J',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma.xlsx',{Mean_L},'Sheet3',['K',num2str(Trial_Num+2)]);
string1 = ['[',num2str(CI_T1),',',num2str(CI_T2),']'];
string2 = ['[',num2str(CI_L1),',',num2str(CI_L2),']'];
xlswrite('Time_vs_Sigma.xlsx',{string1},'Sheet3',['L',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma.xlsx',{string2},'Sheet3',['M',num2str(Trial_Num+2)]);
xlswrite('Time_vs_Sigma.xlsx',time,'Sheet3',['N',num2str(Trial_Num+2)]);
Trial = Trial_Num + 1;
end

