[x Fs] = audioread('my_a2.wav');
param.sr = Fs;
param.hop = 1;
[f0 t] = yin_f0(x,param);  %get freq_tbl


target_f = 146;
% pp_f = spline(t,f0);
% f0_dense = ppval(pp_f,t(1):t(end));
% pp_x = spline(t(1):t(end),x(t(1):t(end)));
% ana_pnt = cumsum(target_f./f0_dense)'+1;
% x_str_len = ceil(ana_pnt(end));
y = zeros([length(x)*2,1]);  %create an zero array large enough
ana_pnt  = t(1);
i=1;
while ceil(ana_pnt) < t(end)
%    y(i) = ppval(pp_x,ana_pnt);
   y(i) = x(floor(ana_pnt));
   ana_pnt=ana_pnt+ target_f/f0(floor(ana_pnt));
%    ana_pnt= ana_pnt+ target_f/ppval(pp_f,ana_pnt);
    i=i+1;
%    if mod(i,100) == 0 
%         disp(i);
%    end
end
y = y(1:i);
[y_f0 y_t] = yin_f0(y,param);