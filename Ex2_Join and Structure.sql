-- Author: Rikin Shah
-- SQL History: Microsoft SQL Server 2012 (SP1) - In last task we populated data in the table, Here we are creating SQL Queries 
--                                                and then views 
-- Assignment: Using SQL Queries Joins and Then creating the view's

--------------------------------------------------Using IFT530 database ----------------------------------------------- 
USE IFT530_DB;  
--------------------------------------------------  SQL QUERIES JOIN 1 --------------------------------------------------------
SELECT 
    S.StudentID,
    S.FirstName AS StudentFirstName,
    S.LastName AS StudentLastName,
    C.CourseID,
    C.CourseDescription,
    SG.Grade
FROM
    Student S
JOIN
    StudentGrade SG ON S.StudentID = SG.StudentID
JOIN
    Course C ON SG.CourseID = C.CourseID
WHERE
    C.CourseDescription = 'Advanced DBMS' AND SG.Grade <= 3.0
ORDER BY

--------------------------------------------------  To create a view --------------------------------------------------------

CREATE VIEW AdvDBMSStudents AS
SELECT 
    S.StudentID,
    S.FirstName AS StudentFirstName,
    S.LastName AS StudentLastName,
    C.CourseID,
    C.CourseDescription,
    SG.Grade
FROM
    Student S
JOIN
    StudentGrade SG ON S.StudentID = SG.StudentID
JOIN
    Course C ON SG.CourseID = C.CourseID
WHERE
    C.CourseDescription = 'Advanced DBMS' AND SG.Grade <= 3.0 

-------------------------------------------------- To see the created view --------------------------------------------------------

Select * FROM AdvDBMSStudents
ORDER BY Grade DESC;

-------------------------------------------------- END OF SQL Query Join 1 and View ------------------------------------------------
------------------------------------------------- SQL QUERIES JOIN 2 ---------------------------------------------------------------

SELECT
    C.CourseID,
    C.CourseDescription,
    COALESCE(COUNT(SG.StudentID), 0) AS EnrolledStudents
FROM
    Course C
LEFT JOIN
    StudentGrade SG ON C.CourseID = SG.CourseID
GROUP BY
    C.CourseID, C.CourseDescription
HAVING
    COALESCE(COUNT(SG.StudentID), 0) <= 5 OR COALESCE(COUNT(SG.StudentID), 0) IS NULL;


--------------------------------------------------  To create a view --------------------------------------------------------

CREATE VIEW EnrolledStudents AS 
SELECT
    C.CourseID,
    C.CourseDescription,
    COALESCE(COUNT(SG.StudentID), 0) AS EnrolledStudents
FROM
    Course C
LEFT JOIN
    StudentGrade SG ON C.CourseID = SG.CourseID
GROUP BY
    C.CourseID, C.CourseDescription
HAVING
    COALESCE(COUNT(SG.StudentID), 0) <= 5 OR COALESCE(COUNT(SG.StudentID), 0) IS NULL;

-------------------------------------------------- To see the created view --------------------------------------------------------

Select * FROM EnrolledStudents;

-------------------------------------------------- END OF SQL Query Join 2 and View ------------------------------------------------


--------------------------------------------------- Previous Assignment Table Creation Script -------------------------------

---------------------------------------------------- Create Course table ---------------------------------------------------
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseDescription VARCHAR(200),
    CourseFee DECIMAL(10, 2)
);

---------------------------------------------------- Create Faculty table---------------------------------------------------
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FirstName VARCHAR(30),
    LastName VARCHAR(30),
    PrimaryEmail VARCHAR(50),
    DateOfJoining DATE,
    WorkPhone VARCHAR(15)
);

---------------------------------------------------- Create Student table---------------------------------------------------

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    State VARCHAR(50),
    Zip VARCHAR(10),
    Degree VARCHAR(50),
    NoOfClasses INT
);

---------------------------------------------------- Create Class table---------------------------------------------------

CREATE TABLE Class (
    ClassID INT,
    CourseID INT,
    StartDate DATE,
    EndDate DATE,
    Location VARCHAR(50),
	PRIMARY KEY (ClassID, CourseID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

---------------------------------------------------- Create StudentGrade table---------------------------------------------------


CREATE TABLE StudentGrade (
    StudentID INT,
    ClassID INT,
    CourseID INT,
    FacultyID INT,
    Grade DECIMAL(3, 2),
    PRIMARY KEY (StudentID, ClassID, CourseID, FacultyID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClassID, CourseID) REFERENCES Class(ClassID, CourseID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

---------------------------------------------------- Script to drop tables---------------------------------------------------
-- Be cautious when using DROP TABLE as it will delete all data in the tables

-- DROP TABLE StudentGrade;
-- DROP TABLE Class;
-- DROP TABLE Student;
-- DROP TABLE Faculty;
-- DROP TABLE Course;


----------------------------------------------- Assignment 2 Script Start From HERE -----------------------------------------
-------------------------------------------------- Insert data into Course table -------------------------------------------------
INSERT INTO Course (CourseID, CourseDescription, CourseFee) VALUES
(530, 'Advanced DBMS', 500.00),
(520, 'Advanced Security', 600.00),
(210, 'JAVA Technologies', 550.00), 
(590, 'AWS Architecture',700.00),
(568,  'Python Programming', 800.00);

--To Show the Student Table Data
Select * From Course;  

----------------------------------- Insert data into Faculty table-------------------------------------------------------------------------
INSERT INTO Faculty (FacultyID, FirstName, LastName, PrimaryEmail, DateOfJoining, WorkPhone) VALUES
(2001, 'John', 'Doe', 'john.doe@example.com', '2020-01-15', '123-456-7890'),
(2002, 'Jane', 'Smith', 'jane.smith@example.com', '2019-03-22', '123-456-7891'),
(2003, 'Emily', 'Jones', 'emily.jones@example.com', '2021-07-30', '123-456-7892'); 

--To Show the Faculty Table Data
Select * From Faculty; 


-------------------------------------Insert data into Student table-------------------------------------------------------------

    INSERT INTO Student (StudentID, FirstName, LastName, State_Code, Zip, Degree, No_Of_Classes) VALUES
    (1126371301, 'Alice', 'Brown', 'NY', '10001', 'Undergraduate', 3),
    (1126371302, 'Bob', 'Johnson', 'CA', '90001', 'Bachelor', 3),
    (1126371303, 'Charlie', 'Davis', 'TX', '73301', 'Masters', 3),
    (1126371304, 'David', 'Wilson', 'NY', '10002', 'Undergraduate', 1),
    (1126371295, 'Eve', 'Miller', 'CA', '90002', 'Bachelor', 1),
    (1126371296, 'Frank', 'Moore', 'TX', '73302', 'Masters', 1),
    (1126371297, 'Grace', 'Taylor', 'NY', '10003', 'Undergraduate', 2),
    (1126371298, 'Hank', 'Anderson', 'CA', '90003', 'Bachelor', 2),
    (1126371299, 'Ivy', 'Thomas', 'TX', '73303', 'Masters', 0),
    (1126371300, 'Jack', 'White', 'NY', '10004', 'Undergraduate', 3); 

--To Show the Student Table Data
Select * From Student; 
------------------------------------- Validating Data as per the Condition using Group_By Clause -------------------------------------

SELECT No_Of_Classes, COUNT(*) AS StudentCount
FROM Student
GROUP BY No_Of_Classes;

-------------------------------------Insert data into Class table-------------------------------------------------------------
INSERT INTO Class (ClassID, CourseID, StartDate, EndDate, Location) VALUES
(101, 530, '2024-09-01', '2024-12-15', 'Room 101'),
(102, 520, '2024-09-01', '2024-12-15', 'Room 102'),
(103, 210, '2024-09-01', '2024-12-15', 'Room 103'),
(104, 590, '2024-09-02', '2024-12-16', 'Room 104');

----------------------------------- To Show the Class Table Data ---------------------------------------------
Select * From Class; 

------------------------------------- Insert data into StudentGrade table-----------------------------------------------------
-------------------------------------- Students taking 3 courses-------------------------------
INSERT INTO StudentGrade (StudentID, ClassID, CourseID, FacultyID, Grade) VALUES
(1126371291, 101, 530, 2001, 4.0),
(1126371291, 102, 520, 2002, 3.0),
(1126371291, 103, 210, 2003, 4.0),
(1126371292, 101, 530, 2001, 3.0),
(1126371292, 102, 520, 2002, 4.0),
(1126371292, 103, 210, 2003, 2.0),
(1126371293, 101, 530, 2001, 4.0),
(1126371293, 102, 520, 2002, 3.0),
(1126371293, 103, 210, 2003, 4.0),
(1126371300, 101, 530, 2001, 3.0),
(1126371300, 102, 520, 2002, 4.0),
(1126371300, 103, 210, 2003, 2.0); 

--To Show the Student Table Data
Select * From StudentGrade; 


--------------------------------------- Students taking 2 courses ------------------------------
INSERT INTO StudentGrade (StudentID, ClassID, CourseID, FacultyID, Grade) VALUES
(1126371297, 101, 530, 2001, 3.0),
(1126371297, 102, 520, 2002, 4.0),
(1126371298, 102, 520, 2002, 2.0),
(1126371298, 103, 210, 2003, 3.0);

--To Show the Student Table Data
Select * From StudentGrade; 

--------------------------------------- Students taking 1 course ------------------------------
INSERT INTO StudentGrade (StudentID, ClassID, CourseID, FacultyID, Grade) VALUES
(1126371294, 101, 530, 2001, 2.0),
(1126371295, 102, 520, 2002, 3.0),
(1126371296, 103, 210, 2003, 4.0);

--To Show the Student Table Data
Select * From StudentGrade;  


--------------------------------- ADDING FEW NEW DATA for Queries Testing ------------------------------------------
---------------------------------- STUDENTS ------------------------------------------------------------------------
INSERT INTO Student (StudentID, FirstName, LastName, State_Code, Zip, Degree, No_Of_Classes) VALUES
(1126371309, 'Liam', 'Smith', 'NY', '10005', 'Undergraduate', 2),
(1126371310, 'Olivia', 'Johnson', 'CA', '90004', 'Bachelor', 4),
(1126371311, 'Noah', 'Williams', 'TX', '73304', 'Masters', 3),
(1126371312, 'Emma', 'Jones', 'FL', '33102', 'Undergraduate', 1),
(1126371313, 'Sophia', 'Garcia', 'WA', '98102', 'Masters', 2),
(1126371314, 'Mason', 'Martinez', 'MA', '02102', 'Undergraduate', 3),
(1126371315, 'Isabella', 'Rodriguez', 'NV', '89102', 'Bachelor', 1);


------------------------------------ STUDENT GRADE ------------------------------------------------------------------------
INSERT INTO StudentGrade (StudentID, ClassID, CourseID, FacultyID, Grade) VALUES
(1126371309, 101, 530, 2001, 3.5),
(1126371309, 104, 590, 2002, 2.2); 

INSERT INTO StudentGrade (StudentID, ClassID, CourseID, FacultyID, Grade) VALUES
(1126371310, 101, 530, 2001, 3.2),
(1126371310, 102, 520 , 2002, 2.1),
(1126371310, 103, 210, 2003, 2.5),
(1126371310, 104, 590, 2003, 2.4);

INSERT INTO StudentGrade (StudentID, ClassID, CourseID, FacultyID, Grade) VALUES
(1126371311, 101, 530, 2001, 2.6),
(1126371311, 102, 520, 2002, 2.3),
(1126371311, 104, 590, 2003, 2.8);

-------------------------------- CLASS ------------------------------------------------------------------------
INSERT INTO Class(ClassID, CourseID, StartDate, EndDate, Location) VALUES 
(104,590,'2024-09-02','2024-12-16','Room 104');

------------------------------------- END OF SCRIPT -----------------------------------------------
