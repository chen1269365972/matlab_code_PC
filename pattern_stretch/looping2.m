clear; clc; close all;
[y,fs] = audioread('_a_ao.wav');
val=0;
init_h_i =62000;
init_t_i = 69000;
find_max_win_len = 1000;
lap_len = 1000;
[v_1,h_i] = max(y(init_h_i:init_h_i+find_max_win_len));
[v_2,t_i] = max(y(init_t_i:init_t_i+find_max_win_len));

x = y(h_i+init_h_i:t_i+init_t_i);
x_len = size(x,1);
a = [1/lap_len:1/lap_len:1]';
b = flipud(a);

head=x(1:lap_len);
tail=x(x_len-lap_len+1:x_len);

lap = tail.*b +head.*a;
mid = x(lap_len+1:x_len-lap_len+1);
result = [lap;mid];
result = repmat(result,16,1);
% sound(result,44100);

hold on;
plot(x(x_len-1000+1:x_len).*b);
plot(x(1:1000).*a);
% plot(lap);
%  plot(head);
%  plot(tail);