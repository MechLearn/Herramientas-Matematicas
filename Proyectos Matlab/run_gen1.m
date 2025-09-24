[mundo,posbloques,postubos] = inicio();   % aquí se genera el escenario inicial

b_pair = posbloques(:,end-1:end);  % último par de columnas
t_col  = postubos(:,end);          % última columna de tubos (no cambia en A1)

for k = 1:40 %este bucle, hace el recorrido para 40 pares
    [b_siguiente, ~] = gen_A1_piso(b_pair, t_col); % en esta parte almacena el valor de b_siguiente para cada iteración, llamando a la función predefinida
    posbloques  = [posbloques, b_siguiente]; % en esta parte la matriz completa del escenario posbloques, se le concatena la matriz b_siguiente
    b_pair      = b_siguiente;          % en esta parte se almacena b_pair con b_siguiente, para que la siguiente iteración tenga en cuenta el resultado final de la iteración anterior
end

%en esta parte, se definen parámetros para que no existan problemas de
%tamaño en el render, esta parte se propone para solucionar un error que
%dio producto de que al extender posbloques, postubos no se extiende igual

Cb = size(posbloques,2);                 % columnas de bloques
Ct_have = size(postubos,2);              % columnas actuales de tubos
Ct_need = Cb/2;                          % columnas de tubos requeridas, aquí se divide por dos por la misma razón de que el tamaño de un tubo corresponde a dos valores verticales o horizontales respecto a los bloques

if Ct_have < Ct_need
    postubos = [postubos, ones(6, Ct_need - Ct_have, 'uint8')]; %esta parte concatena a postubos las columnas que no se extendieron
elseif Ct_have > Ct_need
    postubos = postubos(:, 1:Ct_need);
end

mariomundo(posbloques, postubos);
title('Actividad 1 — Escenario extendido');
