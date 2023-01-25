CREATE TABLE /**Postgres */
  public.filiais ( 
    id_filial serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    name_filial character varying(60) NULL
  );

ALTER TABLE
  public.filiais
ADD
  CONSTRAINT filiais_pkey PRIMARY KEY (id_filial)
/**end*/

CREATE TABLE /**Postgres */
  public.persons ( 
    id_person serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    name_pers character varying(60) NULL,
    cpf_pers character varying(11) NULL,
    andress_pers character varying(60) NULL,
    fk_name_filial serial,
    FOREIGN KEY (fk_name_filial) REFERENCES filiais(id_filial) ON DELETE CASCADE
 
  );

ALTER TABLE
  public.persons
ADD
  CONSTRAINT persons_pkey PRIMARY KEY (id_person)
/**end*/

CREATE TABLE
  public.sales ( 
    id_sale serial NOT NULL,
    created_at timestamp without time zone NOT NULL DEFAULT now(),
    fk_name_pers serial,
    val_rec numeric(11) NULL,
    disc_sale numeric(11) NULL,
    total_sale numeric(11) NULL,
    FOREIGN KEY (fk_name_pers) REFERENCES persons(id_person) ON DELETE CASCADE
  );

ALTER TABLE
  public.sales
ADD
  CONSTRAINT sales_pkey PRIMARY KEY (id_sale)
/**end*/

