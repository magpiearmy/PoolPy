CREATE SCHEMA IF NOT EXISTS pool;

-- -----------------------------------------------------
-- Table league
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS league (
  league_id SERIAL NOT NULL,
  name VARCHAR(45) NULL,
  PRIMARY KEY (league_id));


-- -----------------------------------------------------
-- Table division
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS division (
  division_id SERIAL NOT NULL,
  name VARCHAR(45) NULL,
  league_id INT NOT NULL,
  PRIMARY KEY (division_id),
  CONSTRAINT fk_division_league1
    FOREIGN KEY (league_id)
    REFERENCES league (league_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table team
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS team (
  team_id SERIAL NOT NULL,
  name VARCHAR(45) NOT NULL,
  pub_name VARCHAR(45) NOT NULL,
  division_id INT NOT NULL,
  PRIMARY KEY (team_id),
  CONSTRAINT fk_team_division1
    FOREIGN KEY (division_id)
    REFERENCES division (division_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table player
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS player (
  player_id SERIAL NOT NULL,
  first_name VARCHAR(45) NOT NULL,
  last_name VARCHAR(45) NOT NULL,
  team_id INT NOT NULL,
  PRIMARY KEY (player_id),
  CONSTRAINT fk_player_team
    FOREIGN KEY (team_id)
    REFERENCES team (team_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table match
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS match (
  match_id SERIAL NOT NULL,
  home_score INT NULL,
  away_score INT NULL,
  date TIMESTAMP NULL,
  home_team_id INT NOT NULL,
  away_team_id INT NOT NULL,
  PRIMARY KEY (match_id),
  CONSTRAINT fk_match_team1
    FOREIGN KEY (home_team_id)
    REFERENCES team (team_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_match_team2
    FOREIGN KEY (away_team_id)
    REFERENCES team (team_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table singles_game
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS singles_game (
  singles_game_id SERIAL NOT NULL,
  match_id INT NOT NULL,
  home_score INT NOT NULL,
  away_score INT NOT NULL,
  home_seven_balls INT NOT NULL,
  away_seven_balls INT NOT NULL,
  home_player_id INT NOT NULL,
  away_player_id INT NOT NULL,
  PRIMARY KEY (singles_game_id),
  CONSTRAINT fk_singles_game_match1
    FOREIGN KEY (match_id)
    REFERENCES match (match_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_singles_game_player1
    FOREIGN KEY (home_player_id)
    REFERENCES player (player_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_singles_game_player2
    FOREIGN KEY (away_player_id)
    REFERENCES player (player_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table doubles_game
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS doubles_game (
  doubles_game_id SERIAL NOT NULL,
  match_id INT NOT NULL,
  home_score INT NOT NULL,
  away_score INT NOT NULL,
  home_seven_balls INT NOT NULL,
  away_seven_balls INT NOT NULL,
  home_player_a_id INT NOT NULL,
  home_player_b_id INT NOT NULL,
  away_player_a_id INT NOT NULL,
  away_player_b_id INT NOT NULL,
  PRIMARY KEY (doubles_game_id),
  CONSTRAINT fk_singles_game_match10
    FOREIGN KEY (match_id)
    REFERENCES match (match_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_doubles_game_player1
    FOREIGN KEY (home_player_a_id)
    REFERENCES player (player_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_doubles_game_player2
    FOREIGN KEY (home_player_b_id)
    REFERENCES player (player_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_doubles_game_player3
    FOREIGN KEY (away_player_a_id)
    REFERENCES player (player_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_doubles_game_player4
    FOREIGN KEY (away_player_b_id)
    REFERENCES player (player_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

