SELECT 
    u.id,
    u.username,
    GROUP_CONCAT(fm.movie_id) AS favorite_movie_ids
FROM 
    user u
LEFT JOIN 
    favorite_movie fm ON u.id = fm.user_id
GROUP BY 
    u.id, u.username;
