-- Run Commands in this order:
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

CREATE TABLE Instructor (
	InstructorID Integer NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	FirstName Varchar(40) NOT NULL,
	Surname Varchar(40) NOT NULL
);
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

CREATE TABLE Course (
	CourseID Integer NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	InstructorID INT NOT NULL,
    CourseCode Varchar(20) NOT NULL,
	CourseName Varchar(40) NOT NULL,
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID) ON DELETE CASCADE
);
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
