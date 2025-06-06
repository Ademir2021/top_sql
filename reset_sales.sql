select *from itens_sale
select *from sales

-- Example --
SELECT * FROM products_id_product_seq;
ALTER SEQUENCE products_id_product_seq RESTART WITH 1;

-- aplicar --
SELECT *FROM sales_id_sale_seq
ALTER SEQUENCE sales_id_sale_seq RESTART WITH 1

SELECT *FROM itens_sale_id_item_sequen_seq
ALTER SEQUENCE itens_sale_id_item_sequen_seq RESTART WITH 1

-- RESET FULL --
DELETE FROM caixa_mov;
ALTER SEQUENCE caixa_mov_id_caixa_seq RESTART WITH 1;
DELETE FROM vals_recebidos;
ALTER SEQUENCE vals_recebidos_id_val_seq RESTART WITH 1;
DELETE FROM contas_receber;
ALTER SEQUENCE contas_receber_id_conta_seq RESTART WITH 1;
DELETE FROM sales;
-- SELECT *FROM sales_id_sale_seq;
ALTER SEQUENCE sales_id_sale_seq RESTART WITH 1;
-- DELETE FROM itens_sale;
ALTER SEQUENCE itens_sale_id_item_sequen_seq RESTART WITH 1;
DELETE FROM refresh_token;
ALTER SEQUENCE refresh_token_id_seq RESTART WITH 1;

DELETE FROM users;
ALTER SEQUENCE users_id_seq RESTART WITH 1;
DELETE FROM persons;
ALTER SEQUENCE persons_id_person_seq RESTART WITH 1;
DELETE FROM contacts;
ALTER SEQUENCE contacts_id_seq RESTART WITH 1;

-- reset notas_recebidas --
DELETE FROM caixa_mov where id_caixa > 4;
ALTER SEQUENCE caixa_mov_id_caixa_seq RESTART WITH 5;
DELETE FROM vals_pagos;
ALTER SEQUENCE vals_pagos_id_val_seq RESTART WITH 1;
DELETE FROM contas_pagar;
ALTER SEQUENCE contas_pagar_id_conta_seq RESTART WITH 1;
DELETE FROM notas_recebidas;
ALTER SEQUENCE notas_recebidas_id_nota_seq RESTART WITH 1;
ALTER SEQUENCE itens_comprados_id_item_sequen_seq RESTART WITH 1;

-- reset vals_pagos --
select *from vals_pagos
delete from vals_pagos where id_val = 72
SELECT *FROM vals_pagos_id_val_seq
ALTER SEQUENCE vals_pagos_id_val_seq RESTART WITH 32

-- reset caixa mov --
select *from caixa_mov
delete from caixa_mov where id_Caixa = 113
SELECT *FROM caixa_mov_id_caixa_seq
ALTER SEQUENCE caixa_mov_id_caixa_seq RESTART WITH 104
