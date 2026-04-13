👨‍💻Author: Keabetswe Masole

Software Used: SQL Server Management Studio 20

---------------------
📌 Overview

This project creates and manages a relational database for tutorial sessions. It links tutors to schools and tracks available and booked seats, allowing for efficient data retrieval and analysis.

---------------
**🧠 Database Structure**


📍 Tables

-> TUTOR
  * TUTOR_ID (Primary Key)
  * TUTOR_NAME

-> SCHOOL
  * SCHOOL_ID (Primary Key)
  * SCHOOL_NAME
  * SCHOOL_ADDRESS

-> SESSIONS
  * TUTOR_ID (Foreign Key)
  * SCHOOL_ID (Foreign Key)
  * SEATS_AVAILABLE
  * SEATS_BOOKED
  * Composite Primary Key (TUTOR_ID, SCHOOL_ID)

---------------
⚙️ Features

- Create and manage relational database tables
- Insert and update records
- Establish relationships using foreign keys
- Perform advanced queries using joins and aggregation
- Track available and booked session seats

---------------
▶️ How to Run

1. Open your MySQL
2. Copy and paste the SQL script
3. Execute the script step-by-step or all at once
4. View results using the provided SELECT queries

------------
**🔍 Sample Queries**

📌 View all data:
SELECT * FROM TUTOR;
SELECT * FROM SCHOOL;
SELECT * FROM SESSIONS;

📌 Find tutors with no sessions:
SELECT t.TUTOR_NAME
FROM TUTOR t
LEFT JOIN SESSIONS s ON t.TUTOR_ID = s.TUTOR_ID
WHERE s.TUTOR_ID IS NULL;

📌 Total seats per tutor:
SELECT 
    t.TUTOR_NAME,
    SUM(s.SEATS_AVAILABLE) AS TOTAL_SEATS
FROM TUTOR t
LEFT JOIN SESSIONS s ON t.TUTOR_ID = s.TUTOR_ID
GROUP BY t.TUTOR_NAME
ORDER BY t.TUTOR_NAME ASC;

📌 School offering most seats for a tutor:
SELECT TOP 1
    t.TUTOR_NAME,
    s2.SCHOOL_NAME,
    s1.SEATS_AVAILABLE
FROM SESSIONS s1
JOIN TUTOR t ON s1.TUTOR_ID = t.TUTOR_ID
JOIN SCHOOL s2 ON s1.SCHOOL_ID = s2.SCHOOL_ID
WHERE s1.TUTOR_ID = 'A004'
ORDER BY s1.SEATS_AVAILABLE DESC;

------------------------
🚀 Future Improvements

* Add student table and booking system
* Implement constraints for seat limits
* Create stored procedures for automation
* Add indexing for performance optimization
* Develop a front-end interface for user interaction
