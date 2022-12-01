SELECT
	data_score.name,
	data_score.matches,
	data_score.victories,
	data_score.defeats,
	data_score.draws,
	((victories*3) + draws) as score
	FROM(SELECT
		teams.name as name, 
		count(matches.team_1 + matches.team_2) as matches,
		SUM(CASE WHEN 
			(matches.team_1_goals > matches.team_2_goals AND teams.id = matches.team_1)
			OR 
			(matches.team_2_goals > matches.team_1_goals AND teams.id = matches.team_2) 
			THEN 1 
			ELSE 0 
			END) as victories,
		SUM(CASE WHEN 
			(matches.team_1_goals < matches.team_2_goals AND teams.id = matches.team_1)
			OR 
			(matches.team_2_goals < matches.team_1_goals AND teams.id = matches.team_2) 
			THEN 1 
			ELSE 0 
			END) as defeats,
		SUM(CASE WHEN 
			(matches.team_1_goals = matches.team_2_goals)
			THEN 1 
			ELSE 0 
			END) as draws,
		SUM(CASE WHEN 
			(matches.team_1_goals = matches.team_2_goals)
			THEN 1 
			ELSE 0 
			END) as draw
	FROM teams
	INNER JOIN matches
	ON (matches.team_1 = teams.id) or (matches.team_2 = teams.id)
	GROUP BY teams.name) as data_score
ORDER BY score DESC;
	