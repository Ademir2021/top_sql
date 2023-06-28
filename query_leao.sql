-- estrutura do banco --
-- atualizado em 28/06/2023 --

-- tbl sales --
CREATE TABLE
  public.sales (
    id_sale serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    fk_name_pers integer NOT NULL,
    val_rec numeric(18, 2) NULL,
    disc_sale numeric(18, 2) NOT NULL,
    total_sale numeric(18, 2) NULL,
    fk_name_filial integer NOT NULL,
    fk_name_user integer NOT NULL
  );

ALTER TABLE
  public.sales
ADD
  CONSTRAINT sales_pkey PRIMARY KEY (id_sale)

-- tbl itens_sale --
CREATE TABLE
  public.itens_sale (
    id_item_sequen serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    fk_sale integer NOT NULL,
    fk_product integer NOT NULL,
    amount_product integer NOT NULL,
    val_product numeric(18, 2) NOT NULL,
    total_product numeric(18, 2) NOT NULL
  );

ALTER TABLE
  public.itens_sale
ADD
  CONSTRAINT itens_sale_pkey PRIMARY KEY (fk_sale)

  -- tbl persons  --
  CREATE TABLE
  public.persons (
    id_person serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    name_pers character varying (60) NOT NULL,
    cpf_pers character varying (11) NOT NULL,
    address_pers character varying (60) NOT NULL,
    fk_name_filial integer NOT NULL,
    fk_id_user integer NOT NULL,
    phone_pers character varying (11) NULL
  );

ALTER TABLE
  public.persons
ADD
  CONSTRAINT persons_pkey PRIMARY KEY (id_person)

  -- tbl products --
  CREATE TABLE
  public.products (
    id_product serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    descric_product character varying (60) NOT NULL,
    val_max_product numeric(18, 2) NULL,
    val_min_product numeric(18, 2) NOT NULL,
    fk_brand integer NOT NULL,
    fk_sector integer NOT NULL,
    bar_code character varying (200) NULL
  );

ALTER TABLE
  public.products
ADD
  CONSTRAINT products_pkey PRIMARY KEY (id_product)

  -- tbl users --
  CREATE TABLE
  public.users (
    id serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    name character varying (60) NOT NULL,
    username character varying (60) NOT NULL,
    password character varying (255) NOT NULL
  );

ALTER TABLE
  public.users
ADD
  CONSTRAINT users_pkey PRIMARY KEY (id)

-- view itens_nota --
CREATE OR REPLACE VIEW
  "public".itens_nota AS
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

  -- view nota --
  CREATE OR REPLACE VIEW
  "public".nota AS
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

-- tbl filiais --
CREATE TABLE
  public.filiais (
    id_filial serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    name_filial character varying (60) NOT NULL
  );

ALTER TABLE
  public.filiais
ADD
  CONSTRAINT filiais_pkey PRIMARY KEY (id_filial)

-- tbl brands --
CREATE TABLE
  public.brands (
    id_brand serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    name_brand character varying (60) NULL
  );

ALTER TABLE
  public.brands
ADD
  CONSTRAINT brands_pkey PRIMARY KEY (id_brand)

  -- tbl sectors --
  CREATE TABLE
  public.sectors (
    id_sector serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    name_sector character varying (60) NULL
  );

ALTER TABLE
  public.sectors
ADD
  CONSTRAINT sectors_pkey PRIMARY KEY (id_sector)