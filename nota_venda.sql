CREATE OR REPLACE VIEW nota AS
SELECT
sales.id_sale AS venda,
filiais.nome_filial AS filial,
persons.name_pers AS comprador,
persons.cpf_pers AS CPF,
users.name AS usuario,
users.username AS Email,
sales.created_at AS "Data",
sales.val_rec,
sales.disc_sale,
sales.total_sale
FROM sales
INNER JOIN filiais ON (id_filial = fk_name_filial)
INNER JOIN persons ON (id_person = fk_name_pers)
INNER JOIN users ON (id = fk_name_user)

AND id_sale = 3

select *from nota where venda = 4

/*Itens da Nota**/

SELECT
sales.id_sale,
-- sales.created_at,
sales.val_rec,
sales.disc_sale,
sales.total_sale,
itens_sale.fk_product,
itens_sale.amount_product,
itens_sale.val_product,
itens_Sale.total_product,
products.descric_product,
brands.name_brand,
sectors.name_sector
from sales
inner join itens_sale on (id_sale = fk_sale)
inner join products on (id_product = fk_product)
inner join brands on (id_brand = fk_brand)
inner join sectors on (id_sector = fk_sector)
and id_sale = 1

SELECT
sales.id_sale as "id_venda",
-- sales.created_at,
-- sales.val_rec,
-- sales.disc_sale,
sales.total_sale as "Total Venda",
itens_sale.fk_product as "item",
itens_sale.amount_product as "quant",
itens_sale.val_product as "val_item",
itens_Sale.total_product as "total_item",
products.descric_product as "Descrição",
brands.name_brand as "marca",
sectors.name_sector as "setor"
from sales
inner join itens_sale on (id_sale = fk_sale)
inner join products on (id_product = fk_product)
inner join brands on (id_brand = fk_brand)
inner join sectors on (id_sector = fk_sector)
and id_sale = 11

SELECT
-- sales.id_sale as "id_venda",
-- sales.created_at,
-- sales.val_rec,
-- sales.disc_sale,
-- sales.total_sale as "Total Venda",
itens_sale.fk_product as "item",
products.descric_product as "Descrição",
itens_sale.amount_product as "quant",
itens_sale.val_product as "val_item",
itens_Sale.total_product as "total_item",
brands.name_brand as "marca",
sectors.name_sector as "setor"
from sales
inner join itens_sale on (id_sale = fk_sale)
inner join products on (id_product = fk_product)
inner join brands on (id_brand = fk_brand)
inner join sectors on (id_sector = fk_sector)
and id_sale = 24