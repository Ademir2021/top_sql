CREATE TABLE filiais( /* mysql**/
    id_filial INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_filial VARCHAR(60)
);

CREATE TABLE marcas(
    id_marca INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_marca VARCHAR(60)
);

CREATE TABLE departamentos(
    id_departamento INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_departamento VARCHAR(60)
);

CREATE TABLE clientes(
    id_cliente INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_cli VARCHAR(60),
    cpf_cli VARCHAR(11),
    endereco_cli VARCHAR(60),
    fk_nome_filial INTEGER,
    FOREIGN KEY (fk_nome_filial) REFERENCES filiais(id_filial) ON DELETE CASCADE
);

CREATE TABLE vendas(
    id_venda INTEGER AUTO_INCREMENT PRIMARY KEY,
    fk_nome_cli INTEGER,
    data_venda TIMESTAMP,
    valor_rec NUMERIC(18,2),
    desc_venda NUMERIC(18,2),
    total_venda NUMERIC(18,2),
    FOREIGN KEY (fk_nome_cli) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

CREATE TABLE itens(
    id_item INTEGER AUTO_INCREMENT PRIMARY KEY,
    descric_item VARCHAR(60),
    valor_item NUMERIC(18,2),
    valor_min_item NUMERIC(18,2),
    fk_marca INTEGER,
    fk_departamento INTEGER,
    FOREIGN KEY(fk_marca) REFERENCES marcas(id_marca) ON DELETE CASCADE,
    FOREIGN KEY(fk_departamento) REFERENCES departamentos(id_departamento) ON DELETE CASCADE
);

CREATE TABLE venda_itens(
    v_item_sequen INTEGER AUTO_INCREMENT,
    fk_venda INTEGER,
    fk_item INTEGER,
    quant_item INTEGER,
    valor_item NUMERIC(18,2),
    total_item NUMERIC(18,2),
    PRIMARY KEY(v_item_sequen, fk_venda),
    FOREIGN KEY(fk_venda) REFERENCES vendas(id_venda) ON DELETE CASCADE,
    FOREIGN KEY(fk_item) REFERENCES itens(id_item) ON DELETE CASCADE
);