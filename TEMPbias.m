function [TEMP]= TEMPbias(IAT, ECT, BIAS)
TEMP=IAT+(ECT-IAT).*BIAS;
