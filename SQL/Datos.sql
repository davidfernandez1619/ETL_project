-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Movies
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Movies
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Movies` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Movies` ;

-- -----------------------------------------------------
-- Table `Movies`.`Films`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`Films` (
  `idFilms` INT NOT NULL AUTO_INCREMENT,
  `Film year` INT NOT NULL,
  `Film title` VARCHAR(100) NOT NULL,
  `Film duration` INT NOT NULL,
  PRIMARY KEY (`idFilms`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`Categories` (
  `idCategories` INT NOT NULL AUTO_INCREMENT,
  `Winning category` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idCategories`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`Winners`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`Winners` (
  `idWinners` INT NOT NULL AUTO_INCREMENT,
  `Ceremony year` INT NOT NULL,
  `Ceremony number` INT NOT NULL,
  `Winner name` VARCHAR(100) NOT NULL,
  `Film score` FLOAT NOT NULL,
  PRIMARY KEY (`idWinners`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`Films_has_Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`Films_has_Categories` (
  `Films_idFilms` INT NOT NULL,
  `Categories_idCategories` INT NOT NULL,
  PRIMARY KEY (`Films_idFilms`, `Categories_idCategories`),
  INDEX `fk_Films_has_Categories_Categories1_idx` (`Categories_idCategories` ASC) VISIBLE,
  INDEX `fk_Films_has_Categories_Films_idx` (`Films_idFilms` ASC) VISIBLE,
  CONSTRAINT `fk_Films_has_Categories_Films`
    FOREIGN KEY (`Films_idFilms`)
    REFERENCES `Movies`.`Films` (`idFilms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Films_has_Categories_Categories1`
    FOREIGN KEY (`Categories_idCategories`)
    REFERENCES `Movies`.`Categories` (`idCategories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`Films_has_Winners`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`Films_has_Winners` (
  `Films_idFilms` INT NOT NULL,
  `Winners_idWinners` INT NOT NULL,
  PRIMARY KEY (`Films_idFilms`, `Winners_idWinners`),
  INDEX `fk_Films_has_Winners_Winners1_idx` (`Winners_idWinners` ASC) VISIBLE,
  INDEX `fk_Films_has_Winners_Films1_idx` (`Films_idFilms` ASC) VISIBLE,
  CONSTRAINT `fk_Films_has_Winners_Films1`
    FOREIGN KEY (`Films_idFilms`)
    REFERENCES `Movies`.`Films` (`idFilms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Films_has_Winners_Winners1`
    FOREIGN KEY (`Winners_idWinners`)
    REFERENCES `Movies`.`Winners` (`idWinners`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Movies`.`Winners_has_Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Movies`.`Winners_has_Categories` (
  `Winners_idWinners` INT NOT NULL,
  `Categories_idCategories` INT NOT NULL,
  PRIMARY KEY (`Winners_idWinners`, `Categories_idCategories`),
  INDEX `fk_Winners_has_Categories_Categories1_idx` (`Categories_idCategories` ASC) VISIBLE,
  INDEX `fk_Winners_has_Categories_Winners1_idx` (`Winners_idWinners` ASC) VISIBLE,
  CONSTRAINT `fk_Winners_has_Categories_Winners1`
    FOREIGN KEY (`Winners_idWinners`)
    REFERENCES `Movies`.`Winners` (`idWinners`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Winners_has_Categories_Categories1`
    FOREIGN KEY (`Categories_idCategories`)
    REFERENCES `Movies`.`Categories` (`idCategories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SELECT * FROM Categories