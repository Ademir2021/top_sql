CREATE OR REPLACE PROCEDURE
fc_calc_note(note int)
LANGUAGE plpgsql
AS $$
BEGIN
UPDATE sales
SET val_rec = (
SELECT SUM(total_product) FROM itens_sale WHERE fk_sale = note )
WHERE id_sale = note;
UPDATE sales
SET total_sale = val_rec - disc_sale
WHERE id_sale = note;
END;
$$;

CALL fc_calc_note(1)
select *from sales 
select *from itens_sale

-- com loop --
CREATE OR REPLACE PROCEDURE
fc_calc_note()
LANGUAGE plpgsql
AS $$
DECLARE
note int := 1;
max_note int :=0;
BEGIN
max_note := (SELECT MAX(id_sale) from sales);
FOR  note IN note..max_note
LOOP
UPDATE sales SET val_rec = ( SELECT SUM( total_product ) FROM itens_sale WHERE fk_sale = note ) WHERE id_sale = note;
UPDATE sales SET total_sale = val_rec - disc_sale WHERE id_sale = note;
END LOOP;
END;
$$;

update sales set total_sale = 0, val_rec = 0;
select *from sales;
CALL fc_calc_note();