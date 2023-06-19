/*Criação de chave estrangeira fk_id_user na tabela persons **/
ALTER TABLE persons ADD COLUMN fk_id_user INTEGER not null; [?]

ALTER TABLE persons ADD CONSTRAINT person_fk_users
FOREIGN KEY (fk_id_user) REFERENCES users(id) ON DELETE CASCADE; [?]

/* coluna da Tabela disc_val deve ficar NUll**/

/** Create column phone_pers na tabela persons*/
alter table persons add column phone_pers varchar(11) null