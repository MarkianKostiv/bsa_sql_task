SELECT 
    p.id,
    p.first_name,
    p.last_name,
    SUM(m.budget) AS total_movies_budget
FROM 
    persons p
JOIN 
    movie_characters mc ON p.id = mc.person_id
JOIN 
    movie m ON mc.movie_id = m.id
GROUP BY 
    p.id, p.first_name, p.last_name;
