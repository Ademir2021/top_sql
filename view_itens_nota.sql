CREATE OR REPLACE VIEW itens_nota AS

SELECT
sales.id_sale AS "id_venda",
itens_sale.fk_product AS "item",
products.descric_product AS "descricao",
brands.name_brand AS "marca",
sectors.name_sector AS "setor",
itens_sale.amount_product AS "quant",
itens_sale.val_product AS "valor",
itens_Sale.total_product AS "total"
FROM sales
INNER JOIN itens_sale ON (id_sale = fk_sale)
INNER JOIN products ON (id_product = fk_product)
INNER JOIN brands ON (id_brand = fk_brand)
INNER JOIN sectors ON (id_sector = fk_sector)

and id_sale = 1


SELECT *FROM
itens_nota where id_venda =1