use teste;
show tables;

-- inserindo a data e hora automaticamente --
insert into vendas (nome, data)
values
('Midia DVD Virgem', now()),
('Placa VGA 512MB', now()),
('Encordoamento Violao Aço', now()),
('Teclado Padrão Abnt', now()),
('Mouse Optico c/Fio', now()),
('Pen Drive 16GB', now());

select *from vendas;

delete from vendas where venda < 20;
alter table vendas auto_increment = 0;

-- Altera o tipo de coluna --
describe vendas;
alter table vendas change venda venda int auto_increment ;