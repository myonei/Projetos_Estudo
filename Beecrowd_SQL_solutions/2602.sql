/*
Turma 815
Nome: Marcelo Tatsuo Yonei
E-mail: marceloyonei@gmail.com

---------------------------------------

Problema 2602

Sua empresa está fazendo um levantamento de quantos clientes estão cadastrados nos estados, porém, 
faltou levantar os dados do estado do Rio Grande do Sul.

Então você deve Exibir o nome de todos os clientes cujo estado seja ‘RS’.
*/

-- Solução

SELECT name 
FROM customers
WHERE state = 'RS';

/*
-- QUERY PARA CRIAR A TABELA

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2602

CREATE TABLE customers (
  id NUMERIC PRIMARY KEY,
  name CHARACTER VARYING (255),
  street CHARACTER VARYING (255),
  city CHARACTER VARYING (255),
  state CHAR (2),
  credit_limit NUMERIC
);

INSERT INTO customers (id, name, street, city, state, credit_limit)
VALUES 
  (1,	'Pedro Augusto da Rocha',	'Rua Pedro Carlos Hoffman',	'Porto Alegre',	'RS',	700.00),
  (2,	'Antonio Carlos Mamel',	'Av. Pinheiros', 'Belo Horizonte',	'MG',	3500.50),
  (3,	'Luiza Augusta Mhor',	'Rua Salto Grande',	'Niteroi',	'RJ',	4000.00),	
  (4,	'Jane Ester',	'Av 7 de setembro',	'Erechim',	'RS',	800.00),
  (5, 'Marcos Antônio dos Santos',	'Av Farrapos',	'Porto Alegre',	'RS',	4250.25);

  
  /*  Execute this query to drop the tables */
  -- DROP TABLE customers; --

*/