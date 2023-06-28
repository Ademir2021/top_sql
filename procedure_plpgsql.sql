-- testes no schema unicesumar postgresql --

-- tranf bancaria --
CREATE TABLE contas(
      id INT,
      nome VARCHAR(50),
      saldo DECIMAL(10,2)
);
INSERT INTO contas(id, nome, saldo)
VALUES(1, 'Ana', 5000);
INSERT INTO contas(id, nome, saldo)
VALUES(2, 'Bruno', 10000);

CREATE OR REPLACE PROCEDURE
transferencia(origem int, destino int, valor decimal)
LANGUAGE plpgsql
AS $$
BEGIN
UPDATE contas SET saldo = saldo - valor WHERE id = origem;
UPDATE contas SET saldo = saldo + valor WHERE id = destino;
END;
$$;

CALL transferencia(1, 2, 300)
SELECT *FROM contas;

-- log_table --
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







