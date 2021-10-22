
-- SINGLE TABLE
-- a. Retrieve a list of all the games, ordered by date with the most recent game coming first.
SELECT *
FROM Game
ORDER BY time ASC
;

-- b. Retrieve all the games that occurred in the past week.
SELECT *
FROM Game
WHERE time >= '2006-06-22 00:00:00'
;

-- c. Retrieve a list of players who have (non-NULL) names.
SELECT name 
FROM Player
WHERE name IS NOT NULL
;

-- d. Retrieve a list of IDs for players who have some game score larger than 2000.
SELECT playerID, score 
FROM PlayerGame
WHERE score > 2000
;

-- e. Retrieve a list of players who have GMail accounts.
SELECT *
FROM Player
WHERE emailAddress LIKE '%@gmail.edu%'
;

-- MULTIPLE TABLES

-- a. Retrieve all “The King”’s game scores in decreasing order.
SELECT score
FROM Player, PlayerGame
WHERE Player.ID = PlayerGame.playerID
  AND Player.name = 'The King'
;

-- b. Retrieve the name of the winner of the game played on 2006-06-28 13:20:00.
SELECT name
FROM Player, PlayerGame, Game
WHERE PlayerGame.playerID = Player.ID
  AND Game.ID = PlayerGame.gameID 
  AND time = '2006-06-28 13:20:00'
  ORDER BY score DESC
  LIMIT 1;

-- c. So what does that P1.ID < P2.ID clause do in the last example query?
--        The above clause returns an entry if its ID is less than another entrie with the same name

-- d. The query that joined the Player table to itself seems rather contrived. Can you think of a realistic 
--          situation in which you’d want to join a table to itself?
--        A time where joining a table to itself could be useful could be when creating a heirarchy of employees
--        in a company from CEO all the way down to the lowest level employees. 