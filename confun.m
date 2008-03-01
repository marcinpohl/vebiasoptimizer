function [c, ceq] = confun(x)
% Nonlinear inequality constraints
% c = [1.5 + x(1)*x(2) - x(1) - x(2); -x(1)*x(2) - 10];
global BIASexpc FILTERexpc GMVEhat DYNAIRgsec SPEEDkmh

% c= [x(2)*exp(-x(1)*DYNAIRgsec.*SPEEDkmh)+x(3) - 1;
%     -(x(2)*exp(-x(1)*DYNAIRgsec.*SPEEDkmh)+x(3)) ;
%     x(4)*DYNAIRgsec+x(5) - 1;
%     -(x(4)*DYNAIRgsec+x(5)); 
%     max(GMVEhat) - 4.096;
%     min(GMVEhat)
%     ];

% why calculate it over again if we got bias/filter stored already
Bmax= max(BIASexpc);   % keep bias/filter between 0 and 1
Bmin= min(BIASexpc);
Fmax= max(FILTERexpc);
Fmin= min(FILTERexpc);
GMVEmax= max(GMVEhat); % keep gmve between 0 and 4.096
GMVEmin= min(GMVEhat);

c= [(Bmax - 0.999);
    (-Bmin) ;
    (Fmax - 0.999);
    (-Fmin) ;
    (GMVEmax - 4096);
    (-GMVEmin);
     ];

% Nonlinear equality constraints
ceq = [];