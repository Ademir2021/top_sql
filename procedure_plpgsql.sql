-- TESTE NO SCHMEA UNICESUMAR POSTGRESQL --

-- TRANSFERENCIA BANCARIA --
CREATE TABLE contas (
id INT,
nome VARCHAR(50),
saldo DECIMAL(10,2)
);

INSERT INTO contas (id, nome, saldo)
VALUES (1, 'Ana', 5000);
INSERT INTO contas(id, nome, saldo)
VALUES (2, 'Bruno', 10000);

CREATE OR REPLACE PROCEDURE
transferencia (origem int, destino int, valor decimal)
LANGUAGE plpgsql
AS $$
BEGIN
UPDATE contas
SET saldo = saldo - valor
WHERE id = origem;
UPDATE contas
SET saldo = saldo + valor
WHERE id = destino;
END;
$$;

CALL transferencia(1, 2, 300)
SELECT *FROM contas;

-- LOG_TABLE --
CREATE TABLE LOG_TABLE (
USUARIO CHAR(20) NOT NULL,
DATA DATE default now()
);

CREATE OR REPLACE PROCEDURE log_execution
(USUARIO CHAR, DATA Date)
LANGUAGE SQL
AS $$
INSERT INTO LOG_TABLE (USUARIO, DATA)
VALUES (USER, now());
$$;

INSERT INTO log_table(usuario) VALUES ('Mario');
SELECT *FROM log_table;

-- AMOSTRA --
CREATE TABLE IF NOT EXISTS t_demo (id int);

CREATE OR REPLACE PROCEDURE amostra_1(x int)
LANGUAGE SQL
AS $$
INSERT INTO t_demo VALUES (x);
$$;

CALL amostra_1(1000);

CREATE OR REPLACE PROCEDURE amostra()
LANGUAGE plpgsql
AS $$
DECLARE
v_sum int8;
BEGIN
INSERT INTO t_demo VALUES (1);
INSERT INTO t_demo VALUES (2);
COMMIT;
INSERT INTO t_demo VALUES (3);
INSERT INTO t_demo VALUES (4);
INSERT INTO t_demo VALUES (5);
SELECT sum(id) FROM t_demo WHERE id <= 5 INTO v_sum;
RAISE NOTICE 'debug info: %', v_sum;
END;
$$;

CALL amostra();

select *from t_demo
delete from t_demo


