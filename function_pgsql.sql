-- function plpgsql  schema unicesumar --

CREATE OR REPLACE FUNCTION soma(num1 int, num2 int)
 RETURNS text AS $$
  BEGIN
   RAISE NOTICE 'Iniciando a soma';
 RETURN 'A soma do dois numeros é: ' || num1 + num2;
END;
$$ LANGUAGE plpgsql;

SELECT soma(23, 23)

drop function soma(int ,int)
