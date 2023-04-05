  CREATE TABLE
  public.filiais (
    id_filial serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    nome_filial character varying(60) NULL
  );

ALTER TABLE
  public.filiais
ADD
  CONSTRAINT filiais_pkey PRIMARY KEY (id_filial)


CREATE TABLE
  public.brands (
    id_brand serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    name_brand character varying(60) NULL
  );

ALTER TABLE
  public.brands
ADD
  CONSTRAINT brands_pkey PRIMARY KEY (id_brand)


CREATE TABLE
  public.sectors (
    id_sector serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    name_sector character varying(60) NULL
  );

ALTER TABLE
  public.sectors
ADD
  CONSTRAINT sectors_pkey PRIMARY KEY (id_sector)

ALTER TABLE
  public.sectors
ADD
  CONSTRAINT sectors_pkey PRIMARY KEY (id_sector)

CREATE TABLE
  public.persons (
    id_person serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    name_pers character varying(60) NULL,
    cpf_pers character varying(11) NULL,
    address_pers character varying(60) NULL,
    fk_name_filial serial NOT NULL
  );

ALTER TABLE
  public.persons
ADD
  CONSTRAINT persons_pkey PRIMARY KEY (id_person)


CREATE TABLE
  public.sales (
    id_sale serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    fk_name_pers serial NOT NULL,
    val_rec numeric(18, 2) NULL,
    disc_sale numeric(18, 2) NULL,
    total_sale numeric(18, 2) NULL,
    fk_name_filial integer NOT NULL,
    fk_name_user integer NOT NULL
  );

ALTER TABLE
  public.sales
ADD
  CONSTRAINT sales_pkey PRIMARY KEY (id_sale)

CREATE TABLE
  public.products (
    id_product serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    descric_product character varying(60) NULL,
    val_max_product numeric(18, 2) NULL,
    val_min_product numeric(18, 2) NULL,
    fk_brand integer NULL,
    fk_sector integer NULL,
    bar_code character varying(200) NULL
  );

ALTER TABLE
  public.products
ADD
  CONSTRAINT products_pkey PRIMARY KEY (id_product)


CREATE TABLE
  public.itens_sale (
    id_item_sequen serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    fk_sale integer NOT NULL,
    fk_product integer NULL,
    amount_product integer NULL,
    val_product numeric(18, 2) NULL,
    total_product numeric(18, 2) NULL
  );

ALTER TABLE
  public.itens_sale
ADD
  CONSTRAINT itens_sale_pkey PRIMARY KEY (fk_sale)


CREATE TABLE
  public.users (
    id serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    name character varying(60) NULL,
    username character varying(60) NULL,
    password character varying(255) NULL
  );