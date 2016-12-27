
function distj = withinc(M, v, Ucurr, xc)
xnpts=0;
xtemp=0;
valuecalc=0;
for xi=1:300
    if Ucurr(xc,xi)==1
        xnpts=xnpts+1;
        xdist=0;
%         for p=1:4
%             xtemp=M(xi,p)-v(xc,p);
%             xdist=xdist+(xtemp*xtemp);
%         end
        valuecalc=valuecalc+sqrt(sumsqr((M(xi,:)-v(xc,:))));;%sqrt(xdist);
    end
end
distj=valuecalc/xnpts;
end