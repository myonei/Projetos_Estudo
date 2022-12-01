SELECT
	aux2.name,
	aux2.investment,
	aux1.month_of_payback,
	aux2.return
FROM
(
	SELECT
		name,
		investment,
		month_of_payback,
		MIN(cum_sum - investment) as return
	FROM
		(SELECT
			clients.id,
			name,
			clients.investment,
			month as month_of_payback,
			profit,
			SUM(profit) OVER (PARTITION BY name ORDER BY month) as cum_sum
		FROM
			clients
		INNER JOIN
			operations
			ON operations.client_id = clients.id
		ORDER BY
			clients.id ASC, month ASC) as investment
	WHERE
		(cum_sum - investment) >=0
	GROUP BY
		name, investment, month_of_payback
) as aux1
INNER JOIN
(
	SELECT
		name,
		investment,
		MIN(cum_sum - investment) as return
	FROM
		(SELECT
			clients.id,
			name,
			clients.investment,
			month as month_of_payback,
			profit,
			SUM(profit) OVER (PARTITION BY name ORDER BY month) as cum_sum
		FROM
			clients
		INNER JOIN
			operations
			ON operations.client_id = clients.id
		ORDER BY
			clients.id ASC, month ASC) as investment
	WHERE
		(cum_sum - investment) >=0
	GROUP BY
		name, investment
) as aux2
ON aux1.return = aux2.return