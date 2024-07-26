SELECT 
    m.id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    JSON_OBJECT('id', f.id, 'file_name', f.file_name, 'url', f.url) AS poster,
    JSON_OBJECT('id', p.id, 'first_name', p.first_name, 'last_name', p.last_name, 'photo', 
    (SELECT JSON_OBJECT('id', pf.id, 'file_name', pf.file_name, 'url', pf.url) 
     FROM file pf 
     WHERE pf.id = p.primary_photo_id)) AS director,
    (SELECT JSON_ARRAYAGG(JSON_OBJECT('id', pe.id, 'first_name', pe.first_name, 'last_name', pe.last_name, 'photo', 
    (SELECT JSON_OBJECT('id', pf.id, 'file_name', pf.file_name, 'url', pf.url) 
     FROM file pf 
     WHERE pf.id = pe.primary_photo_id))) 
     FROM persons pe 
     JOIN movie_characters mc ON pe.id = mc.person_id 
     WHERE mc.movie_id = m.id) AS actors,
    (SELECT JSON_ARRAYAGG(JSON_OBJECT('id', g.id, 'name', g.name)) 
     FROM genres g 
     JOIN movie_genres mg ON g.id = mg.genre_id 
     WHERE mg.movie_id = m.id) AS genres
FROM 
    movie m
LEFT JOIN 
    file f ON m.poster_id = f.id
LEFT JOIN 
    persons p ON m.director_id = p.id
WHERE 
    m.id = 1;
