function [TEMP]= TEMPfiltering(TEMPc, MAT, FILTER)

TEMP=zeros(size(TEMPc));
TEMP(1)=MAT(1);

for i= 2:length(TEMPc)
    TEMP(i)= TEMP(i-1) + FILTER(i)*(TEMPc(i)-TEMP(i-1));
end
% plot(ECTk, 'DisplayName', 'ECTk', 'YDataSource', 'ECTk'); hold all; plot(IATk, 'DisplayName', 'IATk', 'YDataSource', 'IATk'); plot(TEMPc, 'DisplayName', 'TEMPc', 'YDataSource', 'TEMPc'); plot(TEMPd, 'DisplayName', 'TEMPd', 'YDataSource', 'TEMPd');  hold off; figure(gcf)