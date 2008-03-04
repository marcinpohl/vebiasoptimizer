function [out]= ofun6(x)
global DYNAIRgsec IATk ECTk MATk paramVEcomponents MAPkpa CAM0 CAM1 CAM2 GMVEhat BIASexpc FILTERexpc ZONE SPEEDkmh coefs TEMPc TEMPd weights
GMVEhat= zeros(size(CAM0));
weights= zeros(size(CAM0));
BIASexpc= BIASexp(x(1), x(2), x(3) , DYNAIRgsec);
TEMPc= TEMPbias(IATk, ECTk, BIASexpc);
FILTERexpc= FILTERgenerator(x(4), x(5), DYNAIRgsec);
TEMPd= TEMPfiltering(TEMPc, MATk, FILTERexpc);
for zone=1:max(ZONE)
    z=(ZONE==zone);
    if sum(z)>15
        [coefs(:,zone),robuststats]= robustfit(paramVEcomponents(z,2:6),(CAM2(z).*TEMPd(z)./MAPkpa(z)),'talwar');        
        GMVEhat(z)= paramVEcomponents(z,:) * coefs(:,zone);
        weights(z)= robuststats.w;
    end
end
CAM3a= CAM3gen(GMVEhat, MAPkpa, TEMPd);
out= sqrt(sum((CAM2(logical(weights)) - CAM3a(logical(weights))).^2)/(sum(weights)));
% out= norm(MATk - TEMPd);