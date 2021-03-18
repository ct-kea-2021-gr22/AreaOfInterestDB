-- #Database for CodersTrust quiz pop up
-- # Author: Group 22, KEA DK2 2021
-- # Creating a view which is meant to show percentage of answers in each area

#Dumping data to the AreaOfInterest table which is meant to happen from the front-end
INSERT INTO AreaOfInterestDB.AreaOfInterest(UserID,GD,SoMe,Dev)
VALUES
	#User with UserID=5 answered YES to 4 GD, NO to 4 SoMe(Graphicaldesign), and YES to 2 Dev, and NO to 2 Dev
	(5,20,0,10),
    #User with UserID=4 answered NO to GD(Graphicaldesign), YES to 4 Dev, and NO to 2 Dev, and YES to 2 Dev
	(4,0,20,10),
    #More examples
    (3,10,5,20),
    (7,5,5,20),
    (9,10,10,10);
    
    
#Creating a view that is calculating the answers in each category to percentage for better overview
CREATE VIEW AreaOfInterestStats AS
SELECT 
	AreaOfInterest.UserID,
    User.UserName,
    ROUND((GD / (GD + SoMe + Dev) * 100),2) AS GraphicalDesign,
    ROUND((SoMe / (GD + SoMe + Dev) * 100),2) AS SocialMedia,
    ROUND((Dev / (GD + SoMe + Dev) * 100),2) AS Development
FROM
    AreaOfInterestDB.AreaOfInterest
INNER JOIN
	User ON AreaOfInterest.UserID = User.UserID;


#View the newly created view to show the statistics 
SELECT * FROM AreaOfInterestStats;



