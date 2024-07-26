SELECT 
    m.id,
    m.title,
    COUNT(mc.person_id) AS actors_count
FROM 
    movie m
JOIN 
    movie_characters mc ON m.id = mc.movie_id
WHERE 
    m.release_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
GROUP BY 
    m.id, m.title;
