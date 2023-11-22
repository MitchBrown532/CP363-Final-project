-- Run Commands in this order, or simply copy & paste this doc into your CMD:
-- Create Database:
CREATE DATABASE SchoolDB;
USE SchoolDB;

-- Create tables & Views
CREATE TABLE Student (
    StudentID Integer NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    FirstName Varchar(40) NOT NULL,
    Surname Varchar(40) NOT NULL,
    Degree Varchar(40) NOT NULL,
    Major Varchar(40) NOT NULL,
    Minor Varchar(40),
    AdmissionYr YEAR NOT NULL,
    GPA Decimal(4,2) NOT NULL
);

CREATE TABLE Instructor (
	InstructorID Integer NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	FirstName Varchar(40) NOT NULL,
	Surname Varchar(40) NOT NULL
);

CREATE TABLE PersonalInfo (
    InfoID Integer NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    StudentID Integer UNIQUE,
    InstructorID Integer UNIQUE,
    Gender Varchar(40) NOT NULL,
    Address Varchar(40) NOT NULL,
    City Varchar(40) NOT NULL,
    Province Varchar(40) NOT NULL,
    Country Varchar(40) NOT NULL,
    PhoneNum Varchar(40) NOT NULL,
    Email Varchar(40) NOT NULL,
    EmergencyCt Varchar(40) NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID) ON DELETE CASCADE
);

CREATE TABLE Course (
	CourseID Integer NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	InstructorID INT NOT NULL,
    CourseCode Varchar(20) NOT NULL,
	CourseName Varchar(40) NOT NULL,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID) ON DELETE CASCADE
);

CREATE TABLE StudentGrades (
    GradesID INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    MidtermOne DECIMAL(4,2),
    MidtermTwo DECIMAL(4,2),
    ProjectPres DECIMAL(4,2),
    ProjectRpt DECIMAL(4,2),
    FinalExam DECIMAL(4,2),
    FinalGrade DECIMAL(4,2) NOT NULL,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE
);

CREATE TABLE Enrollment (
    EnrollmentID INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE
);

-- Set up Foreign Keys
ALTER TABLE Student
ADD COLUMN Student_Info_ID Integer NOT NULL UNIQUE,
ADD CONSTRAINT Student_Info
FOREIGN KEY (Student_Info_ID)
REFERENCES PersonalInfo(InfoID);

ALTER TABLE Instructor
ADD COLUMN Instructor_Info_ID Integer NOT NULL UNIQUE,
ADD CONSTRAINT Instructor_Info
FOREIGN KEY (Instructor_Info_ID)
REFERENCES PersonalInfo(InfoID);

-- Set up views
CREATE OR REPLACE VIEW VStudent 
(
	 StudentID
	,FirstName
	,Surname
	,Degree
	,Major
	,Minor
	,AdmissionYr
	,GPA
	,Student_Info_ID
) AS
SELECT
	 StudentID
	,FirstName
	,Surname
	,Degree
	,Major
	,Minor
	,AdmissionYr
	,GPA
	,Student_Info_ID
FROM Student;

CREATE OR REPLACE VIEW VInstructor 
(
	 InstructorID
	,FirstName
	,Surname
	,Instructor_Info_ID
) AS
SELECT
	 InstructorID
	,FirstName
	,Surname
	,Instructor_Info_ID
FROM Instructor;

CREATE OR REPLACE VIEW VPersonalInfo
(
	 InfoID
	,StudentID
	,InstructorID
	,Gender
	,Address
	,City
	,Province
	,Country
	,PhoneNum
	,Email
	,EmergencyCt
) AS
SELECT
	 InfoID
	,StudentID
	,InstructorID
	,Gender
	,Address
	,City
	,Province
	,Country
	,PhoneNum
	,Email
	,EmergencyCt
FROM PersonalInfo;

CREATE OR REPLACE VIEW VCourse 
(
	 CourseID
	,InstructorID
	,CourseCode
	,CourseName
) AS
SELECT
	 CourseID
	,InstructorID
	,CourseCode
	,CourseName
FROM Course;

CREATE OR REPLACE VIEW VStudentGrades 
(
	 GradesID
	,StudentID
	,CourseID
	,MidtermOne
	,MidtermTwo
	,ProjectPres
	,ProjectRpt
	,FinalExam
    ,FinalGrade
) AS
SELECT
	 GradesID
	,StudentID
	,CourseID
	,MidtermOne
	,MidtermTwo
	,ProjectPres
	,ProjectRpt
	,FinalExam
    ,FinalGrade
FROM StudentGrades;

CREATE TABLE Enrollment (
    EnrollmentID INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID) ON DELETE CASCADE
);

CREATE OR REPLACE VIEW VEnrollment
(
	 EnrollmentID
	,StudentID
	,CourseID
) AS
SELECT
	 EnrollmentID
	,StudentID
	,CourseID
FROM Enrollment;

-- Insert Data:

INSERT INTO PersonalInfo (StudentID, InstructorID, Gender, Address, City, Province, Country, PhoneNum, Email, EmergencyCt)
VALUES
(NULL, NULL, 'Male', '123 Main St', 'Anytown', 'Anyprovince', 'USA', '555-1234', 'john.doe@example.com', 'John Emergency Contact'),
(NULL, NULL, 'Female', '456 Oak St', 'Othercity', 'Otherprovince', 'USA', '555-5678', 'jane.smith@example.com', 'Jane Emergency Contact'),
(NULL, NULL, 'Male', '789 Pine St', 'Anothercity', 'Anotherprovince', 'USA', '555-9876', 'michael.johnson@example.com', 'Michael Emergency Contact'),
(NULL, NULL, 'Female', '987 Elm St', 'Somewhere', 'Someprovince', 'USA', '555-4321', 'prof.anderson@example.com', 'Professor Anderson Emergency Contact'),
(NULL, NULL, 'Male', '654 Birch St', 'Nowhere', 'Noprovince', 'USA', '555-8765', 'dr.davis@example.com', 'Dr. Davis Emergency Contact'),
(NULL, NULL, 'Female', '321 Cedar St', 'Anywhere', 'Anyprovince', 'USA', '555-5678', 'ms.clark@example.com', 'Ms. Clark Emergency Contact');


INSERT INTO Student (FirstName, Surname, Degree, Major, Minor, AdmissionYr, GPA, Student_Info_ID)
VALUES
('John', 'Doe', 'Bachelor of Science', 'Computer Science', 'Mathematics', 2020, 3.75, 1),
('Jane', 'Smith', 'Bachelor of Arts', 'English', 'History', 2019, 3.85, 2),
('Michael', 'Johnson', 'Bachelor of Engineering', 'Mechanical Engineering', NULL, 2021, 3.60, 3);

INSERT INTO Instructor (FirstName, Surname, Instructor_Info_ID)
VALUES
('Professor', 'Anderson', 4),
('Dr.', 'Davis', 5),
('Ms.', 'Clark', 6);

INSERT INTO Course (InstructorID, CourseCode, CourseName)
VALUES
(1, 'CS101', 'Introduction to Computer Science'),
(2, 'ENG201', 'American Literature'),
(3, 'MECH301', 'Thermodynamics'),
(1, 'CS201', 'Data Structures and Algorithms');

INSERT INTO Enrollment (StudentID, CourseID)
VALUES
(1, 1),
(1, 4),
(2, 2),
(2, 3),
(3, 3),
(3, 1);

INSERT INTO StudentGrades (StudentID, CourseID, MidtermOne, MidtermTwo, ProjectPres, ProjectRpt, FinalExam, FinalGrade)
VALUES
(1, 1, 85.5, 90.0, 92.5, 88.0, 95.0, 91.2),
(1, 4, 88.0, 91.5, 89.0, 87.5, 94.0, 90.5),
(2, 2, 78.0, 82.5, 85.0, 80.5, 88.0, 82.8),
(2, 3, 70.0, 84.5, 86.0, 80.5, 88.0, 82.8),
(3, 3, 92.0, 88.5, 91.5, 90.0, 93.0, 91.8),
(3, 1, 87.5, 90.0, 88.0, 86.5, 92.5, 89.8);

