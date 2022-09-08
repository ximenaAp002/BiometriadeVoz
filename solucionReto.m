%Main del programa
%Leemos la misma frase para cada persona y guardamos los datos para
%comparar
analisis_audio1("menaComparacion.ogg");
analisis_audio1("barbiComparacion.ogg");
analisis_audio1("manuelComparacion.ogg");
analisis_audio1("luisComparacion.mp4");
analisis_audio1("monseComparacion.ogg");

%Usamos la función nueva para ver en que rango entra
resultado = comparacion("monseComparacion.ogg");
disp(resultado)