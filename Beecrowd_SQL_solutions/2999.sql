SELECT
	empregado_nome,
	salario
FROM
	(SELECT
		empregado_nome,
		divisao,
		(sal-desconto) as salario,
		ROUND(AVG(sal-desconto) OVER (PARTITION BY divisao), 2) as media
	FROM
		(SELECT
			empregado.matr as empregado_matricula,
			empregado.nome as empregado_nome,
			departamento.nome as departamento,
			divisao.nome as divisao,
			SUM(COALESCE(vencimento.valor,0)) as sal,
			COALESCE(desconto_soma.desconto_valor, 0) as desconto
		FROM 
			empregado
		INNER JOIN
			departamento ON departamento.cod_dep = empregado.lotacao
		INNER JOIN
			divisao ON divisao.cod_divisao = empregado.lotacao_div
		LEFT JOIN
			emp_venc ON emp_venc.matr = empregado.matr
		LEFT JOIN
			vencimento ON vencimento.cod_venc = emp_venc.cod_venc
		LEFT JOIN
			(SELECT 
				emp_desc.matr as matricula,
				SUM(desconto.valor) as desconto_valor
			FROM 
				emp_desc
			INNER JOIN
				desconto ON desconto.cod_desc = emp_desc.cod_desc
			GROUP BY
				emp_desc.matr) AS desconto_soma
			ON desconto_soma.matricula = empregado.matr
		GROUP BY
			empregado.matr, empregado.nome, departamento.nome, divisao.nome, desconto_soma.desconto_valor) as salario_divisao
	ORDER BY
		divisao, empregado_nome) as aux
WHERE
	salario>media



