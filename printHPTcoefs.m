
PARAMnames={'constant';'MAP';'MAPsquare';'RPM';'RPMsquare';'MAP*RPM'};
format long
for i=1:length(PARAMnames)
    disp(   PARAMnames(i));
    disp(    coefs(i,:));
end
    
    