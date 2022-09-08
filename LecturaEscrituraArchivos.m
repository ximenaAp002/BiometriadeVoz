clear %limpia los valores de todas las variables guardadas

%Grabacion de audio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% recObj = audiorecorder;
% recordblocking(recObj, 2);
% play(recObj);
% y = getaudiodata(recObj);
% Fs = 8000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Lectura de audio%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[y,Fs] = audioread("Ximena1.m4a"); %lee el archivo de audio
duracion = (length(y)/Fs); %Guarda su duracion en segundos
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%recorte de audio%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% samples = [1,duracion*Fs]; %defines un tamaño de ejemplo
% clear y Fs
% [y,Fs] = audioread("audio.ogg", samples);
%usas el ejemplo para recortar el audio original
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% sound(y, Fs); %reproduce el sonido
 
%escritura de un nuevo audio%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filename = 'ejemplo.wav';
% audiowrite(filename,y,Fs); %guarda el audio en un nuevo archivo
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t = linspace(0,duracion,length(y));
disp("La media es" + mean(y));
disp("La varianza es" + var(y));
disp("La desviacion estandar es" + std(y));
disp("La asimetria es" + skewness(y));
disp("La curtosis es" + kurtosis(y));
scatter(t,y);

figure
subplot(3,1,1)
hold on
plot(t,y)
title('Audio')
xlabel('Segundos')
hold off

subplot(3,1,2)
L = length(y);
NFFT = 2^nextpow2(L);
Y1 = fft(y);
f1 = Fs/2*linspace(0,1,NFFT/2);
plot(f1, 2*abs(Y1(1:NFFT/2)));
xlabel('Hz')
ylabel('Amplitud')
title('Frecuencias')





