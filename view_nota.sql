CREATE OR REPLACE VIEW nota AS

SELECT
sales.id_sale AS "nota",
filiais.name_filial AS "filial",
persons.name_pers AS "comprador",
persons.cpf_pers AS "cpf",
users.name AS "usuario",
users.username AS "email",
sales.created_at AS "emitida",
sales.val_rec AS "val_rec",
sales.disc_sale AS "desc_venda",
sales.total_sale as "total_venda"
FROM sales
INNER JOIN filiais ON (id_filial = fk_name_filial)
INNER JOIN persons ON (id_person = fk_name_pers)
INNER JOIN users ON (id = fk_name_user)

AND id_sale = 3


SELECT *FROM
nota WHERE nota =1