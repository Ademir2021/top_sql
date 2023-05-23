CREATE TABLE usuarios(
id_usuario SERIAL NOT NULL,
nome_usuario VARCHAR(60),
primary key(id_usuario)
);
INSERT INTO usuarios(nome_usuario) VALUES('Maria');
SELECT *FROM USUARIOS;

CREATE TABLE produtos(
id_produto SERIAL NOT NULL,
nome VARCHAR(60),
estoque NUMERIC(10,2),
estoque_min NUMERIC(10,2),
usuario_create INT,
usuario_update INT,
PRIMARY KEY(id_produto)
);
INSERT INTO produtos(
nome, estoque, estoque_min, usuario_create, usuario_update)
values(
'Carregador Micro USB', 10, 15, 2, 1);
UPDATE produtos SET NOME = 'Controle Remoto Philco' where id_produto = 1;
SELECT *FROM produtos;

CREATE TABLE auditoria_produto(
id_audit SERIAL NOT NULL,
data_acao TIMESTAMP NOT NULL,
acao VARCHAR(60),
usuario INT NOT NULL,
id_produto_fk INT NOT NULL,
PRIMARY KEY( id_audit ),
FOREIGN KEY (id_produto_fk) REFERENCES produtos(id_produto) ON DELETE CASCADE
);
SELECT *FROM auditoria_produto;

CREATE OR REPLACE FUNCTION fc_audita_produtos_insert()
RETURNS trigger AS
$BODY$
BEGIN
INSERT INTO auditoria_produto (id_produto_fk, data_acao, acao, usuario)
values (new.id_produto, NOW(), 'Inserido', new.usuario_create);
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER trg_audita_produtos_create AFTER INSERT ON produtos
FOR EACH ROW EXECUTE PROCEDURE fc_audita_produtos_insert()

CREATE OR REPLACE FUNCTION fc_audita_produtos_update()
RETURNS trigger AS
$BODY$
BEGIN
INSERT INTO auditoria_produto (id_produto_fk, data_acao, acao, usuario)
values (new.id_produto, NOW(), 'Atualizado', new.usuario_update);
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER trg_audita_produtos_update AFTER UPDATE ON produtos
FOR EACH ROW EXECUTE PROCEDURE fc_audita_produtos_update()

DROP TRIGGER trg_audita_produtos_create ON produtos
DROP  FUNCTION fc_audita_produtos_insert()

CREATE VIEW vw_audita_produto AS
SELECT
a.id_audit,
a.data_acao,
a.acao,
u.id_usuario,
u.nome_usuario,
p.id_produto,
p.nome as nome_produto
from
auditoria_produto as a,
usuarios as u,
produtos as p
where
a.id_produto_fk = id_produto and
a.usuario = u.id_usuario;

SELECT *FROM vw_audita_produto;
