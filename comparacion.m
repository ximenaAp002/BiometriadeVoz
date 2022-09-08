function quien = comparacion(audio)
    %Primero analizamos las muestras de cada persona
    analisisGlobal("Ximena")
    global datos_voz
    media_Ximena = mean(datos_voz.Curtosis);
    analisisGlobal("Barbara")
    media_Barbara = mean(datos_voz.Curtosis);
    analisisGlobal("Manuel")
    media_Manuel = mean(datos_voz.Curtosis);
    analisisGlobal("Luis")
    media_Luis = mean(datos_voz.Curtosis);
    analisisGlobal("Monse")
    media_Monse = mean(datos_voz.Curtosis);
    analisis_audio1(audio)
    global curtosis
    media_audio = curtosis;
    
    if (media_audio >= media_Ximena-1) && (media_audio <= media_Ximena+1)
        quien = "Voz de Ximena";
    elseif (media_audio >= media_Manuel-1) && (media_audio <= media_Manuel+1)
        quien = "Voz de Manuel";
    elseif (media_audio >= media_Monse-1) && (media_audio <= media_Monse+1)
        quien = "Voz de Monse";
    elseif (media_audio >= media_Luis-1) && (media_audio <= media_Luis+1)
        quien = "Voz de Luis";
    elseif (media_audio >= media_Barbara-1) && (media_audio <= media_Barbara+1)
        quien = "Voz de Barbi";
    else 
        quien = "No se encontraron coincidencias";
    end
end