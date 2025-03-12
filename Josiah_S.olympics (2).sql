-- COMP 290 Project 1 Part 1
-- Authors: Josiah Scott
-- Topic: B (Olympics)
-- sources: https://www.w3schools.com/sql/sql_autoincrement.asp
--          https://www.w3schools.in/dbms/database-normalization#third-normal-form
-- Date: 3/26/24

-- Create a new database named OlympicGames if it doesn't exist
CREATE DATABASE IF NOT EXISTS OlympicGames;

-- Use the OlympicGames database
USE OlympicGames;

-- Table for storing information about Year
CREATE TABLE IF NOT EXISTS Year (
    YearTag INT PRIMARY KEY 
);

-- Table for storing information about Game
CREATE TABLE IF NOT EXISTS Game (
    SeasonTag VARCHAR(50) PRIMARY KEY,
    CountryTag VARCHAR(50),
    YearTag INT,
    FOREIGN KEY (CountryTag) REFERENCES Country(CountryTag),
    FOREIGN KEY (YearTag) REFERENCES Year(YearTag)
);

-- Table for storing information about city
CREATE TABLE IF NOT EXISTS City (
    CityTag VARCHAR(50) PRIMARY KEY
);

-- Table for storing information about sport
CREATE TABLE IF NOT EXISTS Sport (
    SportTag VARCHAR(50) PRIMARY KEY,
    GenderTag VARCHAR(50)
);

-- Table for storing information about specific discipline
CREATE TABLE IF NOT EXISTS Discipline (
    DisciplineTag VARCHAR(50) PRIMARY KEY
);

-- Table for storing information about country
CREATE TABLE IF NOT EXISTS Country (
    CountryTag VARCHAR(50) PRIMARY KEY
);

-- Table for storing information about athlete
CREATE TABLE IF NOT EXISTS Athlete (
    AthleteTag VARCHAR(100) PRIMARY KEY,
    GenderTag VARCHAR(50)
);

-- Table for storing information about gender
CREATE TABLE IF NOT EXISTS Gender(
    GenderTag VARCHAR(50) PRIMARY KEY
);

-- Table for storing information about events in Olympic Games
CREATE TABLE IF NOT EXISTS Event (
    EventTag VARCHAR(50) PRIMARY KEY,
    YearTag INT,
    SeasonTag VARCHAR(50),
    GenderTag VARCHAR(50),
    DisciplineTag VARCHAR(50),
    CityTag VARCHAR(50),
    CountryTag VARCHAR(50),
    FOREIGN KEY (YearTag) REFERENCES Year(YearTag),
    FOREIGN KEY (SeasonTag) REFERENCES Game(SeasonTag),
    FOREIGN KEY (GenderTag) REFERENCES Gender(GenderTag),
    FOREIGN KEY (DisciplineTag) REFERENCES Discipline(DisciplineTag),
    FOREIGN KEY (CityTag) REFERENCES City(CityTag),
    FOREIGN KEY (CountryTag) REFERENCES Country(CountryTag)
);

-- Table for storing information about types of medals
CREATE TABLE IF NOT EXISTS Medal (
    MedalTag VARCHAR(50) PRIMARY KEY,
    AthleteTag VARCHAR(100),
    FOREIGN KEY (AthleteTag) REFERENCES Athlete(AthleteTag)
);

-- Insert sample data
INSERT INTO Year (YearTag) VALUES(2000);
INSERT INTO Game (SeasonTag, CountryTag, YearTag) VALUES ('Summer', 'Czech Republic', 2000);
INSERT INTO Gender(GenderTag) VALUES('Men');
INSERT INTO City (CityTag) VALUES ('Sydney');
INSERT INTO Sport (SportTag, GenderTag) VALUES ('Triathlon', 'Men');
INSERT INTO Discipline (DisciplineTag) VALUES ('Triathlon');
INSERT INTO Country (CountryTag) VALUES ('Czech Republic');
INSERT INTO Athlete (AthleteTag, GenderTag) VALUES ('REHULA', 'Men');
INSERT INTO Event (EventTag, YearTag, SeasonTag, GenderTag, DisciplineTag, CityTag, CountryTag) VALUES ('Triathlon', 2000, 'Summer', 'Men', 'Triathlon', 'Sydney', 'Czech Republic');
INSERT INTO Medal (MedalTag, AthleteTag) VALUES ('Bronze', 'REHULA');

-- Display the inserted data
SELECT * FROM Year;
SELECT * FROM Game;
SELECT * FROM Gender;
SELECT * FROM City;
SELECT * FROM Sport;
SELECT * FROM Discipline;
SELECT * FROM Country;
SELECT * FROM Athlete;
SELECT * FROM Event;
SELECT * FROM Medal;