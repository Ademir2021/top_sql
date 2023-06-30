CREATE TABLE sales(
id_sale SERIAL NOT NULL,
created_at TIMESTAMP NOT NULL DEFAULT NOW(),
total_itens NUMERIC(10,2),
disc_sale NUMERIC(10,2),
total_sale NUMERIC(10,2),
PRIMARY KEY (id_sale)
);
CREATE TABLE itens_sale(
id_item SERIAL NOT NULL,
fk_sale INT NOT NULL,
fk_product INT NOT NULL,
val_product NUMERIC(10,2),
amount INT NOT NULL,
total_product NUMERIC NOT NULL,
PRIMARY KEY (id_item, fk_sale)
);
CREATE TABLE products(
id_product SERIAL NOT NULL,
name_product VARCHAR(60),
val_product NUMERIC(10,2),
PRIMARY KEY (id_product)
);
ALTER TABLE itens_sale ADD CONSTRAINT sale_fk_sale
FOREIGN KEY(fk_sale) REFERENCES sales(id_sale);
ALTER TABLE itens_sale ADD CONSTRAINT product_fk_product
FOREIGN KEY(fk_product) REFERENCES products(id_product);

CREATE OR REPLACE FUNCTION fc_soma_item()
RETURNS trigger AS
$BODY$
BEGIN
UPDATE itens_sale SET total_product = NEW.amount * NEW.val_product
WHERE fk_sale = NEW.fk_sale;
UPDATE sales SET total_itens = (SELECT sum(total_product) from itens_sale where fk_sale = id_sale);
UPDATE sales SET total_sale = total_itens - disc_sale; 
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER trg_soma_item AFTER INSERT ON itens_sale
FOR EACH ROW EXECUTE PROCEDURE fc_soma_item();

DROP trigger trg_soma_item ON itens_sale;

INSERT INTO products(
name_product,
val_product
)VALUES(
'Mouse serial',
18.00
);

INSERT INTO sales VALUES (7,NOW(),0,6,0);

INSERT INTO itens_sale
(fk_sale, fk_product, val_product, amount, total_product)
VALUES(7,1,10,19.90,0);

UPDATE sales set total_itens = (SELECT sum(total_product) from itens_sale where fk_sale = id_sale);

SELECT * FROM sales;
SELECT * FROM products;
SELECT * FROM itens_sale;
DELETE FROM itens_sale;