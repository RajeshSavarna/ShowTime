# ShowTime

Project Title: ShowTime (BookMyTickets)
		- Database Systems Final Project

Created by: Rajesh Kumar

**************************************************************************

Summary:
This system has following functionalities for USER
1. Registration
2. Login
3. Search Movies From Upcoming And Released MOvies
4. Search Movies By Language
5. Search Movies Name
6. Select Movie Available in Your Location
7. View Details, Description, Trailer, Rating, Cast etc....
8. Choose Movie Timing in Theatres Available In your Location
9. Choose Available Seat 
10. Pay and book tickets online Also Can Pay As a guest User
11. Generate Invoice
12. Logout

**************************************************************************

This system has following functionalities for Admin
1. Login
2. Select Movies, theaters, show, bookings, customer from Admin HomePage
3. View Record of Selected Attribute
4. Update Record
5. Add New Record
6. Delete Record 
7. Logout

*******************************************************************************

Technology used:
Java (J2EE)
Apache Tomcat 9
ORACLE 10G
JDBC
JSP, Servlet, HTML, Javascript/jQuery/aJax, Bootstrap, CSS

*******************************************************************************

Steps to run the project:

1. Import the project in Eclipse and configure build path if necessary.

2. Create database called "showtime" in "ORACLE 10G" and Run "showtime.sql" located in the project folder.

If you want to use your database credentials, please change the credentials in "connection.ConProvider.java" line number 12.

3. Run the project on Apache Tomcat 9 server

4. On Home page, click on Login to create new user or Login.
   (You can search shows without login, if you want to book tickets as Guest User you can Book.)

5. Enter new user details and click on "Register" button or Login with the user credentials.
   (The form checks for existing username)

7. Click on Movies of welcome page.

7. View Details of selected Movie. Click Book Button.

9. Select a particular show time by clicking on "Time" link to book tickets for that show.

10. Select Your Seat on SeatView

10. On booking page, The total cost is calculated dynamically (using jquery) 
    as price multiplied by number of tickets. Select Payment Method.

11. Once clicked on "Pay and book tickets", the booking summary is displayed in successful scenario.

12. Then click on "Logout" to clear your session.

***********************************************************************
