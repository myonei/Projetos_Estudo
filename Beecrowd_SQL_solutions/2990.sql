/*
Turma 815
Nome: Marcelo Tatsuo Yonei
E-mail: marceloyonei@gmail.com

---------------------------------------

Problema 2990

Mostrar o CPF, nome dos empregados e o nome do departamento dos empregados que não trabalham em nenhum projeto. 
O resultado deve estar ordenado por cpf
*/

-- Solução --

SELECT 
	empregados.cpf,
	empregados.enome,
	departamentos.dnome
FROM 
	empregados
INNER JOIN -- União das tabelas departamentos e empregados para poder retornar o nome do departamento
	departamentos
	ON departamentos.dnumero = empregados.dnumero
LEFT JOIN -- União com left join pois é necessário que retorne null na coluna trabalha.pnumero para os empregados que não estão em nenhum projeto.
	trabalha
	ON empregados.cpf = trabalha.cpf_emp
WHERE -- Todos os empregados que não estão em nenhum projeto não possuem valor atribuído na coluna trabalha.pnumero.
	trabalha.pnumero IS NULL
ORDER BY
	CPF ASC;

/*
-- QUERY PARA CRIAR A TABELA

---- URI Online Judge SQL
--- Copyright URI Online Judge
--- www.urionlinejudge.com.br
--- Problem 2990

CREATE TABLE empregados (
    cpf varchar(15),
    enome varchar(60),
    salario float,
    cpf_supervisor varchar(15),
    dnumero integer,
    PRIMARY KEY (cpf)
);

CREATE TABLE departamentos (
    dnumero integer,
    dnome varchar(60),
    cpf_gerente varchar(15),
    PRIMARY KEY (dnumero),
    CONSTRAINT fk_cpf FOREIGN KEY(cpf_gerente) REFERENCES empregados(cpf)
);

CREATE TABLE trabalha (
    cpf_emp varchar(15),
    pnumero integer,
    CONSTRAINT fk_cpfemp FOREIGN KEY(cpf_emp) REFERENCES empregados(cpf)
);

CREATE TABLE projetos (
    pnumero integer,
    pnome varchar(45),
    dnumero integer,
    PRIMARY KEY(pnumero),
    CONSTRAINT fk_dnum FOREIGN KEY(dnumero) REFERENCES
    departamentos(dnumero)
);


Insert Into empregados
values ('049382234322','João Silva', 2350, '2434332222', 1010);
Insert Into empregados(cpf, enome, salario, cpf_supervisor, dnumero)
values ('586733922290','Mario Silveira', 3500, '2434332222', 1010);
Insert Into empregados
values ('2434332222','Aline Barros', 2350, NULL, 1010);

Insert Into empregados
values ('1733332162','Tulio Vidal', 8350, NULL, 1020);
Insert Into empregados
values ('4244435272','Juliana Rodrigues', 3310, NULL, 1020);
Insert Into empregados
values ('1014332672','Natalia Marques', 2900, NULL, 1010);


Insert Into departamentos (dnumero, dnome, cpf_gerente)
values (1010, 'Pesquisa', '049382234322');
Insert Into departamentos
values (1020, 'Ensino', '2434332222');
Insert Into trabalha (cpf_emp, pnumero)
values ('049382234322', 2010);
Insert Into trabalha (cpf_emp, pnumero)
values ('586733922290', 2020);
Insert Into trabalha (cpf_emp, pnumero)
values ('049382234322', 2020);
Insert Into projetos (pnumero, pnome, dnumero)
values (2010,'Alpha', 1010);
Insert Into projetos (pnumero, pnome, dnumero)
values (2020,'Beta', 1020);

ALTER TABLE empregados ADD CONSTRAINT fk_dnum FOREIGN KEY(dnumero)
REFERENCES departamentos(dnumero);
ALTER TABLE trabalha ADD CONSTRAINT fk_pnum FOREIGN KEY(pnumero)
REFERENCES projetos(pnumero);

/*  Execute this query to drop the tables */
--DROP TABLE IF EXISTS empregados, trabalha, departamentos, projetos CASCADE;

*/