--The manager wants you to show him the name of the lawyer with the most clients, 
--the one with the fewest and the client average considering all lawyers.
--OBS: Before presenting the average, show a field called Average to make 
--the report more readable. The average must be presented as an integer.

SELECT name , customers_number FROM lawyers
WHERE customers_number=(SELECT MAX(customers_number) from lawyers)
UNION ALL
SELECT name, customers_number FROM lawyers
WHERE customers_number=(SELECT MIN(customers_number) from lawyers)
UNION ALL
SELECT 'Average', CAST (ROUND(AVG(customers_number)) AS INTEGER)
FROM lawyers;


