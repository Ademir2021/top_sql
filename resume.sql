ALTER TABLE products ADD COLUMN  bar_code VARCHAR(200) NULL

ALTER TABLE contacts ALTER COLUMN phone TYPE VARCHAR(14) NULL

ALTER TABLE products ALTER COLUMN descric_product TYPE VARCHAR(255)

DELETE FROM users WHERE name='Ademir';

SELECT username FROM users WHERE username = 'centroserra@gmail.com' LIMIT(1)

DELETE FROM itens_sale WHERE fk_sale=2;
DELETE FROM sales where id_sale = 2

UPDATE users
SET username = 'francieli@provider.com'
WHERE id = 3;

SELECT *FROM sales WHERE id_sale = 1

DELETE FROM users WHERE id > 0

SELECT username, password from users WHERE username = 'centroserra@gmail.com' LIMIT(1)

INSERT INTO users(name, username, password) VALUES ('Ademir', 'centroserra@gmail.com', '123')

ALTER TABLE users ADD unique(username);

UPDATE products SET val_min_product = 140 where id_product = 19

UPDATE users SET name = 'Maria Luiza' WHERE id = 103

/*Ajustar a sequencia chave primaria**/
SELECT * FROM products_id_product_seq;
ALTER SEQUENCE products_id_product_seq RESTART WITH 1;


ALTER TABLE produtos ALTER COLUMN cod_prod SET NOT NULL;

ALTER TABLE ceps ADD PRIMARY KEY (id_cep);

