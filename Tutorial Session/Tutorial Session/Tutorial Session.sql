-- Create a new database
CREATE DATABASE TUTORIALSESSIONS;

USE TUTORIALSESSIONS;

-- Create TUTOR table
CREATE TABLE TUTOR (
    TUTOR_ID VARCHAR(5) NOT NULL PRIMARY KEY,  -- Unique tutor ID
    TUTOR_NAME VARCHAR(50) NOT NULL            -- Full tutor name
);

-- Create SCHOOL table
CREATE TABLE SCHOOL (
    SCHOOL_ID VARCHAR(5) NOT NULL PRIMARY KEY, -- Unique school ID
    SCHOOL_NAME VARCHAR(50) NOT NULL,          -- School name
    SCHOOL_ADDRESS VARCHAR(100) NOT NULL       -- Full school address
);

-- Create SESSIONS table
CREATE TABLE SESSIONS (
    TUTOR_ID VARCHAR(5) NOT NULL,              -- Linked to tutor
    SCHOOL_ID VARCHAR(5) NOT NULL,             -- Linked to school
    SEATS_AVAILABLE SMALLINT NOT NULL,         -- Available seats
    PRIMARY KEY (TUTOR_ID, SCHOOL_ID),         -- Composite key (one tutor-school combo unique)
    FOREIGN KEY (TUTOR_ID) REFERENCES TUTOR(TUTOR_ID),
    FOREIGN KEY (SCHOOL_ID) REFERENCES SCHOOL(SCHOOL_ID)
);

-- Insert tutors
INSERT INTO TUTOR (TUTOR_ID, TUTOR_NAME) VALUES
('A001', 'Mia Phillips'),
('A002', 'Bam Mbombo'),
('A003', 'Wendy Grootboom'),
('A004', 'Henk Cloete'),
('A005', 'Sihle Nukani');

-- Insert schools
INSERT INTO SCHOOL (SCHOOL_ID, SCHOOL_NAME, SCHOOL_ADDRESS) VALUES
('C001', 'Joburg High', '167 Pert Road, Johannesburg'),
('C002', 'Gqeberha Secondary', '5 Second Avenue, Gqeberha'),
('C003', 'Mkhize Secondary', '33 Bertha Mkhize Street, Durban'),
('C004', 'Durban High', '27 Bram Fischer Road, Durban'),
('C005', 'Tshwane High', '210 Du Toit Street, Tshwane');

-- Insert sessions
INSERT INTO SESSIONS (TUTOR_ID, SCHOOL_ID, SEATS_AVAILABLE) VALUES
('A002', 'C001', 50),
('A002', 'C004', 30),
('A003', 'C005', 15),
('A004', 'C003', 20),
('A004', 'C001', 40);

-- Display all tables.
SELECT * FROM TUTOR;
SELECT * FROM SCHOOL;
SELECT * FROM SESSIONS;

-- Add new column for booked seats
ALTER TABLE SESSIONS 
ADD SEATS_BOOKED SMALLINT;

-- Set booked seats for tutor A004 at school C001
UPDATE SESSIONS
SET SEATS_BOOKED = 35
WHERE TUTOR_ID = 'A004' AND SCHOOL_ID = 'C001';

--Display table after update.
SELECT * FROM SESSIONS;

-- Find tutors that do not appear in sessions table
SELECT t.TUTOR_NAME
FROM TUTOR t
LEFT JOIN SESSIONS s ON t.TUTOR_ID = s.TUTOR_ID
WHERE s.TUTOR_ID IS NULL;

-- Calculate total seats available grouped by tutor
SELECT 
    t.TUTOR_NAME,
    SUM(s.SEATS_AVAILABLE) AS TOTAL_SEATS
FROM TUTOR t
LEFT JOIN SESSIONS s ON t.TUTOR_ID = s.TUTOR_ID
GROUP BY t.TUTOR_NAME
ORDER BY t.TUTOR_NAME ASC;  -- Alphabetical

-- Find which school gives tutor A004 the most seats
SELECT TOP 1
    t.TUTOR_NAME,
    s2.SCHOOL_NAME,
    s1.SEATS_AVAILABLE
FROM SESSIONS s1
JOIN TUTOR t ON s1.TUTOR_ID = t.TUTOR_ID
JOIN SCHOOL s2 ON s1.SCHOOL_ID = s2.SCHOOL_ID
WHERE s1.TUTOR_ID = 'A004'
ORDER BY s1.SEATS_AVAILABLE DESC; -- Only top result-- Create a new database
CREATE DATABASE TUTORIALSESSIONS;

USE TUTORIALSESSIONS;

-- Create TUTOR table
CREATE TABLE TUTOR (
    TUTOR_ID VARCHAR(5) NOT NULL PRIMARY KEY,  -- Unique tutor ID
    TUTOR_NAME VARCHAR(50) NOT NULL            -- Full tutor name
);

-- Create SCHOOL table
CREATE TABLE SCHOOL (
    SCHOOL_ID VARCHAR(5) NOT NULL PRIMARY KEY, -- Unique school ID
    SCHOOL_NAME VARCHAR(50) NOT NULL,          -- School name
    SCHOOL_ADDRESS VARCHAR(100) NOT NULL       -- Full school address
);

-- Create SESSIONS table
CREATE TABLE SESSIONS (
    TUTOR_ID VARCHAR(5) NOT NULL,              -- Linked to tutor
    SCHOOL_ID VARCHAR(5) NOT NULL,             -- Linked to school
    SEATS_AVAILABLE SMALLINT NOT NULL,         -- Available seats
    PRIMARY KEY (TUTOR_ID, SCHOOL_ID),         -- Composite key (one tutor-school combo unique)
    FOREIGN KEY (TUTOR_ID) REFERENCES TUTOR(TUTOR_ID),
    FOREIGN KEY (SCHOOL_ID) REFERENCES SCHOOL(SCHOOL_ID)
);

-- Insert tutors
INSERT INTO TUTOR (TUTOR_ID, TUTOR_NAME) VALUES
('A001', 'Mia Phillips'),
('A002', 'Bam Mbombo'),
('A003', 'Wendy Grootboom'),
('A004', 'Henk Cloete'),
('A005', 'Sihle Nukani');

-- Insert schools
INSERT INTO SCHOOL (SCHOOL_ID, SCHOOL_NAME, SCHOOL_ADDRESS) VALUES
('C001', 'Joburg High', '167 Pert Road, Johannesburg'),
('C002', 'Gqeberha Secondary', '5 Second Avenue, Gqeberha'),
('C003', 'Mkhize Secondary', '33 Bertha Mkhize Street, Durban'),
('C004', 'Durban High', '27 Bram Fischer Road, Durban'),
('C005', 'Tshwane High', '210 Du Toit Street, Tshwane');

-- Insert sessions
INSERT INTO SESSIONS (TUTOR_ID, SCHOOL_ID, SEATS_AVAILABLE) VALUES
('A002', 'C001', 50),
('A002', 'C004', 30),
('A003', 'C005', 15),
('A004', 'C003', 20),
('A004', 'C001', 40);

-- Display all tables.
SELECT * FROM TUTOR;
SELECT * FROM SCHOOL;
SELECT * FROM SESSIONS;

-- Add new column for booked seats
ALTER TABLE SESSIONS 
ADD SEATS_BOOKED SMALLINT;

-- Set booked seats for tutor A004 at school C001
UPDATE SESSIONS
SET SEATS_BOOKED = 35
WHERE TUTOR_ID = 'A004' AND SCHOOL_ID = 'C001';

--Display table after update.
SELECT * FROM SESSIONS;

-- Find tutors that do not appear in sessions table
SELECT t.TUTOR_NAME
FROM TUTOR t
LEFT JOIN SESSIONS s ON t.TUTOR_ID = s.TUTOR_ID
WHERE s.TUTOR_ID IS NULL;

-- Calculate total seats available grouped by tutor
SELECT 
    t.TUTOR_NAME,
    SUM(s.SEATS_AVAILABLE) AS TOTAL_SEATS
FROM TUTOR t
LEFT JOIN SESSIONS s ON t.TUTOR_ID = s.TUTOR_ID
GROUP BY t.TUTOR_NAME
ORDER BY t.TUTOR_NAME ASC;  -- Alphabetical

-- Find which school gives tutor A004 the most seats
SELECT TOP 1
    t.TUTOR_NAME,
    s2.SCHOOL_NAME,
    s1.SEATS_AVAILABLE
FROM SESSIONS s1
JOIN TUTOR t ON s1.TUTOR_ID = t.TUTOR_ID
JOIN SCHOOL s2 ON s1.SCHOOL_ID = s2.SCHOOL_ID
WHERE s1.TUTOR_ID = 'A004'
ORDER BY s1.SEATS_AVAILABLE DESC; -- Only top result