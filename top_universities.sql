SELECT institution, AVG(score) AS avg_score
FROM university_rankings
GROUP BY institution
ORDER BY avg_score DESC
LIMIT 10;
