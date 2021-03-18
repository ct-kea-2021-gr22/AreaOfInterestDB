-- #Database for CodersTrusts quiz pop up
-- # Author: Group 22, KEA DK2 2021
-- # DML part of the database

#Selecting the created database
USE AreaOfInterestDB;    

####!!!! REMEMBER TO CREATE THE PROCEDURE BEFORE CALLING IT

#Creating a procedure to create dump data, which is only for dev, to test the different tables relations
DELIMITER $$
CREATE PROCEDURE CreateDumpData()
BEGIN
	#Inserting users into user table, the UserID will be created by the NOT NULL auto_increment
	INSERT INTO User (UserName, UserEmail)
	VALUES
		('Morten Jensen','morten@jensen.dk'),
		('Jens Peter','jens@peter.dk'),
		('Mathias Lindhart','mathias@lindhart.dk'),
		('Mikkel Klint','mikkel@klint.dk'),
		('Peter Jensen','peter@jensen.dk'),
		('Søren Carlsen','soren@carlsen.dk'),
		('Mie Møller','mie@møller.dk'),
		('Susanne Petersen','susanne@petersen.dk'),
		('Brigitte Jensen','brigitte@jensen.dk'),
		('Johan Løvholt','johan@lovholt.dk'),
		('Mathias Kullenberg','mathias@kullenberg.dk');

	#Insert quiz in quiz table
	INSERT INTO Quiz (QuizName)
	VALUES ('Area of interest quiz');

	#Inserting questions into question table
	INSERT INTO Question (QuestionText, QuestionArea, QuestionPoints, QuizID)
	VALUES
		('Do you appreciate design in relation to products?','Creative',5,1),
		('Do you have a favourite artist when it comes to visual art?','Creative',5,1),
		('Do you enjoy making visual presentations for school or business?','Creative',5,1),
		('Have you tried editing video on yoxur mobile device or PC?','Creative',5,1),
		('Do you like to take online intelligence tests?','Development',5,1),
		('Do you find numbers and logic is preferred over philosophical questions?','Development',5,1),
		('Are you interested in coding and learning to either understand or code yourself?','Development',5,1),
		('Have you tried building a website with a CMS like wordpress or Wix?','Development',5,1),
		('Are you very active on Social Media?','Digital Marketing',5,1),
		('Do you care about who likes and comments on your posts?','Digital Marketing',5,1),
		('Do you find that Social Media influences your buying decisions?','Digital Marketing',5,1),
		('Do you believe that Social Media is more effective than traditional marketing?','Digital Marketing',5,1);
        
	#A user answers a question with a yes
	INSERT INTO
	 UserAnswer (UserID, QuestionID, QuestionAnswer)
	VALUES
		#User id should be recieved from front end saying this.userId, example is shown below
		#Question id should be revieved from front end saying this.Question, example is shown below
		(4,8,true);
		
	#A user answers a question with a no
	INSERT INTO
	 UserAnswer (UserID, QuestionID, QuestionAnswer)
	VALUES
		#User id should be recieved from front end saying this.userId, example is shown below
		#Question id should be revieved from front end saying this.Question, example is shown below
		(5,10,false);
END$$
DELIMITER ;

#Calling the newly created procedures to create dump data for testing
CALL CreateDumpData();

SELECT * from User;


################# Operations from the Quiz Pop up ##############################

##### QUIZ INTERACTIONS
#Quiz is added from Admin panel
INSERT INTO Quiz(QuizName)
VALUES
	('NewCostumerQuiz');
    
##### USER INTERACTIONS
#A user is added
INSERT INTO User(UserName, UserEmail)
VALUES
	('Morten Jensen', 'Test@Test.dk');
#A user wants to update their info
UPDATE User 
SET 
    UserName = 'Peter Frank',
    UserEmail = 'Peter@Frank.dk'
WHERE
    UserID = 1;
#A user wants to be deleted
DELETE FROM User 
WHERE
    UserID = 10;

#####Question interactions

#A question is added from the admin panel
INSERT INTO Question(QuestionText,QuestionArea,QuestionPoints,QuizID)
VALUES
	('How do you feel about being fully responsible for full costumer satisfaction?', 'Development', 5, 1);

UPDATE Question 
SET 
    QuestionText = 'This is the new question'
WHERE
    QuestionID = 10;

DELETE FROM Question 
WHERE
    QuestionID = 9;

#####Qestion interactions from user (UserAnswer)

#A user answers a question with a yes
	INSERT INTO
	 UserAnswer (UserID, QuestionID, QuestionAnswer)
	VALUES
		#User id should be recieved from front end saying this.userId, example is shown below
		#Question id should be revieved from front end saying this.Question, example is shown below
		(4,8,true);
        
	#A user answers a question with a no
	INSERT INTO
	 UserAnswer (UserID, QuestionID, QuestionAnswer)
	VALUES
		#User id should be recieved from front end saying this.userId, example is shown below
		#Question id should be revieved from front end saying this.Question, example is shown below
		(5,10,false);



#Creating a view to get an overview of all the answers and their category
CREATE VIEW AdminUserAnswers AS
    SELECT 
        User.UserName,
        UserAnswer.QuestionAnswer,
        Question.QuestionArea,
        Question.QuestionPoints
    FROM
        UserAnswer
            INNER JOIN
        User ON UserAnswer.UserID = User.UserID
            INNER JOIN
        Question ON Question.QuestionID = UserAnswer.QuestionID;

SELECT * FROM AdminUserAnswers;



