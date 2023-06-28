-- schema unicesumar oracle --
-- Programação em SQL PL/SQL --
-- Oracle Developer --

-- Programação em SQL --
--Estrutura do PL/SQL --
-- AS unidades feitas em PL/SQL podem ser definidas em um ou mais blocos --

DECLARE (Opcional)
        Variaveis, cursores, execoes
BEGIN (Obrigatorio)
    -Declarações SQL
    -Declarações PL/SQL
EXCEPTION(Opcional)
    Manusear acoes a serem tomadas quando ocorrerem erros
    pré-definidos
END; (Obrigatorio)

DECLARE
    X_nome Y,nome%TYPE;
BEGIN
    SELECT nome INTO X_nome FROM Y WHERE nome = 123
    ...
END;

CREATE [OR REPLACE] PROCEDURE nome_procedimento
    [(parametro1) [modo] tipo1,
        Parametro2 [modo2] tipo2,
        ...) ]
        IS | AS
        PL/SQL Block ;

CREATE TABLE LOG_TABLE (USUARIO CHAR(20) NOT NULL,
                    DATA DATE DEFAULT SYSDATE );
CREATE OR REPLACE PROCEDURE log_execution IS
BEGIN
INSERT INTO LOG_TABLE (USUARIO, DATA)
            VALUES (USER, SYSDATE);
END;

CREATE OR REPLACE PROCEDURE aumenta_sal (p_empno IN emp.empno%TYPE) IS
BEGIN
    UPDATE scott.emp
    SET sal = sal * 1.10
    WHERE empno = p_empno
    END aumenta_sal;
    /

EXECUTE aumenta_sal(7839);

CREATE TABLE log_table (usuario char(20) NOT NULL,
data date default sysdate);

CREATE OR REPLACE PROCEDURE log_execution is
BEGIN
INSERT INTO log_table(usuario, data)
VALUES (user, sysdate);
END;

INSERT INTO log_table(usuario) VALUES ('Pedro');
SELECT *FROM log_table;

CREATE TABLE LOG_TABLE (
USUARIO CHAR(20) NOT NULL,
DATA DATE DEFAULT SYSDATE);

CREATE OR REPLACE PROCEDURE log_exectution IS
BEGIN
INSERT INTO LOG_TABLE (USUARIO, DATA)
VALUES (USER, SYSDATE);
END;

CREATE TABLE emp (
empno INT NOT NULL PRIMARY KEY,
sal numeric NOT NULL);

INSERT INTO emp(empno, sal) VALUES (1, 800);
SELECT *FROM emp;

CREATE OR REPLACE PROCEDURE aumenta_sal (p_empno in emp.empno%type) IS
BEGIN
UPDATE
emp
SET sal = sal * 1.67
WHERE
empno = p_empno;
END aumenta_sal;

UPDATE emp SET sal = 2000 WHERE empno = 1;

EXECUTE aumenta_sal(1);

CREATE TABLE segmercado(
id_seg INT NOT NULL PRIMARY KEY,
segmento VARCHAR(200) NOT NULL);

CREATE OR REPLACE PROCEDURE incluir_segmercado
(p_id_seg IN INT, p_segmento in varchar2)
IS
BEGIN
INSERT INTO segmercado(id_seg, segmento) values
(p_id_seg, UPPER(p_segmento));
COMMIT;
END;

EXECUTE incluir_segmercado(2, 'Higiene');
SELECT *FROM segmercado;

CREATE OR REPLACE FUNCTION obter_segmento_segmercado
(p_id_seg IN segmercado.id_seg%TYPE)
RETURN segmercado.segmento%TYPE
IS
v_segmento segmercado.segmento%TYPE;
BEGIN
SELECT segmento INTO v_segmento FROM segmercado WHERE id_seg = p_id_seg;
RETURN v_segmento;
END;

SELECT id_seg, obter_segmento_segmercado(id_seg)
FROM segmercado WHERE id_seg >0;

