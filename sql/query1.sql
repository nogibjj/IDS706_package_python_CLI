-- sql/query1.sql

SELECT
    p.sex,
    e.education,
    AVG(p.age) AS average_age,
    AVG(e.hours_per_week) AS average_hours_per_week,
    COUNT(*) AS count
FROM
    personal_info p
JOIN
    employment_info e ON p.id = e.id
GROUP BY
    p.sex, e.education
HAVING
    COUNT(*) > 50
ORDER BY
    average_hours_per_week DESC;
