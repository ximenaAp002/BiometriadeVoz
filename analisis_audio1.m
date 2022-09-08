function analisis_audio1(nombre)
   nombre1 = nombre;
   [y,Fs] = audioread(nombre1); %lee el archivo de audio
   duracion = (length(y)/Fs); %Guarda su duracion en segundos
  
   t = linspace(0,duracion,length(y));
  
   global media;
   global varianza;
   global desviacion;
   global asimetria;
   global curtosis;
   
   media = mean(y);
   varianza = var(y);
   desviacion = std(y);
   asimetria = skewness(y);
   curtosis = kurtosis(y);
   datos_voz = table(media,varianza,desviacion,asimetria,curtosis);
   disp(datos_voz);
  
   figure
   hold on
  
   subplot(1,2,1)
   plot(t, y)
   title('Audio')
   xlabel('Segundos')
   ylabel('Amplitud')
      
   L = length(y);
   NFFT = 2^nextpow2(L);
   Y1 = fft(y);
   f1 = Fs/2*linspace(0,1,NFFT/2);
   subplot(1,2,2)
   plot(f1, 2*abs(Y1(1:NFFT/2)));
   xlabel('Hz')
   ylabel('Amplitud')
   title('Frecuencias')
   xlim([0 6000])
   hold off
end
