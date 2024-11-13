
--- Source Code - Rikin Shah.
--- Demonstrating creation and insertion of the data in sql with the mapping. 
--- In this I have created several table's and inserting the data in it.


-- Create Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseDescription VARCHAR(255),
    CourseFee DECIMAL(10, 2)
);

-- Create Faculty table
CREATE TABLE Faculty (
    FacultyID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    PrimaryEmail VARCHAR(100),
    DateOfJoining DATE,
    WorkPhone VARCHAR(20)
);

-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    State VARCHAR(50),
    Zip VARCHAR(10),
    Degree VARCHAR(50),
    NoOfClasses INT
);

-- Create Class table
CREATE TABLE Class (
    ClassID INT,
    CourseID INT,
    StartDate DATE,
    EndDate DATE,
    Location VARCHAR(100),
	PRIMARY KEY (ClassID, CourseID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Create StudentGrade table
CREATE TABLE StudentGrade (
    StudentID INT,
    ClassID INT,
    CourseID INT,
    FacultyID INT,
    Grade DECIMAL(3, 2),
    Requirement VARCHAR(100),
    PRIMARY KEY (StudentID, ClassID, CourseID, FacultyID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClassID, CourseID) REFERENCES Class(ClassID, CourseID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID),
    FOREIGN KEY (FacultyID) REFERENCES Faculty(FacultyID)
);

-- Script to drop tables
-- Be cautious when using DROP TABLE as it will delete all data in the tables
-- DROP TABLE StudentGrade;
-- DROP TABLE Class;
-- DROP TABLE Student;
-- DROP TABLE Faculty;
-- DROP TABLE Course;


INSERT INTO Class ( ClassID, CourseID, StartDate, EndDate, Location)
VALUES
    ( 1,530, '2023-09-10', '2023-12-10', 'Room A'),
    ( 2,598, '2023-09-15', '2023-12-15', 'Room B'),
    ( 3,511, '2023-09-20', '2023-12-20', 'Room C')

Select * from Class

INSERT INTO Course (CourseID, CourseDescription, CourseFee)
VALUES
    (530,'Advanced DataBase', 5000),
    (598,'Data Visualization', 5000),
    (511,'Big Data', 5000);
select * from Course

INSERT INTO Faculty (FacultyID, FirstName, LastName, PrimaryEmail, DateOfJoining, WorkPhone)
VALUES 
		(1, 'Asamma', 'Elbradway', 'aelbdrw@asu.edu', '2000-03-08', '4809193496'),
		(2, 'Robert', 'Rucker', 'rrucker@asu.edu', '2001-08-29', '4809193496'),
		(3, 'Ashish', 'Gulati', 'agulati1@asu.edu', '2002-06-03', '4809193498')

SELECT * FROM Faculty

INSERT INTO Student (StudentID, FirstName,LastName, State, Zip, Degree, NoOfClasses)
VALUES
    (1,'John', 'Doe', 'New York', '10001', 'Undergraduate', 3),
    (2,'Jane', 'Smith', 'California', '90001', 'Bachelor', 3),
    (3,'Alice', 'Johnson', 'Texas', '75001', 'Masters', 3),
    (4,'Bob', 'Williams', 'Florida', '33101', 'Bachelor', 1),
    (5,'Emily', 'Brown', 'Ohio', '43201', 'Undergraduate', 1),
    (6,'Michael', 'Lee', 'Illinois', '60601', 'Masters', 2),
    (7,'Sarah', 'Clark', 'Michigan', '48201', 'Undergraduate', 2),
    (8,'David', 'Martin', 'Arizona', '85001', 'Bachelor', 1),
    (9,'Laura', 'Garcia', 'Colorado', '80201', 'Masters', 2),
    (10,'Daniel', 'Harris', 'Washington', '98101', 'Undergraduate', 0);
Select * from Student

INSERT INTO StudentGrade (StudentID, ClassID, CourseID, FacultyID, Grade)
VALUES 
	(1, 1, 530, 3, 9.50),
	(2, 1, 530, 3, 9.60),
	(3, 1, 530, 3, 9.00),
	(4, 1, 530, 3, 9.50),
	(5, 1, 530, 3, 9.80),
	(6, 1, 530, 3, 8.70),
	(7, 1, 530, 3, 8.50),
	(8, 1, 530, 3, 8.40),
	(9, 1, 530, 3, 7.60),
	(10, 1, 530, 3, 7.30)
SELECT * FROM StudentGrade