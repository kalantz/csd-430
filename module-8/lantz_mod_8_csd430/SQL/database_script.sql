-- Kypton Lantz
-- September 4, 2025
-- CSD430-O307 Server Side Development (2261-DD)
-- Module 5 % 6 Assignment: Working with CRUD


-- Create database
CREATE DATABASE IF NOT EXISTS CSD430;

-- Use database
USE CSD430;

-- Create user
CREATE USER IF NOT EXISTS 'student1'@'localhost' IDENTIFIED BY 'pass';

-- Grant privileges
GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost';
FLUSH PRIVILEGES;

-- Create table of Horror movies with at least 5 fields
CREATE TABLE kypton_movies_data (
		movie_id INT auto_increment primary KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT NOT NULL,
    director VARCHAR(100),
    runtime_minutes INT,
    rating VARCHAR(10)
);

-- Add at least 10 records
INSERT INTO kypton_movies_data (title, release_year, director, runtime_minutes, rating)
VALUES
	('Psycho', 1960, 'Alfred Hitchcock', 109, 'R'),
	('The Shining', 1980, 'Stanley Kubrick', 146, 'R'),
	('Halloween', 1978, 'John Carpenter', 91, 'R'),
	('A Nightmare on Elm Street', 1984, 'Wes Craven', 91, 'R'),
	('Hereditary', 2018, 'Ari Aster', 127, 'R'),
	('The Exorcist', 1973, 'William Friedkin', 122, 'R'),
	('Get Out', 2017, 'Jordan Peele', 104, 'R'),
	('Scream', 1996, 'Wes Craven', 111, 'R'),
	('It Follows', 2014, 'David Robert Mitchell', 100, 'R'),
	('The Witch', 2015, 'Robert Eggers', 92, 'R');
    
-- Verify with SELECT
SELECT * FROM kypton_movies_data;