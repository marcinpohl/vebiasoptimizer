function [x,fval,exitflag,output,lambda,grad,hessian] = dean2b(x0,lb,ub)
% This is an auto generated M-file to do optimization with the Optimization Toolbox.
% Optimization Toolbox is required to run this M-file.

% Start with the default options
options = optimset;
% Modify options setting
options = optimset(options,'Display' ,'iter');
options = optimset(options,'PlotFcns' ,{  @optimplotx @optimplotfunccount @optimplotfval @optimplotconstrviolation });
options = optimset(options,'Diagnostics' ,'on');
options = optimset(options,'LargeScale' ,'off');
[x,fval,exitflag,output,lambda,grad,hessian] = ...
fmincon(@ofun6,x0,[],[],[],[],lb,ub,@confun,options);
