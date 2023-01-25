INSERT INTO filiais(nome_filial)
VALUE
('Empresa Modelo');

INSERT INTO marcas(nome_marca)
VALUES
('Geral'),
('Elsys'),
('Aquario'),
('Multilaser'),
('Greateak'),
('Elgin');

INSERT INTO departamentos(nome_departamento)
VALUES
('Geral'),
('Informática'),
('Eletrônicos'),
('Antenas'),
('Telecom'),
('Programação');

INSERT INTO clientes(nome_cli, cpf_cli, endereco_cli, fk_nome_filial)
VALUES
('Consumidor', '', 'Endereço ModeloI', 1),
('Cliente Modelo', 'NC', 'Endereço ModeloII', 1),
('Vendedor Modelo', 'NC', 'Endereço ModeloIII', 1),
('Fornecedor Modelo', '99999999999', 'Endereço ModeloIV', 1);

INSERT INTO itens(descric_item, valor_item, fk_marca, fk_departamento)
VALUES
('Receptor Sat. HD Sky Conforto', 500, 2, 3),
('Receptor Sat, HD Elsys SATMAX/Plus', 520, 2, 3),
('Mouse Optico c/fio preto', 20, 2, 4),
('Teclado Padrão Abnt', 35, 2, 4),
('Pen Drive 16GB Multilaser', 45, 2, 4),
('Midia DVD Virgem Elsys', 2.50, 1, 1),
('Encordoamento Violão aço Rouxinol', 30, 1, 2),
('Conector F c/anel RG59', 1.20, 1, 4),
('Cabo coaxial RG59 parabolica, mt', 2.20, 1, 4),
('Convesor digital Aquario', 149, 4, 3),
('Antena UHF sinal digital Log 38elem', 90.00, 3, 4);

INSERT INTO vendas(fk_nome_cli, data_venda) VALUES (1, NOW());

INSERT INTO venda_itens(fk_venda, fk_item, quant_item, valor_item) VALUE (1, 4, 10, 45.60);