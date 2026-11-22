SELECT *
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
--1. Retrieve the 20 richest billionaires.
SELECT rank,
       name,
       age,
       networth_billion,
       industry
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
LIMIT 20;
--2. Identify the five youngest billionaires.
SELECT rank,
       name,
       age,
       networth_billion,
       industry
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
ORDER BY age ASC 
LIMIT 5;
--3. Calculate the average age and average net worth.
SELECT AVG(age) AS average_age,
       AVG(networth_billion) AS average_networth
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld;
--4. Identify the five most represented countries.
SELECT country,
       COUNT (*)  AS no_of_billionaires
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
GROUP BY 1 
ORDER BY 2 DESC
LIMIT 5;
--5. Calculate the combined net worth of billionaires from each country.
SELECT country,
       SUM(networth_billion) AS total_networth
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
GROUP BY 1
ORDER BY 2 DESC;
--6. Identify the five industries with the highest number of billionaires.
SELECT industry,
       COUNT (*) AS no_of_billionaires
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;
--7. Find countries with at least five billionaires.
SELECT country,
       COUNT(*) AS no_of_billionaires
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
GROUP BY country
HAVING COUNT(*) >= 5
ORDER BY 2 DESC;
--8. Calculate the total wealth of billionaires younger than 50.
SELECT SUM(networth_billion) AS total_networth
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
WHERE age < 50;
--9. Identify billionaires whose net worth exceeds the overall average net worth.
SELECT *
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
WHERE networth_billion > (SELECT AVG(networth_billion)
                          FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld);
--10.Identify the industry with the highest average net worth.
SELECT industry,
       AVG(networth_billion) AS average_networth
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
GROUP BY 1 
ORDER BY 2 DESC
LIMIT 1;
--41. Which industry contributes the most to the combined wealth of the top 200?
SELECT industry,
       SUM(networth_billion) AS total_industry_wealth
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
--Which country has the highest average billionaire net worth?
SELECT country,
       AVG(networth_billion) AS average_networth
FROM Top200RichestPersonintheWorldTop200RichestPersonintheWorld
GROUP BY 1 
ORDER BY 2 DESC
LIMIT 1;