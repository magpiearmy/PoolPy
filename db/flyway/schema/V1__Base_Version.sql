-- MySQL Script generated by MySQL Workbench
-- Fri Jun 19 21:07:30 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pool
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pool
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pool` DEFAULT CHARACTER SET utf8 ;
USE `pool` ;

-- -----------------------------------------------------
-- Table `pool`.`league`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pool`.`league` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pool`.`division`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pool`.`division` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `league_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_division_league1_idx` (`league_id` ASC) VISIBLE,
  CONSTRAINT `fk_division_league1`
    FOREIGN KEY (`league_id`)
    REFERENCES `pool`.`league` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pool`.`team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pool`.`team` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `pub_name` VARCHAR(45) NOT NULL,
  `division_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_team_division1_idx` (`division_id` ASC) VISIBLE,
  CONSTRAINT `fk_team_division1`
    FOREIGN KEY (`division_id`)
    REFERENCES `pool`.`division` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pool`.`player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pool`.`player` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `team_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_player_team_idx` (`team_id` ASC) VISIBLE,
  CONSTRAINT `fk_player_team`
    FOREIGN KEY (`team_id`)
    REFERENCES `pool`.`team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pool`.`match`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pool`.`match` (
  `id` INT NOT NULL,
  `home_score` INT NULL,
  `away_score` INT NULL,
  `date` DATETIME NULL,
  `home_team_id` INT NOT NULL,
  `away_team_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_match_team1_idx` (`home_team_id` ASC) VISIBLE,
  INDEX `fk_match_team2_idx` (`away_team_id` ASC) VISIBLE,
  CONSTRAINT `fk_match_team1`
    FOREIGN KEY (`home_team_id`)
    REFERENCES `pool`.`team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_match_team2`
    FOREIGN KEY (`away_team_id`)
    REFERENCES `pool`.`team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pool`.`singles_game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pool`.`singles_game` (
  `id` INT NOT NULL,
  `match_id` INT NOT NULL,
  `home_score` INT NOT NULL,
  `away_score` INT NOT NULL,
  `home_seven_balls` INT NOT NULL,
  `away_seven_balls` INT NOT NULL,
  `home_player_id` INT NOT NULL,
  `away_player_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_singles_game_match1_idx` (`match_id` ASC) VISIBLE,
  INDEX `fk_singles_game_player1_idx` (`home_player_id` ASC) VISIBLE,
  INDEX `fk_singles_game_player2_idx` (`away_player_id` ASC) VISIBLE,
  CONSTRAINT `fk_singles_game_match1`
    FOREIGN KEY (`match_id`)
    REFERENCES `pool`.`match` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_singles_game_player1`
    FOREIGN KEY (`home_player_id`)
    REFERENCES `pool`.`player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_singles_game_player2`
    FOREIGN KEY (`away_player_id`)
    REFERENCES `pool`.`player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pool`.`doubles_game`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pool`.`doubles_game` (
  `id` INT NOT NULL,
  `match_id` INT NOT NULL,
  `home_score` INT NOT NULL,
  `away_score` INT NOT NULL,
  `home_seven_balls` INT NOT NULL,
  `away_seven_balls` INT NOT NULL,
  `home_player_a_id` INT NOT NULL,
  `home_player_b_id` INT NOT NULL,
  `away_player_a_id` INT NOT NULL,
  `away_player_b_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_singles_game_match1_idx` (`match_id` ASC) VISIBLE,
  INDEX `fk_doubles_game_player1_idx` (`home_player_a_id` ASC) VISIBLE,
  INDEX `fk_doubles_game_player2_idx` (`home_player_b_id` ASC) VISIBLE,
  INDEX `fk_doubles_game_player3_idx` (`away_player_a_id` ASC) VISIBLE,
  INDEX `fk_doubles_game_player4_idx` (`away_player_b_id` ASC) VISIBLE,
  CONSTRAINT `fk_singles_game_match10`
    FOREIGN KEY (`match_id`)
    REFERENCES `pool`.`match` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doubles_game_player1`
    FOREIGN KEY (`home_player_a_id`)
    REFERENCES `pool`.`player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doubles_game_player2`
    FOREIGN KEY (`home_player_b_id`)
    REFERENCES `pool`.`player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doubles_game_player3`
    FOREIGN KEY (`away_player_a_id`)
    REFERENCES `pool`.`player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_doubles_game_player4`
    FOREIGN KEY (`away_player_b_id`)
    REFERENCES `pool`.`player` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;