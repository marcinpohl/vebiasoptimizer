function [FILTER]= FILTERgenerator(a, b, MAFgsec)

FILTER= a*MAFgsec+b;
% FILTER(MAFgsec>=150) = a*150+b;

% FILTER(FILTER>1)= 1;
% FILTER(FILTER<0)= 0;


% FILTERx= linspace(0,150);
% FILTERy= a*FILTERx+b;
% plot(FILTERx, FILTERy, '-.');