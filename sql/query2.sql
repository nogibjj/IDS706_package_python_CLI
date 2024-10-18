-- sql/query2.sql

SELECT
    p.native_country,
    COUNT(*) AS total_people,
    SUM(CASE WHEN i.income = '>50K' THEN 1 ELSE 0 END) AS high_income_people,
    ROUND(SUM(CASE WHEN i.income = '>50K' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS high_income_percentage
FROM
    personal_info p
JOIN
    income_info i ON p.id = i.id
GROUP BY
    p.native_country
HAVING
    COUNT(*) > 50
ORDER BY
    high_income_percentage DESC;
