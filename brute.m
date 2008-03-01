
bestparams=zeros(5);
bestfun= 1e10;

krange= linspace(lb(1),ub(1),10);
arange= linspace(lb(2),ub(2),10);
brange= linspace(lb(3),ub(3),10);
crange= linspace(lb(4),ub(4),10);
drange= linspace(lb(5),ub(5),10);

for k= krange
    for a= arange
        for b= brange
            for c= crange
                for d= drange
                    disp([k a b c d]);
                    fun= objectivefunction5([k; a; b; c; d;]);
                    if fun < bestfun
                        bestfun= fun
                        bestparams=[k a b c d]
                    end
                end
            end
        end
    end
end
