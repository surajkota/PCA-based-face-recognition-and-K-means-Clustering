function distji = betweenc(v,tci,tcj)
distji=0;
% for p=1:4
%     ttemp=v(tci,p)-v(tcj,p);
%     distji=distji+(ttemp*ttemp);
% end
distji=sqrt(sumsqr((v(tci,:)-v(tcj,:))));%sqrt(distji);
end