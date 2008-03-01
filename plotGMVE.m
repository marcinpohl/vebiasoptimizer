function []= plotGMVE(coefslist)
MAP= 10:1:105;
RPM= 0:100:6800;
ZONES= zeros(length(RPM),length(MAP));

[m,r]= meshgrid(MAP,RPM);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MAPboundry= [0 30 45 60 75 90 105]; %7 elements
RPMboundry= [0 1000 1750 2500 3250 8000]; %6 elements
for ri=1:length(RPMboundry)-1   %start on lower boundry, stop one short 
    for mi=1:length(MAPboundry)-1
        RPMlo= RPMboundry(ri);
        RPMhi= RPMboundry(ri+1);
        MAPlo= MAPboundry(mi);
        MAPhi= MAPboundry(mi+1);
        ZONES(r > RPMlo & r <= RPMhi & m > MAPlo & m <= MAPhi)= (ri-1)*(length(MAPboundry)-1)+mi;
    end
end
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g2=zeros(size(m));
for zone=1:max(ZONES(:))
    coefs= coefslist(:,zone);
    %    C     +    M     +    R     +     M*R     +    M^2      +   R^2
    g= coefs(1)+m*coefs(2)+r*coefs(3)+m.*r*coefs(4)+m.*m*coefs(5)+r.*r*coefs(6);
%     g=[1 m r m.*r m.*m r.*r]*coefs;
    g2(ZONES==zone)= g(ZONES==zone);
end
figure
colormap hsv
surfc(MAP,RPM,g2);
axis([10 105 0 6600 0 4096])
dlmwrite('coefs.csv',coefslist,'delimiter',',','precision',6)
% [C,h]=contour(MAP,RPM,g2);
% clabel(C,h);