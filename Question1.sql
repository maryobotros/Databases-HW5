CREATE TABLE Movies(
	id int not null,
	name varchar(100),
	budget bigint,
	gross bigint,
	rating decimal(10, 2),
	year int,
	primary key(id));

CREATE TABLE Actors(
	id int not null,
	name varchar(50),
	age int,
	gender enum("f", "m"),
	primary key (id));

CREATE TABLE ActsIn(
	mid int not null,
	aid int not null,
	foreign key (mid) references Movies(id),
	foreign key (aid) references Actors(id));

INSERT INTO Movies(id, name, budget, gross, rating, year) VALUES(1,'Green Book',23000000,81343031,8.3,2018);
INSERT INTO Movies(id, name, budget, gross, rating, year) VALUES(2,'Alita: Battle Angel',170000000,79921539,7.6,2019);
INSERT INTO Movies(id, name, budget, gross, rating, year) VALUES(3,'Spider-Man: Into the Spider-Verse',90000000,189165053,8.6,2018);
INSERT INTO Movies(id, name, budget, gross, rating, year) VALUES(4,'Aquaman',160000000,334135256,7.2,2018);
INSERT INTO Movies(id, name, budget, gross, rating, year) VALUES(5,'Avengers: Infinity War',321000000,2048359754,8.5,2018);
INSERT INTO Movies(id, name, budget, gross, rating, year) VALUES(6,'Solo: A Star Wars Story',300000000,213767512,7.0,2018);
INSERT INTO Movies(id, name, budget, gross, rating, year) VALUES(7,'Pompeii',80000000,23219748,5.5,2014);
INSERT INTO Movies(id, name, budget, gross, rating, year) VALUES(8,'Zombieland',23600000,75590286,7.6,2009);
INSERT INTO Movies(id, name, budget, gross, rating, year) VALUES(9,'The Amazing Spider-Man',230000000,262030663,7.0,2012);
INSERT INTO Movies(id, name, budget, gross, rating, year) VALUES(10,'Creed II',50000000,214100000,7.3,2018);
INSERT INTO Movies(id, name, budget, gross, rating, year) VALUES(11,'Spider Man: No Way Home', 200000000, 1831741000, 8.7, 2021);
INSERT INTO Movies(id, name, budget, gross, rating, year) VALUES(12,'Moonfall', 140000000, 29551865, 5.3, 2022);
INSERT INTO Movies(id, name, budget, gross, rating, year) VALUES(13, 'Black Panther', 200000000, 1300000000, 7.3, 2018);

INSERT INTO Actors(id, name, age, gender) VALUES(1,'Emilia Clarke',35,'f');
INSERT INTO Actors(id, name, age, gender) VALUES(2,'Kit Harington',35,'m');
INSERT INTO Actors(id, name, age, gender) VALUES(3,'Mahershala Ali',47,'m');
INSERT INTO Actors(id, name, age, gender) VALUES(4,'Jason Momoa',42,'m');
INSERT INTO Actors(id, name, age, gender) VALUES(5,'Amber Heard',35,'f');
INSERT INTO Actors(id, name, age, gender) VALUES(6,'Emma Stone',33,'f');
INSERT INTO Actors(id, name, age, gender) VALUES(7,'Halle Berry', 55,'f');
INSERT INTO Actors(id, name, age, gender) VALUES(8,'Patrick Wilson',48,'m');
INSERT INTO Actors(id, name, age, gender) VALUES(9,'Benedict Cumberbatch',45,'m');
INSERT INTO Actors(id, name, age, gender) VALUES(10,'Andrew Garfield',38,'m');
INSERT INTO Actors(id, name, age, gender) VALUES(11, 'Sebastian Stan', 39,'m');
INSERT INTO Actors(id, name, age, gender) VALUES(12, 'Tom Holland', 25,'m');
INSERT INTO Actors(id, name, age, gender) VALUES(13, 'Michael B. Jordan', 35,'m');



INSERT INTO ActsIn(mid, aid) VALUES(6,1);
INSERT INTO ActsIn(mid, aid) VALUES(7,2);
INSERT INTO ActsIn(mid, aid) VALUES(1,3);
INSERT INTO ActsIn(mid, aid) VALUES(2,3);
INSERT INTO ActsIn(mid, aid) VALUES(3,3);
INSERT INTO ActsIn(mid, aid) VALUES(4,4);
INSERT INTO ActsIn(mid, aid) VALUES(4,5);
INSERT INTO ActsIn(mid, aid) VALUES(8,5);
INSERT INTO ActsIn(mid, aid) VALUES(8,6);
INSERT INTO ActsIn(mid, aid) VALUES(9,6);
INSERT INTO ActsIn(mid, aid) VALUES(9,10);
INSERT INTO ActsIn(mid, aid) VALUES(11,10);
INSERT INTO ActsIn(mid, aid) VALUES(12,7);
INSERT INTO ActsIn(mid, aid) VALUES(12,8);
INSERT INTO ActsIn(mid, aid) VALUES(4,8);
INSERT INTO ActsIn(mid, aid) VALUES(5,9);
INSERT INTO ActsIn(mid, aid) VALUES(11,9);
INSERT INTO ActsIn(mid, aid) VALUES(5,11);
INSERT INTO ActsIn(mid, aid) VALUES(5,12);
INSERT INTO ActsIn(mid, aid) VALUES(11,12);
INSERT INTO ActsIn(mid, aid) VALUES(10,13);
INSERT INTO ActsIn(mid, aid) VALUES(13,11);
INSERT INTO ActsIn(mid, aid) VALUES(13,13);