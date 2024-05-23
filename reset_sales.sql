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
DELETE FROM sales
-- SELECT *FROM sales_id_sale_seq
ALTER SEQUENCE sales_id_sale_seq RESTART WITH 1
-- DELETE FROM itens_sale
ALTER SEQUENCE itens_sale_id_item_sequen_seq RESTART WITH 1
DELETE FROM refresh_token
ALTER SEQUENCE refresh_token_id_seq RESTART WITH 1
DELETE FROM users
ALTER SEQUENCE users_id_seq RESTART WITH 1
DELETE FROM persons
ALTER SEQUENCE persons_id_person_seq RESTART WITH 1
DELETE FROM contacts
ALTER SEQUENCE contacts_id_seq RESTART WITH 1