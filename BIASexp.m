function [BIAS]= BIASexp(k, a, b, AIRFLOWhat)
% disp(k);
% disp(AIRFLOWhat);

BIAS= a*exp(-k*AIRFLOWhat)+b;

% BIAS(AIRFLOWhat>150)=a*exp(-k*150)+b;
% BIAS(BIAS>1)=1;
% BIAS(BIAS<0)=0;
% scatter(AIRFLOWhat, BIAS);

% BIASx= linspace(0,150);
% BIASy= a*exp(-k*BIASx)+b;
% plot(BIASx,BIASy,'x');

