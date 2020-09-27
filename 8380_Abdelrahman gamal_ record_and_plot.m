fs =44100;
time = 2;
recobj = audiorecorder(fs ,24 , 1);
for i=1:20
fprintf('Start speaking for audio #%d\n',i)
recordblocking(recobj ,time); % record 2 seconds
fprintf('Audio #%d ended\n',i)
%play(recObj);
x = getaudiodata(recobj);
%x = x - mean(x);
N = length(x);
t= linspace(0,time,N) ;
figure(i); plot(t,x),grid ;
xlabel('time')
ylabel('amplitude ')
title('time domain representation of x(t)')
file_name = sprintf('train/4/4_%d.wav',i);
audiowrite(file_name, x, recObj.SampleRate);
N=length(x);
time = N/fs;
x_k = abs(fft(x));
f = linspace(0,recObj.SampleRate,N);
figure(i+20);plot(f,x_k),grid;
xlabel('freq (Hz)')
ylabel('|x(f)|')
title('amplitude spectrum of x(t)')
end