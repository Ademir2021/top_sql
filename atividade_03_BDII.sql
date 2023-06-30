CREATE TABLE clientes(
    id SERIAL NOT NULL,
    nome VARCHAR(60),
    saldodevedor NUMERIC(10,2),
    PRIMARY KEY (id)
);

INSERT INTO clientes(nome, saldodevedor) values ('joao',60.00);
UPDATE clientes set saldodevedor = 0 where id = 1

CREATE TABLE contasreceber(
    id SERIAL NOT NULL,
    idcliente INT NOT NULL,
    valor NUMERIC(10,2),
    status CHAR(1) NOT NULL default 'N',
    PRIMARY KEY (id),
        FOREIGN KEY (idcliente) REFERENCES
            clientes(id) ON DELETE CASCADE
);

INSERT INTO contasreceber ( idcliente, valor ) VALUES ( 1, 34 );

CREATE OR REPLACE FUNCTION fc_contasreceber()
RETURNS trigger AS
$BODY$
BEGIN
IF NEW.status = 'N' THEN
UPDATE clientes SET saldodevedor = saldodevedor +
(SELECT NEW.valor FROM contasreceber LIMIT 1) WHERE NEW.idcliente = id;
END IF;
IF NEW.status = 'S' THEN
UPDATE clientes SET saldodevedor = saldodevedor -
(SELECT NEW.valor FROM contasreceber LIMIT 1) WHERE NEW.idcliente = id;
END IF;
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql;

CREATE TRIGGER trg_contasreceber AFTER INSERT ON contasreceber
FOR EACH ROW EXECUTE PROCEDURE fc_contasreceber()

select *from contasreceber 
select *from clientes
update clientes set saldodevedor = 0 where id = 1

INSERT INTO contasreceber(idcliente, valor, status)VALUES(1, 45.80, 'N');
INSERT INTO contasreceber(idcliente, valor, status)VALUES(2, 36.76, 'N');

INSERT INTO contasreceber VALUES (11, 1, 10, 'S');
