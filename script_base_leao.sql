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
    name_pers VARCHAR(60) NULL,
    cpf_pers VARCHAR(11) NULL,
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

  /**Alterações realizadas na tabela person em 30/08/2024 */
  ALTER TABLE persons ADD COLUMN  rg VARCHAR(10) NULL;
  ALTER TABLE persons ADD COLUMN  cnpj VARCHAR(14) NULL;
  ALTER TABLE persons ADD COLUMN  inscricao VARCHAR(10) NULL;
  ALTER TABLE persons ADD COLUMN  fantasia VARCHAR(60) NULL;
  ALTER TABLE persons ADD COLUMN  limit_cred NUMERIC(18, 2) NULL;
  ALTER TABLE persons ADD COLUMN  fk_grupo INTEGER NULL;

  ALTER TABLE persons ADD CONSTRAINT person_fk_grupo
  FOREIGN KEY(fk_grupo) REFERENCES grupos_persons(id) ON UPDATE CASCADE;

  CREATE TABLE
  grupos_persons( -- create in 30/08/24
    id SERIAL NOT NULL,
    name_grupo VARCHAR(30),
    PRIMARY KEY(id)
  )

  insert into grupos_persons (name_grupo) values ('1-Cliente');
  insert into grupos_persons (name_grupo) values ('2-Fornecedor');
  insert into grupos_persons (name_grupo) values ('3-Transportadora');
  insert into grupos_persons (name_grupo) values ('4-Geral');



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

  /**Alterações realizadas na tabela person em 08/07/2024 */
  ALTER TABLE products ADD COLUMN  ncm VARCHAR(8)NOT NULL DEFAULT '00000000';
  ALTER TABLE products ADD COLUMN fk_un_med INT NOT NULL DEFAULT 1;
  ALTER TABLE products ADD COLUMN fk_classe INT NOT NULL DEFAULT 1;
  ALTER TABLE products ADD COLUMN fk_grupo_fiscal INT NOT NULL DEFAULT 1;
  ALTER TABLE products ADD COLUMN fk_tipo_prod INT NOT NULL DEFAULT 1;

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
);

/** Fiscal */
CREATE TABLE
table_trib(
  id_table_trib SERIAL NOT NULL,
  name_table VARCHAR(50) NOT NULL,
  icms_trib INT NOT NULL DEFAULT 90,
  icms_base NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  icms_aliq NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  icms_obs VARCHAR(50) NULL,
  iss_base NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  iss_aliq NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  sf_base NUMERIC(18,4) NOT NULL DEFAULT 100.0000,
  sf_aliq NUMERIC(18,4) NOT NULL DEFAULT 5.4000,
  ir_base NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  ir_aliq NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  cs_base NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  cs_aliq NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  pis_base NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  pis_aliq NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  cofins_base NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  cofins_aliq NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  ipi_aliq NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  cst_pis INT NOT NULL DEFAULT 99,
  cst_cofins INT NOT NULL DEFAULT 99,
  cst_ipi INT NOT NULL DEFAULT 99,
  icms_st_tributado NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  icms_aliq_st NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  icms_margem_st NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  icms_usa_margem_st CHAR(1) NOT NULL DEFAULT 'N',
  icms_mod_bc INTEGER NOT NULL DEFAULT 3,
  st_mod_bc INTEGER NOT NULL DEFAULT 4,
  icms_diferido NUMERIC(18,4) NOT NULL DEFAULT 0.000,
  csocn INTEGER NOT NULL DEFAULT 102,
  cod_trib_issqn CHAR(1) NOT NULL DEFAULT 1,
  cst_issqn_pref INTEGER NOT NULL DEFAULT 0,
  ipi_unit CHAR(1) NOT NULL DEFAULT 'N',
  icms_aliq_uf_dest NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  icms_aliq_interestadual NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  fcp_uf_dest_perc NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  fcp_uf_dest_base NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  fcp_uf_dest_base_st NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  fcp_uf_dest_perc_st NUMERIC(18,4) NOT NULL DEFAULT 0.0000,
  cod_benef_fiscal INTEGER NOT NULL DEFAULT 1,
  natureza_receita_pis_cofins INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY(id_table_trib)
);
INSERT INTO table_trib(name_table) VALUES ('Tribuacao de Mercadorias Normal');
INSERT INTO table_trib(name_table) VALUES ('Tribuacao de Mercadorias Por ST');
INSERT INTO table_trib(name_table) VALUES ('Tribuacao de Servicos');

CREATE TABLE
grupos_fiscais(
  id_grupo_fiscal SERIAL NOT NULL,
  name_grupo_fiscal VARCHAR(50) NOT NULL,
  fk_tabela_trib INTEGER NOT NULL,
  PRIMARY KEY(id_grupo_fiscal)
);
INSERT INTO grupos_fiscais(name_grupo_fiscal, fk_tabela_trib) VALUES ('Mercadorias Tributadas normalmente',1);
INSERT INTO grupos_fiscais(name_grupo_fiscal, fk_tabela_trib) VALUES ('Mercadorias Trib. por Substituicao Tributaria',2);
INSERT INTO grupos_fiscais(name_grupo_fiscal, fk_tabela_trib) VALUES ('Servicos Tributado pelo ISS',3);

CREATE TABLE
un_meds(
  id_un SERIAL NOT NULL,
  un_med VARCHAR(10),
  PRIMARY KEY(id_un)
);
INSERT INTO un_meds (un_med) values ('UN');
INSERT INTO un_meds (un_med) values ('PC');
INSERT INTO un_meds (un_med) values ('KIT');
INSERT INTO un_meds (un_med) values ('PCT');

CREATE TABLE
classes_prods(
  id_classe SERIAL NOT NULL,
  name_classe VARCHAR(15) NOT NULL,
  PRIMARY KEY(id_classe)
);
INSERT INTO classes_prods(name_classe) VALUES ('Sem Classe');
INSERT INTO classes_prods(name_classe) VALUES ('Informatica');
INSERT INTO classes_prods(name_classe) VALUES ('Celulares');
INSERT INTO classes_prods(name_classe) VALUES ('Telecom');

CREATE TABLE
tipos_prods(
  id_tipo SERIAL NOT NULL,
  name_tipo VARCHAR(30) NOT NULL,
  PRIMARY KEY(id_tipo)
);
INSERT INTO tipos_prods(name_tipo) VALUES ('00 - Mercadoria para Revenda');
INSERT INTO tipos_prods(name_tipo) VALUES ('01 - Materia Prima');
INSERT INTO tipos_prods(name_tipo) VALUES ('02 - Embalagem');
INSERT INTO tipos_prods(name_tipo) VALUES ('03 - Produto em Processo');
INSERT INTO tipos_prods(name_tipo) VALUES ('04 - Produto Acabado');
INSERT INTO tipos_prods(name_tipo) VALUES ('05 - SubProduto');
INSERT INTO tipos_prods(name_tipo) VALUES ('06 - Produto Intermediario');
INSERT INTO tipos_prods(name_tipo) VALUES ('07 - Material de Uso e Consumo');
INSERT INTO tipos_prods(name_tipo) VALUES ('08 - Ativo Imobilizado');
INSERT INTO tipos_prods(name_tipo) VALUES ('09 - Servicos');
INSERT INTO tipos_prods(name_tipo) VALUES ('10 - Outros Insumos');
INSERT INTO tipos_prods(name_tipo) VALUES ('99 - Outras');

CREATE TABLE
contas_receber(
  id_conta SERIAL NOT NULL,
  fk_filial INTEGER NOT NULL,
  tipo VARCHAR(10) NOT NULL,
  fk_venda INTEGER NULL,
  fk_user INTEGER NOT NULL,
  parcela VARCHAR(5) NOT NULL,
  valor NUMERIC(18,4) NOT NULL,
  multa NUMERIC(18,4) NOT NULL,
  juros NUMERIC(18,4) NOT NULL,
  desconto NUMERIC(18,4) NOT NULL,
  emissao TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  vencimento TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  saldo NUMERIC(18,4) NOT NULL,
  pagamento TIMESTAMP WITHOUT TIME ZONE NULL,
  recebimento NUMERIC(18,4) NOT NULL,
  -- observacao VARCHAR(100) NULL,
  -- fk_pagador INTEGER NOT NULL
  PRIMARY KEY (id_conta)
)

/**Alterações feitas na tabela contas_receber no dia 31/07/24 */
  ALTER TABLE contas_receber ADD COLUMN observacao VARCHAR(100)NULL;
  ALTER TABLE contas_receber ADD COLUMN fk_pagador INTEGER NOT NULL;
  ALTER TABLE contas_receber ADD CONSTRAINT person_fk_pagador
  FOREIGN key (fk_pagador) REFERENCES persons(id_person) ON UPDATE CASCADE;

CREATE TABLE vals_recebidos(
  id_val SERIAL NOT NULL,
  fk_conta INTEGER NOT NULL,
  fk_venda INTEGER NOT NULL,
  fk_user INTEGER NOT NULL,
  valor NUMERIC(18,4) NOT NULL,
  data_recebimento TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  -- descricao VARCHAR(50) NULL
  -- fk_person INTEGER NULL 
  PRIMARY KEY(id_val)
)
  -- create in 02/08/2024
  ALTER TABLE vals_recebidos ADD COLUMN descricao VARCHAR(50)NULL;
  ALTER TABLE vals_recebidos ADD COLUMN fk_person INTEGER NULL;

  CREATE TABLE caixa_mov( -- create in 03/08/2024
    id_caixa SERIAL NOT NULL,
    fk_val  INTEGER NOT NULL,
    data_recebimento TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
    debito NUMERIC(18,4) NULL,
    credito NUMERIC(18,4) NULL,
    saldo NUMERIC(18,4) NOT NULL,
    PRIMARY KEY(id_caixa)
  )
insert into caixa_mov (fk_val, credito,saldo)values(1,0,0)
ALTER TABLE caixa_mov ADD CONSTRAINT val_rec_fk_val
FOREIGN KEY(fk_val) REFERENCES vals_recebidos(id_val) ON UPDATE CASCADE;

-- Notas Recebidas --
CREATE TABLE notas_recebidas( -- create in 19/08/2024
  id_nota SERIAL NOT NULL,
  fk_fornecedor INTEGER NOT NULL,
  data_nota TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  emissao TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  num_nota INTEGER NOT NULL,
  modelo VARCHAR(10) NOT NULL,
  v_frete NUMERIC(18,4) NULL,
  v_seguro NUMERIC(18,4) NULL,
  desp_acessorias NUMERIC(18,4) NULL,
  acrescimo NUMERIC(18,4) NULL,
  desconto NUMERIC(18,4) NULL,
  t_produto NUMERIC(18,4) NULL,
  total NUMERIC(18,4) NULL,
  PRIMARY KEY(id_nota)
)

CREATE TABLE itens_comprados ( -- create in 19/08/2024
  id_item_sequen SERIAL NOT NULL,
  created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL DEFAULT NOW(),
  fk_nota INT NOT NULL,
  fk_item INT NOT NULL,
  quant INT NOT NULL,
  v_unit NUMERIC(18, 2) NOT NULL,
  total NUMERIC(18, 2) NOT NULL,
  PRIMARY KEY(id_item_sequen, fk_nota)
)

CREATE TABLE contas_pagar( -- create in 19/08/2024
  id_conta SERIAL NOT NULL,
  fk_filial INTEGER NOT NULL,
  tipo VARCHAR(10) NOT NULL,
  fk_compra INTEGER NULL,
  fk_user INTEGER NOT NULL,
  parcela VARCHAR(5) NOT NULL,
  valor NUMERIC(18,4) NOT NULL,
  multa NUMERIC(18,4) NOT NULL,
  juros NUMERIC(18,4) NOT NULL,
  desconto NUMERIC(18,4) NOT NULL,
  emissao TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  vencimento TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  saldo NUMERIC(18,4) NOT NULL,
  pagamento TIMESTAMP WITHOUT TIME ZONE NULL,
  recebimento NUMERIC(18,4) NOT NULL,
  observacao VARCHAR(100) NULL,
  -- fk_pagador INTEGER NOT NULL, --> remover
  -- fk_beneficiario, --> incluir
  -- fk_despesa INTEGER NULL
  PRIMARY KEY (id_conta)
)
 ALTER TABLE contas_pagar ADD COLUMN fk_despesa INTEGER NULL; -- create in 22/08/24
 ALTER TABLE contas_pagar ADD CONSTRAINT despesa_fk_despesa
 FOREIGN KEY(fk_despesa) REFERENCES despesas(id) ON UPDATE CASCADE;

 ALTER TABLE contas_pagar ADD COLUMN fk_beneficiario INTEGER NULL; -- create in 23/08/24


CREATE TABLE vals_pagos( -- create in 19/08/2024
  id_val SERIAL NOT NULL,
  fk_conta INTEGER NOT NULL,
  fk_compra INTEGER NOT NULL,
  fk_user INTEGER NOT NULL,
  valor NUMERIC(18,4) NOT NULL,
  data_recebimento TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  descricao VARCHAR(50) NULL,
  fk_person INTEGER NULL, 
    -- fk_despesa INTEGER NULL
  PRIMARY KEY(id_val)
)
 ALTER TABLE vals_pagos ADD COLUMN fk_despesa INTEGER NULL; -- create in 22/08/24

CREATE TABLE despesas( -- create in 22/08/24
id SERIAL NOT NULL,
name VARCHAR(20),
fk_setor INTEGER NOT NULL,
PRIMARY KEY(id)
)

CREATE TABLE setor_despesas( -- create in 22/08/24
id SERIAL NOT NULL,
name VARCHAR(25),
tipo VARCHAR(10),
PRIMARY KEY(id)
)
ALTER TABLE despesas ADD CONSTRAINT setor_despesas_fk_setor
FOREIGN KEY(fk_setor) REFERENCES setor_despesas(id) ON UPDATE CASCADE;

insert into setor_despesas (name, tipo) values('Comercial', 'Variavel');
insert into setor_despesas (name, tipo) values('Administrativa', 'Variavel');
insert into setor_despesas (name, tipo) values('Gerencial', 'Fixa');

insert into despesas (name, fk_setor) values ('Compras Normais', 1);
insert into despesas (name, fk_setor) values ('Energia Eletrica', 3);
insert into despesas (name, fk_setor) values ('Agua e Esgoto', 3);
insert into despesas (name, fk_setor) values ('Internet', 3);
insert into despesas (name, fk_setor) values ('Das - Mei', 3);
insert into despesas (name, fk_setor) values ('ICMS', 2);
insert into despesas (name, fk_setor) values ('Royalty Sistema', 1);
insert into despesas (name, fk_setor) values ('Pro-Labore', 2);
insert into despesas (name, fk_setor) values ('Cloud-Storage', 1);
insert into despesas (name, fk_setor) values ('Cloud-SisWeb', 1);
insert into despesas (name, fk_setor) values ('Combustivel', 2);
insert into despesas (name, fk_setor) values ('Aluguel', 3);

-- Notas de compras create in 19/08/24
ALTER TABLE itens_comprados ADD CONSTRAINT sale_fk_item
FOREIGN KEY(fk_nota) REFERENCES notas_recebidas(id_nota) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE itens_comprados ADD CONSTRAINT product_fk_item
FOREIGN KEY(fk_item) REFERENCES products(id_product) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE notas_recebidas ADD CONSTRAINT person_fk_fornecedor
FOREIGN KEY(fk_fornecedor) REFERENCES persons(id_person) ON UPDATE CASCADE ON DELETE CASCADE;

-- ALTER TABLE sales ADD CONSTRAINT filial_fk_name_filial
-- FOREIGN KEY(fk_name_filial) REFERENCES filiais(id_filial) ON UPDATE CASCADE ON DELETE CASCADE;
-- ALTER TABLE sales ADD CONSTRAINT user_fk_name_user

-- ALTER TABLE vals_recebidos ADD CONSTRAINT contas_receber_fk_conta /* create 23/07/2024 */
-- FOREIGN KEY(fk_conta) REFERENCES contas_receber(id_conta) ON UPDATE CASCADE; //removido
-- ALTER TABLE vals_recebidos ADD CONSTRAINT sale_val_rec_fk_sale
-- FOREIGN KEY(fk_venda) REFERENCES sales(id_sale) ON UPDATE CASCADE; //removido
ALTER TABLE vals_recebidos ADD CONSTRAINT user_val_rec_fk_user
FOREIGN KEY(fk_user) REFERENCES users(id) ON UPDATE CASCADE;

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

ALTER TABLE products ADD CONSTRAINT un_med_fk_un_med /* create 08/07/2024*/
FOREIGN KEY(fk_un_med) REFERENCES un_meds(id_un) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE products ADD CONSTRAINT grupos_fiscais_fk_grupo_fiscal /* create 08/07/2024*/
FOREIGN KEY(fk_grupo_fiscal) REFERENCES grupos_fiscais(id_grupo_fiscal) ON UPDATE CASCADE;
ALTER TABLE products ADD CONSTRAINT classes_prods_fk_classe /* create 08/07/2024*/
FOREIGN KEY(fk_classe) REFERENCES classes_prods(id_classe) ON UPDATE CASCADE;
ALTER TABLE products ADD CONSTRAINT tipos_prods_fk_tipo_prod /* create 08/07/2024*/
FOREIGN KEY(fk_tipo_prod) REFERENCES tipos_prods(id_tipo) ON UPDATE CASCADE;

ALTER TABLE persons ADD CONSTRAINT person_fk_name_filial
FOREIGN KEY(fk_name_filial) REFERENCES filiais(id_filial) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE persons ADD CONSTRAINT person_fk_id_user
FOREIGN KEY(fk_id_user) REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE grupos_fiscais ADD CONSTRAINT table_trib_fk_tabela_trib
FOREIGN KEY(fk_tabela_trib) REFERENCES table_trib(id_table_trib) ON UPDATE CASCADE

ALTER TABLE contas_receber ADD CONSTRAINT filial_fk_filial /* create 21/08/2024 */
FOREIGN key (fk_filial) REFERENCES filiais(id_filial) ON UPDATE CASCADE;

-- ALTER TABLE contas_receber ADD CONSTRAINT sale_fk_venda
-- FOREIGN key (fk_venda) REFERENCES sales(id_sale) ON UPDATE CASCADE; //removido

ALTER TABLE contas_receber ADD CONSTRAINT user_fk_user
FOREIGN key (fk_user) REFERENCES users(id) ON UPDATE CASCADE;

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
-- UPDATE sales SET val_rec = ( SELECT SUM( total_product )
-- FROM itens_sale WHERE fk_sale = NEW.fk_sale )
-- WHERE id_sale = NEW.fk_sale;                          
-- UPDATE sales
-- SET total_sale = val_rec - disc_sale
-- WHERE id_sale = NEW.fk_sale;
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER trg_sum_note AFTER INSERT ON itens_sale
FOR EACH ROW EXECUTE PROCEDURE fc_sum_note()

-- Trigger para creditar valor no caixa
CREATE OR REPLACE FUNCTION fc_credito_cx()
RETURNS TRIGGER AS
$BODY$
BEGIN
INSERT INTO caixa_mov (fk_val, credito, saldo)
VALUES (new.id_val, new.valor, new.valor + (select saldo from caixa_mov where id_caixa = (select MAX(id_caixa) from caixa_mov)));
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER trg_credito_cx AFTER INSERT ON vals_recebidos
FOR EACH ROW EXECUTE PROCEDURE fc_credito_cx()

-- Trigger para debitar valor no caixa
CREATE OR REPLACE FUNCTION fc_debito_cx()
RETURNS TRIGGER AS
$BODY$
BEGIN
INSERT INTO caixa_mov (fk_val, debito, saldo)
VALUES (new.id_val, new.valor, (select saldo from caixa_mov where id_caixa = (select MAX(id_caixa) from caixa_mov)) - new.valor);
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER trg_debito_cx AFTER INSERT ON vals_pagos
FOR EACH ROW EXECUTE PROCEDURE fc_debito_cx()