--Select Itens_Sale
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
and fk_sale = 3

-- Select Products --
select
id_product as id,
descric_product as produto,
val_min_product as val_min,
val_max_product as val_max,
name_brand as marca,
name_sector as setor
from products, brands, sectors

-- Select Vendas --
select
id_filial as filial,
id_person as comprador, 
name_pers as cliente, 
cpf_pers as cpf, 
address_pers as endereço,
id_sale as NF_Venda,
val_rec as SubTotal,
disc_sale as desconto,
total_sale as Total
from
filiais, persons, sales
where
fk_name_pers = id_person and id_sale = 6

