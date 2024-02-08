function [mod] = modulo(vetor);
  
  
  tamanho = length(vetor);
  soma = 0;
  
  for i = 1:tamanho
  soma = soma + vetor(i)*vetor(i);
  endfor

  mod = sqrt(soma);
  
endfunction
