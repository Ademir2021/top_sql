CREATE TABLE
  filiais (
    id_filial SERIAL NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITHOUT TIME ZONE NULL,
    name_filial VARCHAR(60) NOT NULL,
    fantasia VARCHAR(60) NOT NULL,
    address VARCHAR (60) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    inscric VARCHAR(14) NOT NULL,
    phone VARCHAR(11) NOT NULL,
    email VARCHAR(60) NOT NULL,
    PRIMARY KEY (id_filial)
  );
CREATE TABLE
  users (
    id SERIAL NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITHOUT TIME ZONE NULL,
    name VARCHAR(60) NOT NULL,
    username VARCHAR (60) UNIQUE NOT NULL,
    password VARCHAR (255) NOT NULL,
    PRIMARY KEY (id)
  );
  CREATE TABLE
    brands (
    id_brand SERIAL NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITHOUT TIME ZONE NULL,
    name_brand VARCHAR(60) NOT NULL,
    PRIMARY KEY(id_brand)
  );
  CREATE TABLE
  sectors (
    id_sector SERIAL NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITHOUT TIME ZONE NULL,
    name_sector VARCHAR(60) NOT NULL,
    PRIMARY KEY(id_sector)
  );
  CREATE TABLE
   persons (
    id_person SERIAL NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITHOUT TIME ZONE NULL,
    name_pers VARCHAR(60) NOT NULL,
    cpf_pers VARCHAR(11) NOT NULL,
    address_pers VARCHAR(60) NOT NULL,
    fk_name_filial INT NOT NULL,
    fk_id_user INT NOT NULL,
    phone_pers VARCHAR(11) NOT NULL,
    PRIMARY KEY (id_person)
  );
  CREATE TABLE
    products (
    id_product SERIAL NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITHOUT TIME ZONE NULL,
    descric_product VARCHAR(60) NOT NULL,
    val_max_product NUMERIC(18, 2) NOT NULL,
    val_min_product NUMERIC(18, 2) NOT NULL,
    fk_brand INT NOT NULL,
    fk_sector INT NOT NULL,
    bar_code VARCHAR (200)NOT NULL,
    PRIMARY KEY (id_product)
  );
  CREATE TABLE
    sales (
    id_sale SERIAL NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    fk_name_pers INT NOT NULL,
    val_rec NUMERIC(18, 2) NULL,
    disc_sale NUMERIC(18, 2) NOT NULL,
    total_sale NUMERIC(18, 2) NULL,
    fk_name_filial INT NOT NULL,
    fk_name_user INT NOT NULL,
    PRIMARY KEY (id_sale)
  );
  CREATE TABLE
    itens_sale (
    id_item_sequen SERIAL NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    fk_sale INT NOT NULL,
    fk_product INT NOT NULL,
    amount_product INT NOT NULL,
    val_product NUMERIC(18, 2) NOT NULL,
    total_product NUMERIC(18, 2) NOT NULL,
    PRIMARY KEY(id_item_sequen, fk_sale)
  );
ALTER TABLE itens_sale ADD CONSTRAINT sale_fk_sale
FOREIGN KEY(fk_sale) REFERENCES sales(id_sale);
ALTER TABLE itens_sale ADD CONSTRAINT product_fk_product
FOREIGN KEY(fk_product) REFERENCES products(id_product);
ALTER TABLE sales ADD CONSTRAINT person_fk_name_pers
FOREIGN KEY(fk_name_pers) REFERENCES persons(id_person);
ALTER TABLE sales ADD CONSTRAINT filial_fk_name_filial
FOREIGN KEY(fk_name_filial) REFERENCES filiais(id_filial);
ALTER TABLE sales ADD CONSTRAINT user_fk_name_user
FOREIGN KEY(fk_name_user) REFERENCES users(id);
ALTER TABLE products ADD CONSTRAINT brand_fk_brand
FOREIGN KEY(fk_brand) REFERENCES brands(id_brand);
ALTER TABLE products ADD CONSTRAINT sector_fk_sector
FOREIGN KEY(fk_sector) REFERENCES sectors(id_sector);
ALTER TABLE persons ADD CONSTRAINT person_fk_name_filial
FOREIGN KEY(fk_name_filial) REFERENCES filiais(id_filial);
ALTER TABLE persons ADD CONSTRAINT person_fk_id_user
FOREIGN KEY(fk_id_user) REFERENCES users(id);

CREATE OR REPLACE VIEW
  itens_nota AS
SELECT
sales.id_sale AS id_venda,
itens_sale.fk_product AS item,
products.descric_product AS descricao,
brands.name_brand AS marca,
sectors.name_sector AS setor,
itens_sale.amount_product AS quant,
itens_sale.val_product AS valor,
itens_sale.total_product AS total
FROM
sales
JOIN itens_sale ON sales.id_sale = itens_sale.fk_sale
JOIN products ON products.id_product = itens_sale.fk_product
JOIN brands ON brands.id_brand = products.fk_brand
JOIN sectors ON sectors.id_sector = products.fk_sector;

CREATE OR REPLACE VIEW
  nota AS
SELECT
sales.id_sale AS nota,
filiais.name_filial AS filial,
persons.name_pers AS comprador,
persons.cpf_pers AS cpf,
persons.address_pers AS endereco,
persons.phone_pers AS telefone,
users.name AS usuario,
users.username AS email,
sales.created_at AS emitida,
sales.val_rec,
sales.disc_sale AS desc_venda,
sales.total_sale AS total_venda
FROM
sales
JOIN filiais ON filiais.id_filial = sales.fk_name_filial
JOIN persons ON persons.id_person = sales.fk_name_pers
JOIN users ON users.id = sales.fk_name_user;

INSERT INTO brands(name_brand) VALUES ('Geral');
INSERT INTO sectors(name_sector) VALUES ('gERAL');
INSERT INTO filiais(
name_filial,
fantasia,
address,
cnpj,
inscric,
phone,
email
)values(
'Filial 01',
'Centro Informatica',
'Av, Cstro Alves, 1241',
'18069383000110',
'84748484848',
'44988521033',
'centroserra@gmail.com');
INSERT INTO persons(
name_pers,
cpf_pers,
address_pers,
fk_name_filial,
fk_id_user,
phone_pers
)VALUES(
'Ademir Souza de Almeida',
'74276697972',
'Av, Castro Alves 1241 Centro',
1,
1,
'44988521033'
);