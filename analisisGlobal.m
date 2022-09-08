function analisisGlobal(nombre)
filas = [10 6];
columnas = {'N','Media','Varianza','Desviación estandar','Asimetría','Curtosis'};
tipo = {'double','double','double','double','double','double'};
global datos_voz
datos_voz = table('Size',filas,'VariableTypes',tipo,'VariableNames',columnas);
figure
hold on
    for i = 1:10 %Tenemos 10 audios de cada persona, un total de 50
        %Verificamos que nuestros archivos correspondan con las extensiones
        nombre1 = nombre;
        if nombre1 == "Monse" || nombre1 == "Luis"
           [y,Fs] = audioread(nombre1 + i +".mp4"); %lee el archivo de audio 
        else 
            [y,Fs] = audioread(nombre1 + i +".m4a"); %lee el archivo de audio
        end
        
        %Procesamos la señal para verla en el tiempo
        duracion = (length(y)/Fs); %Guarda su duracion en segundos
        t = linspace(0,duracion,length(y));
        
        %Hacemos el análisis estadístico con base en el tiempo y lo
        %indexamos en la tabla
        media = mean(y);
        varianza = var(y);
        desviacion = std(y);
        asimetria = skewness(y);
        curtosis = kurtosis(y);
        datos_voz(i,:) = {i,media,varianza,desviacion,asimetria,curtosis};

        %Creamos las gráficas correspondientes
        
        subplot(2,10,i)
        plot(t, y) %En función del tiempo
        title('Audio')
        xlabel('Segundos')
        ylabel('Amplitud')

        subplot(2,10,i+10)
        L = length(y);
        NFFT = 2^nextpow2(L);
        Y1 = fft(y);
        f1 = Fs/2*linspace(0,1,NFFT/2);
        plot(f1, 2*abs(Y1(1:NFFT/2))); %En función de la frecuencia
        xlabel('Hz')
        ylabel('Amplitud')
        title('Frecuencias')
        xlim([0 6000])
    end
hold off
    disp(datos_voz); %Mostramos la tabla completa
end