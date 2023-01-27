select
id_item_sequen as id_item,
fk_sale as venda,
descric_product as item,
amount_product as quant,
val_product as valor,
total_product as total
from itens_sale, products
where
id_product = fk_product
and fk_sale = 7

select
id_product as id,
descric_product as produto,
val_min_product as val_min,
val_max_product as val_max,
name_brand as marca,
name_sector as setor
from products, brands, sectors



select *from brands