-- 01

CREATE TABLE
public.filiais ( 
id_filial serial NOT NULL,
created_at timestamp without time zone NOT NULL DEFAULT now(),
name_filial character varying(60) NOT NULL
);
ALTER TABLE
public.filiais
ADD
CONSTRAINT filiais_pkey PRIMARY KEY (id_filial)

-- 02

CREATE TABLE
public.brands ( 
id_brand serial NOT NULL,
created_at timestamp without time zone NOT NULL DEFAULT now(),
name_brand VARCHAR (60)
);
ALTER TABLE
public.brands
ADD
CONSTRAINT brands_pkey PRIMARY KEY (id_brand)

-- 03

CREATE TABLE
public.sectors ( 
id_sector serial NOT NULL,
created_at timestamp without time zone NOT NULL DEFAULT now(),
name_sector VARCHAR (60)
);
ALTER TABLE
public.sectors
ADD
CONSTRAINT sectors_pkey PRIMARY KEY (id_sector)

-- 04

CREATE TABLE
public.persons ( 
id_person serial NOT NULL,
created_at timestamp without time zone NOT NULL DEFAULT now(),
name_pers character varying(60) NOT NULL,
cpf_pers character varying(11) NOT NULL,
address_pers character varying(60) NOT NULL,
fk_name_filial integer NOT NULL,
FOREIGN KEY (fk_name_filial) REFERENCES filiais(id_filial) ON DELETE CASCADE
);
ALTER TABLE
public.persons
ADD
CONSTRAINT persons_pkey PRIMARY KEY (id_person)

-- 05

CREATE TABLE
public.sales ( 
id_sale serial NOT NULL,
created_at timestamp without time zone NOT NULL DEFAULT now(),
fk_name_pers integer NOT NULL,
val_rec NUMERIC(18,2) NOT NULL,
disc_sale NUMERIC(18,2) NULL,
total_sale NUMERIC(18,2) NULL,
fk_name_filial integer NOT NULL,
fk_name_user integer NOT NULL,
FOREIGN KEY (fk_name_pers) REFERENCES persons(id_person) ON DELETE CASCADE
);
ALTER TABLE
public.sales
ADD
CONSTRAINT sales_pkey PRIMARY KEY (id_sale)

-- 06

CREATE TABLE
public.products ( 
id_product serial NOT NULL,
created_at timestamp without time zone NOT NULL DEFAULT now(),
descric_product VARCHAR(60) NOT NULL,
val_max_product NUMERIC(18,2) NULL,
val_min_product NUMERIC(18,2) NOT NULL,
fk_brand integer NOT NULL,
fk_sector integer NOT NULL,
bar_code VARCHAR(200) NULL,
FOREIGN KEY (fk_brand) REFERENCES brands(id_brand) ON DELETE CASCADE,
FOREIGN KEY (fk_sector) REFERENCES sectors(id_sector) ON DELETE CASCADE
);
ALTER TABLE
public.products
ADD
CONSTRAINT products_pkey PRIMARY KEY (id_product)

-- 07

CREATE TABLE
public.itens_sale ( 
id_item_sequen serial NOT NULL,
created_at timestamp without time zone NOT NULL DEFAULT now(),
fk_sale INTEGER NOT NULL,
fk_product INTEGER NOT NULL,
amount_product INTEGER,
val_product NUMERIC(18,2),
total_product NUMERIC(18,2),
FOREIGN KEY (fk_sale) REFERENCES sales(id_sale) ON DELETE CASCADE,
FOREIGN KEY (fk_product) REFERENCES products(id_product) ON DELETE CASCADE
);
ALTER TABLE
public.itens_sale
ADD
CONSTRAINT itens_sale_pkey PRIMARY KEY (id_item_sequen, fk_sale)

-- 08

CREATE TABLE
public.users (
id serial NOT NULL,
created_at timestamp without time zone NOT NULL DEFAULT now(),
name character varying(60) NOT NULL,
username character varying(60) NOT NULL,
password character varying(255) NOT NULL
);
ALTER TABLE
public.users
ADD
CONSTRAINT users_pkey PRIMARY KEY (id)