SELECT SUM(prod_vpreco) AS total FROM produtos;

SELECT SUM(PONTOS) AS total 
FROM tabela

Somando por usuários:

SELECT NOME, SUM(PONTOS) AS total 
FROM tabela
GROUP BY NOME

Contando a quantidade de registros por usuário:

SELECT NOME, COUNT(PONTOS) AS registros
FROM tabela
GROUP BY NOME

Exibindo a média por usuário:

SELECT NOME, AVG(PONTOS) AS media
FROM tabela
GROUP BY NOME

Todos acima juntos:

SELECT NOME, SUM(PONTOS) AS total, COUNT(PONTOS) AS registros, AVG(PONTOS) AS media
FROM tabela
GROUP BY NOME



