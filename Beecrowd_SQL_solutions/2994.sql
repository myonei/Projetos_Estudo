/*
Turma 815
Nome: Marcelo Tatsuo Yonei
E-mail: marceloyonei@gmail.com

---------------------------------------

Problema 2994

Você trabalha no setor de TI de um Hospital e precisa calcular a receita de pagamento de cada um dos médicos. 
Cada médico ganha 150$ por hora mais uma porcentagem dependendo do turno de trabalho, por exemplo, o médico 
Wellington trabalhou 1 hora no turno do dia, e 2 horas no turno da noite, logo seu salário semanal será: 
( ( 1 * 150 ) + 1% ) + ( ( 2 * 150 ) + 15% ) = 496.5. Além disso, você pode usar a função round(value,1) para 
exibir os salários com 1 casa decimal e ordene o resultado do maior para o menor salário.

*/

-- Solução --

SELECT
	doctors.name as name,
	-- cálculo do salário semanal de acordo com o tipo de work shift -> $150 * (horas trabalhadas) * (porcentagem de acordo com work shift)
	ROUND(SUM(150*attendances.hours*(CASE
										WHEN attendances.id_work_shift = 1 THEN 1.15
										WHEN attendances.id_work_shift = 2 THEN 1.02
										WHEN attendances.id_work_shift = 3 THEN 1.01
									 END)
		  ),1) as salary
FROM
	attendances
INNER JOIN
	doctors
	ON attendances.id_doctor = doctors.id
INNER JOIN
	work_shifts
	ON work_shifts.id = attendances.id_work_shift
GROUP BY
	doctors.name
ORDER BY
	salary DESC;

/*
-- QUERY PARA CRIAR AS TABELAS

--- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2994

CREATE TABLE doctors (
	id integer PRIMARY KEY,
	name varchar(50)
);

CREATE TABLE work_shifts (
	id integer PRIMARY KEY,
	name varchar(50),
	bonus numeric
);

CREATE TABLE attendances (
	id integer PRIMARY KEY,
	id_doctor integer,
	hours integer,
	id_work_shift integer,
	FOREIGN KEY (id_doctor) REFERENCES  doctors(id),
	FOREIGN KEY (id_work_shift) REFERENCES  work_shifts(id)
);

insert into doctors (id,name) values
	(1,'Arlino'),
	(2,'Tiago'),
	(3,'Amanda'),
	(4,'Wellington');

insert into work_shifts (id,name,bonus) values
	(1,'nocturnal',15),
	(2,'afternoon',2),
	(3,'day',1);

insert into  attendances (id, id_doctor, hours, id_work_shift) values
	(1,1,5,1),
	(2,3,2,1),
	(3,3,3,2),
	(4,2,2,3),
	(5,1,5,3),
	(6,4,1,3),
	(7,4,2,1),
	(8,3,2,2),
	(9,2,4,2);

/*  Execute this query to drop the tables */
-- DROP TABLE attendances;
-- DROP TABLE work_shifts CASCADE;
-- DROP TABLE doctors CASCADE;
*/