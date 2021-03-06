function []= plotBIASandFILTER(params)
% plot(TEMPd, 'DisplayName', 'TEMPd', 'YDataSource', 'TEMPd');
% hold all;
% plot(TEMPc, 'DisplayName', 'TEMPc', 'YDataSource', 'TEMPc'); 
% plot(IATk, 'DisplayName', 'IATk', 'YDataSource', 'IATk'); 
% plot(ECTk, 'DisplayName', 'ECTk', 'YDataSource', 'ECTk');  
% hold off; 
% figure(gcf)
k=params(1);
a=params(2);
b=params(3);
c=params(4);
d=params(5);

hold off;
BIASx= 0:4:128;
BIASy= 0:20:160;
[x,y]=meshgrid(BIASx,BIASy);
BIASz= a.*exp(-k.*x.*y)+b;
surf(BIASx,BIASy,BIASz);
BIAStable= griddata(BIASx,BIASy,BIASz,x,y);
dlmwrite('BIAStable.csv',BIAStable,'delimiter',',','precision',5);

figure
FILTERx= 0:8:128;
FILTERy= c*FILTERx+d;   
plot(FILTERx, FILTERy, '-.');
figure(gcf);
dlmwrite('FILTERtable.csv',FILTERy,'delimiter',',','precision',5);