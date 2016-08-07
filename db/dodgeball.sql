DROP TABLE Matches;
DROP TABLE Teams;

CREATE TABLE Teams (
  id serial4 primary key,
  name VARCHAR(255),
  team_id int4
);

CREATE TABLE Matches (
  id serial4 primary key,
  home_team_id Int4, -- references Teams(id),
  away_team_id Int4, -- references Teams(id),
  home_team_score int4,
  away_team_score int4
);


-- matchDate VARCHAR(255)