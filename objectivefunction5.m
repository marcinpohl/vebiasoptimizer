function [out]= objectivefunction5(x)

% clear TEMPc BIASexpc out FILTERexpc
global DYNAIRgsec IATk ECTk MATk paramVEcomponents MAPkpa CAM0 CAM1 CAM1s CAM2s CAM2 CAM3 GMVEhat IPW1 IFRgsec AFR AFRwb coefs BIASexpc FILTERexpc ZONE

GMVEhat= zeros(size(CAM0));
BIASexpc= BIASexp(x(1), x(2), x(3) , DYNAIRgsec);
TEMPc= TEMPbias(IATk, ECTk, BIASexpc);
FILTERexpc= FILTERgenerator(x(4), x(5), DYNAIRgsec);
TEMPd= TEMPfiltering(TEMPc, MATk, FILTERexpc);

% for zone=1:max(ZONE)
%     p= paramVEcomponents(find(ZONE==zone),:);
%     if length(p(:))>42
%         c= CAM0(ZONE==zone);
%         t= TEMPd(ZONE==zone);
%         m= MAPkpa(ZONE==zone);
%         coefs(:, zone)= p\(c.*t./m);
%         GMVEhat(find(ZONE==zone))= p*coefs(:,zone);
%     end
% end
%     plotGMVE(coefs);   %  DEBUG: plotGMVE

% CAM3a= CAM3gen(GMVEhat, MAPkpa, TEMPd);
% out= norm(CAM2s - CAM3a);
out= norm(MATk - TEMPd);

% AFRhat= 1000* CAM3a./(IPW1.*IFRgsec);
% out= norm(AFR - AFRhat);