    clc
    clear all
    close all
    
    cd Input    
       inp = xlsread('1.xlsx'); 
    cd .. 
    figure;
%     plot(inp);
%     disp(inp);
    
    Kinp=inp(1:3000,:);
    plot(Kinp);
    disp(Kinp);

    Kinp1=inp(200:600,:);
        figure;
     plot(Kinp1);
    Kinp2=inp(2200:2800,:);
        figure;
     plot(Kinp2);
    
    
    
    
    
    
%    feat=90-(sin(inp(3600))-sin(inp(1)))
    
    
%     [m n]=size(inp);
%     feat=mean(inp)+(sum(tan(inp))/(m));
%     disp(feat);
    

%     noi=rand([m n]);
%     linp=inp+noi;
%     figure;
%     plot(linp);
%     
%     k=medfilt2(linp',[1 360]);
%     figure;
%     plot(k-0.5);
%     disp(k);
%     
    
    
%     Input=reshape(inp,[],1);
% %     Input = Input(1:100:36001,:);
%     figure;
%     plot(Input);