ALTER TABLE ceps DROP CONSTRAINT ceps_code_city;
ALTER TABLE ceps ADD CONSTRAINT ceps_code_city
FOREIGN KEY(code_city) REFERENCES cities(id_city) ON UPDATE CASCADE

ALTER TABLE cities DROP CONSTRAINT country_code_country;
ALTER TABLE cities ADD CONSTRAINT country_code_country
FOREIGN KEY(code_country) REFERENCES countries(id_country) ON UPDATE CASCADE

ALTER TABLE persons DROP CONSTRAINT person_fk_cep;
ALTER TABLE persons ADD CONSTRAINT person_fk_cep
FOREIGN KEY(fk_cep) REFERENCES ceps(id_cep) ON UPDATE CASCADE;
