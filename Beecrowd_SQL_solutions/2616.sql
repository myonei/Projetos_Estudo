/*
Turma 815
Nome: Marcelo Tatsuo Yonei
E-mail: marceloyonei@gmail.com

---------------------------------------

Problema 2616

A locadora pretende fazer uma promoção para os clientes que ainda não fizeram nenhuma locação.

Seu trabalho é nos entregar o ID e o nome dos clientes que não realizaram nenhuma locação. Ordene a saída por ID.

*/

-- Solução --
/*
Selecionar apenas os customers.id que não estão em locations, pois a tabela locations contém apenas os clientes que fizeram locações.
*/

SELECT 
	customers.id, customers.name
FROM 
	customers
LEFT JOIN 
	locations
    on locations.id_customers = customers.id
WHERE 
	-- Filtrando apenas os customers id que não estão na tabela locations através da subquery (SELECT locations.id_customers FROM locations)
	customers.id NOT IN (SELECT locations.id_customers
						 FROM locations)
ORDER BY customers.id;

/*
-- QUERY PARA CRIAR AS TABELAS

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2616

CREATE TABLE customers (
  id numeric PRIMARY KEY,
  name varchar(50),
  street varchar(50),
  city varchar(50)
);


CREATE TABLE locations (
  id numeric PRIMARY KEY,
  locations_date date,
  id_customers numeric REFERENCES customers (id)
);

INSERT INTO customers (id, name, street, city)
VALUES
  (1,	'Giovanna Goncalves Oliveira',	'Rua Mato Grosso',	'Canoas'),
  (2,	'Kauã Azevedo Ribeiro',	'Travessa Ibiá',	'Uberlândia'),
  (3,	'Rebeca Barbosa Santos',	'Rua Observatório Meteorológico',	'Salvador'),
  (4,	'Sarah Carvalho Correia',	'Rua Antônio Carlos da Silva',	'Apucarana'),
  (5,	'João Almeida Lima',	'Rua Rio Taiuva',	'Ponta Grossa'),
  (6,	'Diogo Melo Dias',	'Rua Duzentos e Cinqüenta',	'Várzea Grande');
  

INSERT INTO locations (id , locations_date, id_customers)
VALUES
  (1,	'09/10/2016',	3),
  (2,	'02/09/2016',	1),
  (3,	'02/08/2016',	4),
  (4,	'02/09/2015',	2),
  (5,	'02/03/2016',	6),
  (6,	'04/04/2016',	4);
  

  /*  Execute this query to drop the tables */
  -- DROP TABLE IF EXISTS locations, customers; --

*/