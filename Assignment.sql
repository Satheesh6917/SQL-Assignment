CREATE DATABASE IMDB;
USE IMDB;
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_date DATE,
    description TEXT
);
CREATE TABLE Media (
    media_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    media_type ENUM('image', 'video') NOT NULL,
    url VARCHAR(255) NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);
CREATE TABLE Genres (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
CREATE TABLE Movie_Genres (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);
CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    user_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 10),
    comment TEXT,
    review_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Artists (
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);
CREATE TABLE Skills (
    skill_id INT AUTO_INCREMENT PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL
);
CREATE TABLE Artist_Skills (
    artist_id INT,
    skill_id INT,
    PRIMARY KEY (artist_id, skill_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (skill_id) REFERENCES Skills(skill_id)
);
CREATE TABLE Roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL
);
CREATE TABLE Movie_Roles (
    movie_id INT,
    artist_id INT,
    role_id INT,
    PRIMARY KEY (movie_id, artist_id, role_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);
INSERT INTO Users (username, email) VALUES
('john_doe', 'john@example.com'),
('jane_smith', 'jane@example.com');

-- Movies
INSERT INTO Movies (title, release_date, description) VALUES
('Inception', '2010-07-16', 'A mind-bending thriller by Christopher Nolan');

-- Media
INSERT INTO Media (movie_id, media_type, url) VALUES
(1, 'image', 'inception_image1.jpg'),
(1, 'video', 'inception_trailer.mp4');

-- Genres
INSERT INTO Genres (name) VALUES
('Sci-Fi'), ('Thriller');

-- Movie Genres
INSERT INTO Movie_Genres (movie_id, genre_id) VALUES
(1, 1), (1, 2);

-- Reviews
INSERT INTO Reviews (movie_id, user_id, rating, comment) VALUES
(1, 1, 9, 'Amazing concept!'),
(1, 2, 8, 'Loved the visuals.');
INSERT INTO Artists (name, bio) VALUES
('Leonardo DiCaprio', 'Famous actor known for Titanic, Inception, etc.'),
('Christopher Nolan', 'Director of many acclaimed films.');
INSERT INTO Skills (skill_name) VALUES
('Acting'), ('Directing');
INSERT INTO Artist_Skills (artist_id, skill_id) VALUES
(1, 1),
(2, 2);
INSERT INTO Roles (role_name) VALUES
('Actor'), ('Director');
INSERT INTO Movie_Roles (movie_id, artist_id, role_id) VALUES
(1, 1, 1),
(1, 2, 2);
