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