# AreaOfInterestDB

This is a repository containing SQL script for Coderstrust and their AreaOfInterest quiz.

REMEBER!! Extract the .zip

# Creating the Database
1. First open up your Preffered IDE, for this project MySQLWorkbench has been used.

2. Connect to your DBMS, this must be MySQL

3. Extract the zip file SQLScripts.zip

4. Open the SQL file called "DDL-group22-CT" in your IDE.

5. Execute line 6,9 and 14 which is to create the database on your DBMS.

6. Execute the following command from any line within the script.
    CALL InitDB();
    
7. Now that you have created the database and its tables its time to dump some random data into it.

# Dumping test data into the database
After creating the database it is now time to play around with data manipulation.

1. Open the SQL file called "DML-group22-CT" in your IDE.

2. Run the CreateDumpData() procedure by executing the CREATE PROCEDURE and then CALL <PROCEDURENAME>

3. Feel free to play around in the DML

#Extras

1. A small pyhton script has been developed 

2. Open your preffred IDE and run the script, remember to have your DBMS running.

3. Remember to fill out <YOUR PASSWORD> for your localhost database after it has been created
