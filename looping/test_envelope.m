clear;
clc;

[y,Fs] = audioread('Xia_a.wav');
y = y(3000:end-3000);
[env_up,env_down] = envelope(y,500,'peak');
err = env_up-env_down;
amp = 0.3;
fix_y = y;
for i = 1:size(y,1)
    if(y(i)>0)
        fix_y(i) = y(i)*(amp/env_up(i));
    else
        fix_y(i) = -y(i)*(amp/env_down(i));    
    end
end
subplot(2,1,1);
plot(y);
subplot(2,1,2);
plot(fix_y);
audiowrite('result.wav',fix_y,44100);