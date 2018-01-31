

for di=1:1:9
    
    file = strcat(int2str(di),'.xlsx');
    cd DS_train    
       inp = xlsread(file,1); 
    cd .. 
    figure;
    plot(inp);
filt_sig=medfilt2(inp,[1 3]);
[L H]=dwt(filt_sig,'haar');

feat1=min(L);
feat2=max(L);
feat3=entropy(L);

dfeatures(:,di) = (feat1+feat2+feat3)/5;
end
disp(dfeatures);


%%%%%Neural network creation and training 

%%%%Assigning target to each class features
Nc = 3; T=1;
save dfeatures dfeatures;
for dfi=1:size(dfeatures,2)
   
    if Nc<1
      T = T+1;
      Nc =2;
      acti(:,dfi) = T; 
    else
      acti(:,dfi) = T;  
      Nc = Nc-1;  
    end
end
       
actv = ind2vec(acti)   %%%%%Indices to vector creation

netp = newpnn(dfeatures,actv)   %%%%network training

save netp netp;

helpdlg('NNtraining completed');

return;  















