CREATE OR REPLACE VIEW itens_nota AS
SELECT
sales.id_sale AS "id_venda",
sales.created_at AS "data_venda",
filiais.nome_filial AS "filial",
sales.val_rec,
sales.disc_sale AS "desconto",
sales.total_sale AS "total_venda",
persons.name_pers AS "cliente",
persons.cpf_pers AS "cpf",
users.name AS "usuario",
users.username AS "email",
itens_sale.fk_product AS "item",
products.descric_product AS "descricao",
itens_sale.amount_product AS "quant",
itens_sale.val_product AS "val item",
itens_Sale.total_product AS "total item",
brands.name_brand AS "marca",
sectors.name_sector AS "setor"
FROM sales
INNER JOIN itens_sale ON (id_sale = fk_sale)
INNER JOIN filiais ON (id_filial = fk_name_filial)
INNER JOIN persons ON (id_person = fk_name_pers)
INNER JOIN users ON (id = fk_name_user)
INNER JOIN products ON (id_product = fk_product)
INNER JOIN brands ON (id_brand = fk_brand)
INNER JOIN sectors ON (id_sector = fk_sector)

AND id_sale = 27 

/* usar o comando abaixo**/
SELECT *FROM
nota_venda WHERE id_venda = 31