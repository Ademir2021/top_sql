select prod_descri, prod_vpreco * 5 as 'preco de 5 unidades' from produtos;

select prod_descri, prod_vpreco as 'preço unitario', prod_vpreco *1 as 'soma das unidades' from produtos;

select 2*9/3 as 'igual a'

atualizar preco de todos os itens em 10%
UPDATE produtos SET prod_vpreco = prod_vpreco * 1.1 WHERE prod_chave >=1;

atualizar o preco de 1 item
UPDATE produtos SET prod_vpreco = 25 WHERE prod_chave =9;

select 10 MOD 3;

select pow(2,20);

//FUNCAO SENO
select SIN(PI())

// converter hexadecimal
select hex(1200);

//raiz quadrada
select sqrt(81)

Colunas geradas ou calculos calculados.