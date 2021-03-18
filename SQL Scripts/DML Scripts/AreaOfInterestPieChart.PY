# The following script is created to show a piechart from a specific user from the AreaOfInterestDB
# Created by group22
# For this pyhton script you'll need to install mysql-connector-python and matplotlib, and be using python version 3.6 or higher, and your MySQL needs to be running
# To install, run pip install <PackageName>
# REMEMBER TO ENTER YOUR PASSWORD FOR YOUR MySQL on line 13

import mysql.connector
import matplotlib.pyplot as plt

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="<INSERT YOUT PASSWORD>",
    database="AreaOfInterestDB",
)
mycursor = mydb.cursor()


def GetUserStats(UserID):
    query = f"SELECT * FROM AreaOfInterestStats WHERE UserID = {UserID}"
    mycursor.execute(query)
    myresult = mycursor.fetchall()
    print(mycursor.fetchall())
    for x in myresult:
        labels = "Graphical Design", "Social Media", "Development"
        sizes = [x[2], x[3], x[4]]
        fig1, ax1 = plt.subplots()
        ax1.pie(
            sizes,
            labels=labels,
            autopct="%1.1f%%",
            shadow=True,
            startangle=90,
        )
        # Equal aspect ratio ensures that pie is drawn as a circle.
        ax1.axis("equal")
        plt.title(x[1])
        plt.show()


GetUserStats(3)
