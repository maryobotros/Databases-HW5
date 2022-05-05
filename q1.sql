-- Create a database and name it homework5. 
CREATE DATABASE homework5;
USE homework5;

-- Use show columns to make sure that all the columns are correctly created. 
-- Use select * from each table to make sure that all the data is inserted correctly.
SHOW COLUMNS FROM Movies;	
SELECT * FROM Movies;


-- 1
SELECT name, rating, year 
FROM Movies 
WHERE gross < budget 
AND year BETWEEEN ‘2000’ AND ‘2022’
ORDER BY year DESC;


-- 2
SELECT Actors.name, COUNT(ActsIn.aid) 
FROM ActsIn 
INNER JOIN Actors ON Actors.id = ActsIn.aid 
INNER JOIN Movies ON Movies.id = ActsIn.mid
WHERE Movies.year BETWEEN '2000' AND '2022'
GROUP BY Actors.name;
ORDER BY Actors.name;

SELECT Actors.name, COUNT(ActsIn.mid)
FROM Actors, ActsIn, Movies
WHERE Actors.id = ActsIn.aid
AND Movies.id = ActsIn.mid
AND Movies.year BETWEEN '2000' AND '2022'
GROUP BY Actors.name
ORDER BY Actors.name;


-- 3
SELECT COUNT(*), MAX(rating), MIN(rating) 
FROM Movies 
INNER JOIN ActsIn ON Movies.id = ActsIn.mid 
WHERE aid  = 3
ORDER BY rating;

SELECT COUNT(ActsIn.mid) AS Number_of_movies, MAX(Movies.rating) AS Max_rating, MIN(Movies.rating) AS Min_rating
FROM Actors, ActsIn, Movies
WHERE Actors.id = ActsIn.aid
AND Movies.id = ActsIn.mid
AND Actors.name = 'Mahershala Ali';


-- 4
SELECT COUNT(*) 
FROM ActsIn 
WHERE mid = 5;

SELECT COUNT(aid) AS Number_of_actors_in_Infinity_War
FROM Actors, ActsIn, Movies
WHERE Actors.id = ActsIn.aid
AND Movies.id = ActsIn.mid
AND Movies.name = 'Avengers: Infinity War';


-- 5 
SELECT Actors.name
FROM Actors 
INNER JOIN Actsin ON Actors.id = Actsin.aid
INNER JOIN Movies ON Actsin.mid = Movies.id
WHERE Movies.year BETWEEN '2015' AND '2022'
GROUP BY Actors.name
HAVING COUNT(*) >1;

SELECT name 
FROM
	(SELECT Actors.name AS name, COUNT(mid) AS movie_count
	FROM Actors, ActsIn, Movies
	WHERE Actors.id = ActsIn.aid
	AND Movies.id = ActsIn.mid
	AND Movies.year BETWEEN '2015' AND '2022'
	GROUP BY Actors.name) AS Temp
WHERE movie_count > 1


-- 6
SELECT Movies.name, Movies.rating, Movies.year 
FROM Movies 
INNER JOIN ActsIn ON Movies.id = ActsIn.mid 
WHERE NOT (ActsIn.aid = 1 or ActsIn.aid = 2);

SELECT Movies.name, Movies.rating, Movies.year 
FROM Movies, Actors, ActsIn
WHERE Actors.id = ActsIn.aid
AND Movies.id = ActsIn.mid
AND NOT (Actors.name = 'Kit Harrington' OR Actors.name = 'Emilia Clark');


-- 7
SELECT Actors.name, COUNT(ActsIn.aid)
FROM Actors 
INNER JOIN ActsIn ON Actors.id = ActsIn.aid
INNER JOIN Movies ON Actsin.mid = Movies.id
WHERE Movies.year = 2018
GROUP BY Actors.name
HAVING COUNT(*) = 2; -- FIXME (need a way to make it show actors with the maximum number of movies, w/out saying "2")


-- 8
SELECT Actors.name, Actors.age 
FROM Actors 
INNER JOIN ActsIn ON Actors.id = ActsIn.aid 
INNER JOIN Movies ON Movies.id = ActsIn.mid 
WHERE Movies.gross > 1000000000 
ORDER BY Age ASC LIMIT 1;




