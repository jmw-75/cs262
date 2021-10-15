--
-- This SQL script builds a monopoly database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Summer, 2015
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS NULL;
DROP TABLE IF EXISTS PlayerProperty;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Player;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY,
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE Property (
	ID integer PRIMARY KEY,
	name varchar(50) NOT NULL,
	color varchar(50) NOT NULL
);

CREATE TABLE PlayerGame (
	gameID integer REFERENCES Game(ID) NOT NULL,
	playerID integer REFERENCES Player(ID) NOT NULL,
  	boardlocation integer NOT NULL,
	cash money,
	score integer
	);

CREATE TABLE PlayerProperty(
	gameID integer REFERENCES Game(ID) NOT NULL,
	playerID integer REFERENCES Player(ID) NOT NULL,
	propertyID integer REFERENCES Property(ID) NOT NULL,
	houses integer,
	hotels integer
);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON PlayerProperty TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.edu', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.edu', 'Dogbreath');

-- Build all the properties
INSERT INTO Property VALUES (01 , 'Mediterranean Avenue', 'Dark Purple');
INSERT INTO Property VALUES (02 , 'Baltic Avenue', 'Dark Purple');
INSERT INTO Property VALUES (03 , 'Oriental Avenue', 'Light Blue');
INSERT INTO Property VALUES (04 , 'Vermont Avenue', 'Light Blue');
INSERT INTO Property VALUES (05 , 'Connecticut Avenue', 'Light Blue');
INSERT INTO Property VALUES (06 , 'St. Charles Place', 'Pink');
INSERT INTO Property VALUES (07 , 'States Avenue', 'Pink');
INSERT INTO Property VALUES (08 , 'Virginia Avenue', 'Pink');
INSERT INTO Property VALUES (09 , 'St. James Place', 'Orange');
INSERT INTO Property VALUES (10 , 'Tennessee Avenue', 'Orange');


--Initial game builds
INSERT INTO PlayerGame VALUES (1, 1, 0, 500, 750.00);
INSERT INTO PlayerGame VALUES (1, 2, 0, 500, 500.00);
INSERT INTO PlayerGame VALUES (1, 3, 0, 500, 2850.00);
INSERT INTO PlayerGame VALUES (2, 1, 0, 750, 1750.00);
INSERT INTO PlayerGame VALUES (2, 2, 0, 500, 500.00);
INSERT INTO PlayerGame VALUES (2, 3, 0, 500, 1000.00);
INSERT INTO PlayerGame VALUES (3, 2, 0, 500, 500.00);
INSERT INTO PlayerGame VALUES (3, 3, 0, 500, 6000.00);

--Player Property relationships
INSERT INTO PlayerProperty(gameID, playerID, propertyID, houses) VALUES (1, 2, 01, 3);
INSERT INTO PlayerProperty(gameID, playerID, propertyID, hotels) VALUES (1, 3, 02, 2);
INSERT INTO PlayerProperty(gameID, playerID, propertyID, houses) VALUES (1, 3, 03, 2);
INSERT INTO PlayerProperty(gameID, playerID, propertyID, hotels) VALUES (1, 1, 04, 1);
INSERT INTO PlayerProperty(gameID, playerID, propertyID, houses) VALUES (2, 1, 05, 2);
INSERT INTO PlayerProperty(gameID, playerID, propertyID, hotels) VALUES (2, 3, 06, 3);
INSERT INTO PlayerProperty(gameID, playerID, propertyID) VALUES (3, 2, 07);
INSERT INTO PlayerProperty(gameID, playerID, propertyID, houses, hotels) VALUES (3, 3, 08, 1, 1);
INSERT INTO PlayerProperty(gameID, playerID, propertyID, hotels) VALUES (3, 3, 09, 2);

--use some accessors to test the Insertions
SELECT COUNT(*) FROM Property; --should return 27
SELECT * FROM PlayerProperty; -- select all from player property
