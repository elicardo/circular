function [w] = omega(N);
  
  % dado o n�mero N de lados do pol�gono, esta fun��o  retorna w, o valor da 
  % velocidade angular omega em fun��o do angulo theta com os valores de theta 
  % variando em "totres" valores diferentes.
  
  raio = 1;       %raio do c�rculo
  xc = 0;         % coordenada cartesiana x do centro do circulo
  yc = 0;         % coordenada cartesiana y do centro do circulo
  v = 1;          % velocidade da part�cula
  totres = 1000;  %resolu��o total da sa�da, em n�mero de pontos
  
  
for i = 0:1:N-1;
  
  %a resolu��o da reta entre dois pontos � dada por:
  res = floor(tres/N);

  %esta reta � definida por dois pontos, 
  % cujas coordenadas angulares s�o theta0 e theta1
  % os pontos (x0,y0) e (x1,y1) podem ser encontrados por:
   
  theta0 = i*2*pi/N;
   x0 = xc + raio*cos(theta0);
   y0 = yc + raio*sin(theta0);

   theta1 = (i+1)*2*pi/N;
   x1 = xc + raio*cos(theta1);
   y1 = yc + raio*sin(theta1);
   
   % a dist�ncia entre os pontos � dada por:
   distancia = sqrt((x0 - x1)^2 + (y0 - y1)^2);
   
   %o tempo de deslocamento da particula entre os pontos pode ser dada por:
   dt = distancia/v;
 
   %a dire��o vetorial do deslocamento entre os pontos � dada por:
   direc = [(x1 -x0), (y1 - y0)];

   
    %Entre os pontos (x0,y0) e (x1,y1), existem "res" pontos. Eles ser�o
    %tratados dois a dois, como P1 e P2.
    
    for j = 1:1:res;
    P1 = [x0,y0] + (j-1)*direc/res; 
    P2 = [x0,y0] + j*direc/res; 
    %Xa e Ya s�o as dire��es horitonzais e verticais de refer�ncia.
    Xa = [raio,0];
    Ya = [0,raio];
    
    %dire��o co � a proje��o de P1 em Xa
    co = dot(P1,Xa)/(modulo(P1)*modulo(Xa));
    
    %dire��o co2 � a proje��o de P2 em P1.
    co2 = dot(P1,P2)/(modulo(P1)*modulo(P2));
    
    %"vertical" � a proje��o vertical de P1 (proje�ao de P1 em rela��o a Ya)
    vertical = dot(P1,Ya);
    
    % dtheta � a varia��o de angulo cuja proje��o � "co2"
    dtheta = acos(co2);
    % omega � a varia��o do angulo pela varia��o do tempo entre estes pontos
    omega = dtheta/(dt/res);
    
    %o calculo do angulo theta, como arco cosseno de "co" depende se a proje��o 
    % "vertical" � pra cima ou pra baixo.
    if (vertical >= 0)
    theta = acos(co);
    else
    theta = 2*pi - acos(co);
    endif
    
    %registrando os valores de theta e omega na variavel de saida "w"
    w(floor((i)*res+j),1) = theta;
    w(floor((i)*res+j),2) = omega;
    
    
    
    endfor
   
endfor
    
  
endfunction