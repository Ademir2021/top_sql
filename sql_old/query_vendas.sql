DELETE FROM ITENS WHERE ITEM < 30;

-- Alterar nome da Tabela --
ALTER TABLE VENDA_ITENS
RENAME COLUMN PRODUTO_FK TO ITEM_FK;
use centroinfo;
-- Comandos Gerais --
delete from itens where item > 11;
alter table marcas  change marca marca int primary key;
ALTER TABLE marcas MODIFY COLUMN marca INT auto_increment;
DESCRIBE clientes;
select *from itens;
alter table itens auto_increment = 11;
ALTER TABLE CLIENTES DROP FOREIGN KEY FILIAL;
ALTER TABLE CLIENTES DROP INDEX FILIAL;

update departamentos set nome = 'Informática'
where departamento = 2;

update itens set descricao = 'Mouse Optico c/Fio'
where item = 1;

-- Cria uma nova View para alterar utilize ALTER VIEW --
CREATE VIEW vw_itens
AS -- usado para referenciar o bloco de comandos --
SELECT i.id_item,
i.descric_item,
i.valor_item,
i.valor_min_item,
d.nome_departamento AS Departamento,
m.nome_marca AS Marca
FROM itens AS i
INNER JOIN departamentos AS d
ON i.fk_departamento = d.id_departamento
INNER JOIN marcas AS m
ON i.fk_marca = m.id_marca

WHERE ITEM < 100; /* Limita a pesquisa menor que 100*/

SELECT * -- ITEM, DESCRICAO, VALOR, VALOR_MIN, DEPARTAMENTO, MARCA --
FROM vw_itens
ORDER BY descric_item;

-- Criar Trigger para alimentar o valor_min OK criada --
CREATE TRIGGER tr_desconto BEFORE INSERT
ON itens
FOR EACH ROW
SET NEW.valor_min_item = (NEW.valor_item * 0.90);

DROP TRIGGER TR_DESCONTO; -- Apagar o Trigger --



-- Criar Trigger para somar o valor da quantidade comprada OK criada --
CREATE TRIGGER tr_item_total BEFORE INSERT
ON venda_itens
FOR EACH ROW
SET NEW.total_item = (NEW.valor_item * NEW.quant_item);

SELECT *FROM VENDA_ITENS;

-- Criar Trigger para somar o valor dos subtotais dos itens e gravar no total da venda --
CREATE TRIGGER TR_VENDAS_TOTAL BEFORE INSERT
 -- crie o codigo --
 
-- Stored Procedures --
DELIMITER $$
CREATE PROCEDURE Selecionar_Produtos(IN quantidade INT)
BEGIN
SELECT * FROM ITENS
LIMIT quantidade;
END $$
DELIMITER ;
-- Executa o procedimento
CALL Selecionar_Produtos(6);

DELIMITER $$
CREATE PROCEDURE Verificar_Quantidade_Produtos(OUT quantidade INT)
BEGIN
SELECT COUNT(*) INTO quantidade FROM ITENS;
END $$
DELIMITER ;
-- Executa o proedimento --
CALL Verificar_Quantidade_Produtos(@total);
SELECT @total;

DELIMITER $$
CREATE PROCEDURE Elevar_Ao_Quadrado(INOUT numero INT)
BEGIN
SET numero = numero * numero;
END $$
DELIMITER ;
-- Executa o procedure --
SET @valor = 5;
CALL Elevar_Ao_Quadrado(@valor);
SELECT @valor;












