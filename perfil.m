function [perfil] = perfil(inicial,final);
  
  %usa a função "omega" para varios perfis de omega, de 
  % valores de "N", do valor "inicial" até o valor "final". 
  % para cada perfil, registra o valor "minimo" e o valor "máximo" de omega
  
  for i = inicial:1:final;
      waitbar(i/final);
    p = omega(i);                       % perfil de omega para figura de i lados
    maior = max(max(p(:,2)));           % maior valor do perfil
    menor = min(min(p(:,2)));           % menor valor do perfil
    perfil(i - minimo + 1,1) = i;       % registro do numero de lados
    perfil(i - minimo + 1,2) = maior;   % registro do maior valor
    perfil(i - minimo + 1,3) = menor;   % registro do menor valor
  endfor
  
  save -ascii 'perfil.txt' perfil       % registro em arquivo de texto
  
endfunction
