file=uigetfile('*.xlsx');
inp = xlsread(file,1); 
figure;
plot(inp);title('Input Signal')

inp9=inp*0.98;
figure;
plot(inp9);title('Input Signal')

save A9 inp9