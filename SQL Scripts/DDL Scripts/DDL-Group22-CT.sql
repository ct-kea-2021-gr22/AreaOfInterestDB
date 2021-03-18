-- --Database for CodersTrust quiz pop up
-- -- Author: Group 22, KEA DK2 2021
-- -- DLL part of the database

-- Creating the database
CREATE DATABASE AreaOfInterestDB;

-- Tells your DBMS to use the created database
USE AreaOfInterestDB;

-- Create a procedure to initialize the database. The procedure will create all the required tables. 
-- To run, first create the procudure by executing the below CREATE PROCEDURE, and then execute CALL <PROCEDURENAME()>
DELIMITER $$
CREATE PROCEDURE InitDB()
BEGIN

CREATE TABLE `User` (
    `UserID` INT NOT NULL auto_increment,
    `UserName` VARCHAR(255),
    `UserEmail` VARCHAR(255),
    PRIMARY KEY (`UserID`)
);

CREATE TABLE `Quiz` (
    `QuizID` INT NOT NULL auto_increment,
    `QuizName` VARCHAR(255),
    PRIMARY KEY (`QuizID`)
);

CREATE TABLE `Question` (
    `QuestionID` INT NOT NULL auto_increment,
    `QuestionText` VARCHAR(255),
    `QuestionArea` VARCHAR(255),
    `QuestionPoints` INT,
    `QuizID`int,
    PRIMARY KEY (`QuestionID`),
    FOREIGN KEY (`QuizID`) REFERENCES Quiz(QuizID)
);

CREATE TABLE `UserAnswer` (
    `AnswerID` INT NOT NULL auto_increment,
    `UserID` INT,
    `QuestionID` INT,
    `QuestionAnswer` BOOL,
    PRIMARY KEY (`AnswerID`),
    FOREIGN KEY (`UserID`) REFERENCES User(UserID),
    FOREIGN KEY (`QuestionID`) REFERENCES Question(QuestionID)
);

CREATE TABLE `AreaOfInterest` (
    `InterestID` INT NOT NULL auto_increment,
    `UserID` INT,
    `GD` FLOAT,
    `SoMe` FLOAT,
    `Dev` FLOAT,
    PRIMARY KEY (`InterestID`),
    FOREIGN KEY (`UserID`) REFERENCES User(UserID)
);

END$$
DELIMITER ;


-- Calling the procedure just created
CALL InitDB();





