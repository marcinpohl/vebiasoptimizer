function [x,fval,exitflag,output,lambda,grad,hessian] = adrian3(x0,lb,ub)
% This is an auto generated M-file to do optimization with the Optimization Toolbox.
% Optimization Toolbox is required to run this M-file.

% Start with the default options
options = optimset;
% Modify options setting
options = optimset(options,'Display' ,'iter');
options = optimset(options,'PlotFcns' ,{  @optimplotx @optimplotfunccount @optimplotfval @optimplotconstrviolation });
options = optimset(options,'LargeScale' ,'off');
[x,fval,exitflag,output,lambda,grad,hessian] = ...
fminunc(@ofun6,x0,[],[],[],[],[],[]);
