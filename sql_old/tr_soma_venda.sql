INSERT INTO <nome_tabela_destino>
SELECT (coluna1, coluna2, ..., colunaN)
FROM <nome_tabela_origem>
WHERE <condição>

Exemplo1
INSERT INTO vendas
SELECT (total_venda)
FROM venda_itens
SUM(total_item) as NEW.total_venda GROUP BY  fk_venda = id_venda;

SELECT SUM(total_item) AS Total  FROM vendas, venda_itens  where id_venda = fk_venda; OK

INSERT INTO vendas
SELECT (total_venda) 
FROM vendas, venda_itens  where SUM(total_item) NEW.total_venda id_venda = fk_venda;



INSERT INTO vendas values (select venda_itens as id, SUM(total_item) from total_venda group by id_venda);

SELECT  *FROM item, vendas, venda_itens WHERE id_venda = fk_venda;