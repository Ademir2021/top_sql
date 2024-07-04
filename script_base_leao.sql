CREATE TABLE
  contacts (
    id SERIAL NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMP WITHOUT TIME ZONE NULL,
    name VARCHAR(60) NOT NULL,
    email VARCHAR(60) NOT NULL,
    phone VARCHAR (14) NOT NULL,
    comments VARCHAR(250) NOT NULL,
    PRIMARY KEY (id)
  );

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
    privilege VARCHAR (2) NOT NULL DEFAULT 1,
    PRIMARY KEY (id)
  );

  CREATE TABLE
  refresh_token(
    id SERIAL NOT NULL,
    created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    expires_in INT,
    user_ INT,
    user_id VARCHAR(60),
    PRIMARY KEY(id)
  )

  ALTER TABLE refresh_token ADD CONSTRAINT refresh_token_user
  FOREIGN KEY(user_) REFERENCES users(id)

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
    -- bairro_pers VARCHAR(60) NOT NULL,
    -- fk_cep INT NOT NULL;
    -- num_address VARCHAR(6) NOT NULL
    fk_name_filial INT NOT NULL,
    fk_id_user INT NOT NULL,
    phone_pers VARCHAR(11) NOT NULL,
    PRIMARY KEY (id_person)
  );

  /**Alterações realizadas na tabela person em 11/01/2024 */
  ALTER TABLE persons ADD COLUMN  bairro_pers VARCHAR(600)NOT NULL
  ALTER TABLE persons ADD COLUMN fk_cep INT NOT NULL
  /**Incluido na tabela person o campo num_address em 04/07/2024 */
  ALTER TABLE persons ADD COLUMN num_address VARCHAR(6) NOT 

  ALTER TABLE ceps ADD PRIMARY KEY (id_cep);

  -- ALTER TABLE persons DROP CONSTRAINT person_fk_cep; // remove CONSTRAINT
  ALTER TABLE persons ADD CONSTRAINT person_fk_cep
  FOREIGN KEY(fk_cep) REFERENCES ceps(id_cep) ON UPDATE CASCADE;

  ALTER TABLE persons ALTER COLUMN bairro_pers SET NOT NULL;
  ALTER TABLE persons ALTER COLUMN fk_cep SET NOT NULL;


CREATE TABLE
    products (
    id_product SERIAL NOT NULL,
    descric_product VARCHAR(255) NOT NULL,
    val_max_product NUMERIC(18, 2) NOT NULL,
    val_min_product NUMERIC(18, 2) NOT NULL,
    fk_brand INT NOT NULL,
    fk_sector INT NOT NULL,
    bar_code VARCHAR (200)NOT NULL,
    images VARCHAR(60) NOT NULL,
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
CREATE TABLE
countries(
  id_country SERIAL NOT NULL,
  name_country VARCHAR (100) NOT NULL,
  acronym VARCHAR(3) NULL,
  ddi INT NOT NULL,
  code_country NUMERIC(18,2) NOT NULL,
  code_revenue INT NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
  PRIMARY KEY(id_country)
);
CREATE TABLE
cities(
  id_city SERIAL NOT NULL,
  name_city VARCHAR(60) NOT NULL,
  uf CHAR(2) NOT NULL,
  code_ibge VARCHAR(9) NOT NULL,
  code_state_revenue INT NOT NULL,
  code_country INT NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
  code_federal_revenue NUMERIC(18,2) NOT NULL,
  PRIMARY KEY(id_city)
);
CREATE TABLE
ceps(
  id_cep SERIAL NOT NULL,
  num_cep VARCHAR(10) NOT NULL,
  code_city INT NOT NULL,
  type_cep VARCHAR(18) NOT NULL,
  public_place VARCHAR(100) not null,
  num_initial INT NOT NULL,
  num_final INT NOT NULL,
  complement VARCHAR(100),
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
  city VARCHAR(60) NOT NULL,
  uf CHAR(2) NOT NULL
  --  PRIMARY KEY(id_city) 
)

ALTER TABLE itens_sale ADD CONSTRAINT sale_fk_sale
FOREIGN KEY(fk_sale) REFERENCES sales(id_sale) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE itens_sale ADD CONSTRAINT product_fk_product
FOREIGN KEY(fk_product) REFERENCES products(id_product) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE sales ADD CONSTRAINT person_fk_name_pers
FOREIGN KEY(fk_name_pers) REFERENCES persons(id_person) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE sales ADD CONSTRAINT filial_fk_name_filial
FOREIGN KEY(fk_name_filial) REFERENCES filiais(id_filial) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE sales ADD CONSTRAINT user_fk_name_user
FOREIGN KEY(fk_name_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE products ADD CONSTRAINT brand_fk_brand
FOREIGN KEY(fk_brand) REFERENCES brands(id_brand) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE products ADD CONSTRAINT sector_fk_sector
FOREIGN KEY(fk_sector) REFERENCES sectors(id_sector) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE persons ADD CONSTRAINT person_fk_name_filial
FOREIGN KEY(fk_name_filial) REFERENCES filiais(id_filial) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE persons ADD CONSTRAINT person_fk_id_user
FOREIGN KEY(fk_id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;

-- ALTER TABLE cities DROP CONSTRAINT country_code_country; // remove CONSTRAINT 
ALTER TABLE cities ADD CONSTRAINT country_code_country
FOREIGN KEY(code_country) REFERENCES countries(id_country) ON UPDATE CASCADE

-- ALTER TABLE ceps DROP CONSTRAINT ceps_code_city; // remove CONSTRAINT
ALTER TABLE ceps ADD CONSTRAINT ceps_code_city
FOREIGN KEY(code_city) REFERENCES cities(id_city) ON UPDATE CASCADE


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
filiais.fantasia AS fantasia,
filiais.address AS f_endereco,
filiais.cnpj AS cnpj,
filiais.inscric AS inscricao,
filiais.phone AS f_telefone,
filiais.email AS f_email,
persons.name_pers AS comprador,
persons.cpf_pers AS cpf,
persons.address_pers AS endereco,
persons.num_address AS num_endereco,
persons.phone_pers AS telefone,
users.name AS usuario,
users.username AS email,
sales.created_at AS emitida,
sales.val_rec,
sales.disc_sale AS desc_venda,
sales.total_sale AS total_venda,
persons.bairro_pers AS bairro,
ceps.num_cep AS cep,
ceps.uf AS uf,
ceps.city as municipio
FROM
sales
JOIN filiais ON filiais.id_filial = sales.fk_name_filial
JOIN persons ON persons.id_person = sales.fk_name_pers
JOIN users ON users.id = sales.fk_name_user
JOIN ceps ON ceps.id_cep = persons.fk_cep;

/* inserts **/

INSERT INTO brands(name_brand) VALUES ('Geral');
INSERT INTO sectors(name_sector) VALUES ('Geral');
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
'Av, Castro Alves, 1241',
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

CREATE OR REPLACE FUNCTION fc_sum_note()
RETURNS TRIGGER AS
$BODY$
BEGIN
UPDATE itens_sale
SET total_product = val_product * amount_product
WHERE fk_sale = NEW.fk_sale;
UPDATE sales SET val_rec = ( SELECT SUM( total_product )
FROM itens_sale WHERE fk_sale = NEW.fk_sale )
WHERE id_sale = NEW.fk_sale;                          
UPDATE sales
SET total_sale = val_rec - disc_sale
WHERE id_sale = NEW.fk_sale;
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER trg_sum_note AFTER INSERT ON itens_sale
FOR EACH ROW EXECUTE PROCEDURE fc_sum_note()