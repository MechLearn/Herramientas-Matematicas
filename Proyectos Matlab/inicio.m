% function [mundo,posbloques,postubos] = inicio()
% % Escenario inicial como se plantea en el instructivo pero con la
% diferencia de que las imagenes no se superponen una encima de otra, sino
% se define valor por valor
% 
%     % Matriz de bloques de 12 x 24
%     posbloques = ones(12,24,'uint8');  % 1 = aire
%     posbloques(12,:) = 2;              % 2 = baldosa (piso)
% 
%     % En esta parte se recrea el mundo inicial, dado en las instrucciones
%     % de la tarea, la primera plataforma respecto al piso.
%     posbloques(8, 12) = 4;
%     posbloques(8, 13) = 3;
%     posbloques(8, 14) = 4;
%     posbloques(8, 15) = 3;
%     posbloques(8, 16) = 4;
% 
%     % La segunda plataforma respecto al piso
%     posbloques(4, 13) = 4;
%     posbloques(4, 14) = 3;
%     posbloques(4, 15) = 4;
% 
% 
%     % La matriz de los tubos, es una matriz reducida a la mitad de la
%     % matriz de posbloques, pues cada tubo representa una escala donde
%     % ocupa 2 espacios mas tanto horizontal como vertical respecto a la
%     % escala de postubos
%     postubos = ones(6,12,'uint8');    % 1 = sin tubo, 2 = tub
% 
%     postubos(6,10) = 2;
% 
%     % --- Render ---
%     mundo = mariomundo(posbloques, postubos);
% end


function [mundo,posbloques,postubos] = inicio()
posbloques = ones(12,24);
posbloques(12,:) = 2;
posbloques(4,13:15) = 4;
posbloques(4,14) = 3;
posbloques(8,12:16) = 4;
posbloques(8,13) = 3;
posbloques(8,15) = 3;
postubos = ones(6,12);
postubos(6,10) = 2;
mundo = mariomundo(posbloques,postubos);
end
