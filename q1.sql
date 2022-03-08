-- Homework 6

-- Create a database and name it homework5. 
CREATE DATABASE homework5;
USE homework5;

-- Use show columns to make sure that all the columns are correctly created. 
-- Use select * from each table to make sure that all the data is inserted correctly.
SHOW COLUMNS FROM Movies;	
SELECT * FROM Movies;

-- 1
-- List the name, rating and year of the movies from 2000 to 2022 
-- (including both 2000 and 2022) that lost money (where the gross is less than the budget). 
-- Sort the result by years in descending order. 
SELECT name, rating, year 
FROM Movies 
WHERE gross < budget AND year BETWEEEN '2000' AND '2022'
ORDER BY year DESC;


-- 2
-- List the number of movies each actor acted in from 2000 to 2022 
-- (including both 2000 and 2022) . Sort the result by actor’s names in the alphabetical order.
SELECT Actors.name, COUNT(ActsIn.aid) 
FROM ActsIn 
INNER JOIN Actors ON Actors.id = ActsIn.aid 
INNER JOIN Movies ON Movies.id = ActsIn.mid
WHERE Movies.year BETWEEN '2000' AND '2022'
GROUP BY Actors.name;
ORDER BY Actors.name;


-- 3
-- List the number of movies, the highest rating and 
-- the lowest rating of the movies that the actor “Mahershala Ali” has appeared in.
SELECT COUNT(*), MAX(rating), MIN(rating) 
FROM Movies 
INNER JOIN ActsIn ON Movies.id = ActsIn.mid 
WHERE aid  = 3
ORDER BY rating;


-- 4
-- List the number of actors that acted in the movie “Avengers: Infinity War”
SELECT COUNT(*) 
FROM ActsIn 
WHERE mid = 5;


-- 5 
-- List the name of the actors who acted in more than 1 movie between 2015 and 2022 
-- (including both 2015 and 2022).
SELECT Actors.name
FROM Actors 
INNER JOIN Actsin ON Actors.id = Actsin.aid
INNER JOIN Movies ON Actsin.mid = Movies.id
WHERE Movies.year BETWEEN '2015' AND '2022'
GROUP BY Actors.name
HAVING COUNT(*) >1;


-- 6
-- List the name, rating and year of the movies where “Emilia Clarke” or “Kit Harington” did not act in.
SELECT Movies.name, Movies.rating, Movies.year 
FROM Movies 
INNER JOIN ActsIn ON Movies.id = ActsIn.mid 
WHERE NOT (ActsIn.aid = 1 or ActsIn.aid = 2);


-- 7
-- List the name of the actors with the most number of movies in 2018. Sort the result in alphabetical order.
SELECT Actors.name, COUNT(ActsIn.aid)
FROM Actors 
INNER JOIN ActsIn ON Actors.id = ActsIn.aid
INNER JOIN Movies ON Actsin.mid = Movies.id
WHERE Movies.year = 2018
GROUP BY Actors.name
HAVING COUNT(*) = 2; -- FIXME (need a way to make it show actors with the maximum number of movies, w/out saying "2")


-- 8
-- List the the name and age of the youngest actor who has appeared in a movie 
-- that grossed over $1000000000.
SELECT Actors.name, Actors.age 
FROM Actors 
INNER JOIN ActsIn ON Actors.id = ActsIn.aid 
INNER JOIN Movies ON Movies.id = ActsIn.mid 
WHERE Movies.gross > 1000000000 
ORDER BY Age ASC LIMIT 1;



-- Newer versions
-- 3
SELECT COUNT(Movies.name), MAX(Movies.rating), MIN(Movies.rating)
FROM Movies, Actors, ActsIn 
WHERE Movies.id = ActsIn.mid 
AND Actors.id = ActsIn.aid 
AND Actors.name = 'Mahershala Ali';

-- 4
SELECT COUNT(Actors.name)
FROM Actors, Movies, ActsIn
WHERE Movies.id = ActsIn.mid 
AND Actors.id = ActsIn.aid 
AND Movies.name = 'Avengers: Infinity War'; 

-- 5
SELECT Actors.name
FROM Actors, Movies, ActsIn
WHERE Actors.id = ActsIn.aid
AND Movies.id = ActsIn.mid
AND Movies.year BETWEEN '2015' AND '2022'
GROUP BY Actors.name
HAVING COUNT(Movies.name) > 1;

-- 6
SELECT DISTINCT Movies.name, Movies.rating, Movies.year
FROM Movies, Actors, ActsIn
WHERE Movies.id = ActsIn.mid
AND Actors.id = ActsIn.aid
AND NOT (Actors.name = 'Emilia Clarke' OR Actors.name = 'Kit Harington');

-- 7
SELECT Actors.name
FROM Movies, Actors, ActsIn
WHERE Movies.id = ActsIn.mid
AND Actors.id = ActsIn.aid
GROUP BY Actors.name
HAVING COUNT(Movies.name) = 3;

SELECT Actors.name 
FROM Actors 
WHERE Actors.id IN 
	(SELECT COUNT(Movies.name)
	FROM Movies, Actors, ActsIn
	WHERE Movies.id = ActsIn.mid
	AND Actors.id = ActsIn.aid
	AND Movies.year = '2018'
	GROUP BY Actors.name);

SELECT Actors.name, Movies.name
FROM 


-- 8
SELECT Actors.name, Actors.age 
FROM Actors 
WHERE Actors.age IN 
	(SELECT MIN(Actors.age)
	FROM Actors, Movies, ActsIn
	WHERE Actors.id = ActsIn.aid
	AND Movies.id = ActsIn.mid
	AND Movies.gross > 1000000000);






