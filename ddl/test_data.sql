-- This Inserts add test data to db, to validate queries

INSERT INTO file (file_name, mime_type, `key`, url) VALUES
('avatar1.png', 'image/png', 'avatars/avatar1.png', 'https://example.com/avatars/avatar1.png'),
('poster1.jpg', 'image/jpeg', 'posters/poster1.jpg', 'https://example.com/posters/poster1.jpg'),
('poster2.jpg', 'image/jpeg', 'posters/poster2.jpg', 'https://example.com/posters/poster2.jpg');


INSERT INTO countries (name) VALUES
('USA'),
('Canada'),
('France');


INSERT INTO user (username, first_name, last_name, email, password, avatar_id) VALUES
('john_doe', 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', 1),
('jane_smith', 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', NULL);


INSERT INTO persons (first_name, last_name, biography, birth_date, gender, country_id, primary_photo_id) VALUES
('Steven', 'Spielberg', 'American filmmaker and director.', '1946-12-18', 'male', 1, NULL),
('Christopher', 'Nolan', 'British-American filmmaker and director.', '1970-07-30', 'male', 2, NULL),
('Quentin', 'Tarantino', 'American filmmaker.', '1963-03-27', 'male', 1, NULL),

('Sam', 'Neill', 'Actor known for Jurassic Park.', '1947-09-14', 'male', 1, NULL),
('Leonardo', 'DiCaprio', 'Actor known for Inception.', '1974-11-11', 'male', 1, NULL),
('Brad', 'Pitt', 'Actor known for Once Upon a Time in Hollywood.', '1963-12-18', 'male', 1, NULL),
('Robert', 'Downey Jr.', 'Actor known for Iron Man.', '1965-04-04', 'male', 1, NULL),
('Chris', 'Evans', 'Actor known for Captain America.', '1981-06-13', 'male', 1, NULL);


INSERT INTO movie (title, description, budget, release_date, duration, director_id, country_id, poster_id) VALUES
('Jurassic Park', 'A theme park with cloned dinosaurs goes haywire.', 63000000.00, '1993-06-11', 127, 1, 1, 2),
('Inception', 'A thief who enters the dreams of others.', 160000000.00, '2010-07-16', 148, 2, 2, NULL),
('Once Upon a Time in Hollywood', 'A faded television actor and his stunt double.', 90000000.00, '2019-07-26', 161, 3, 1, 3),
('Avengers: Endgame', 'The Avengers assemble to undo the damage caused by Thanos.', 356000000.00, '2023-04-26', 181, 1, 1, 2);


INSERT INTO genres (name) VALUES
('Action'),
('Adventure'),
('Sci-Fi'),
('Drama'),
('Comedy');


INSERT INTO movie_genres (movie_id, genre_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 1),
(3, 4),
(3, 5),
(4, 1),
(4, 4);


INSERT INTO characters (name, description, role) VALUES
('Dr. Alan Grant', 'A renowned paleontologist.', 'leading'),
('Dom Cobb', 'A professional thief.', 'leading'),
('Rick Dalton', 'A faded television actor.', 'leading'),
('Cliff Booth', 'A stunt double.', 'supporting'),
('Tony Stark', 'Iron Man', 'leading'),
('Steve Rogers', 'Captain America', 'leading');


INSERT INTO movie_characters (movie_id, character_id, person_id) VALUES
(1, 1, 4), 
(2, 2, 5),
(3, 3, 5),
(3, 4, 6),
(4, 5, 7),
(4, 6, 8);


INSERT INTO favorite_movie (user_id, movie_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(2, 4);
