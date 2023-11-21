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

-- Insert Data:
INSERT INTO Student (FirstName, Surname, Degree, Major, Minor, AdmissionYr, GPA)
VALUES
('John', 'Doe', 'Bachelor of Science', 'Computer Science', 'Mathematics', 2020, 3.75),
('Jane', 'Smith', 'Bachelor of Arts', 'English', 'History', 2019, 3.85),
('Michael', 'Johnson', 'Bachelor of Engineering', 'Mechanical Engineering', NULL, 2021, 3.60),
('Emily', 'Williams', 'Bachelor of Business Administration', 'Marketing', NULL, 2018, 3.90);

INSERT INTO Instructor (FirstName, Surname)
VALUES
('Professor', 'Anderson'),
('Dr.', 'Davis'),
('Ms.', 'Clark');

INSERT INTO PersonalInfo (StudentID, InstructorID, Gender, Address, City, Province, Country, PhoneNum, Email, EmergencyCt)
VALUES
(1, NULL, 'Male', '123 Main St', 'Anytown', 'Anyprovince', 'USA', '555-1234', 'john.doe@example.com', 'John's Emergency Contact'),
(2, NULL, 'Female', '456 Oak St', 'Othercity', 'Otherprovince', 'USA', '555-5678', 'jane.smith@example.com', 'Jane's Emergency Contact'),
(3, NULL, 'Male', '789 Pine St', 'Anothercity', 'Anotherprovince', 'USA', '555-9876', 'michael.johnson@example.com', 'Michael's Emergency Contact'),
(NULL, 1, 'Female', '987 Elm St', 'Somewhere', 'Someprovince', 'USA', '555-4321', 'prof.anderson@example.com', 'Professor Anderson's Emergency Contact'),
(NULL, 2, 'Male', '654 Birch St', 'Nowhere', 'Noprovince', 'USA', '555-8765', 'dr.davis@example.com', 'Dr. Davis's Emergency Contact'),
(NULL, 3, 'Female', '321 Cedar St', 'Anywhere', 'Anyprovince', 'USA', '555-5678', 'ms.clark@example.com', 'Ms. Clark's Emergency Contact');

INSERT INTO Course (InstructorID, CourseCode, CourseName)
VALUES
(1, 'CS101', 'Introduction to Computer Science'),
(2, 'ENG201', 'American Literature'),
(3, 'MECH301', 'Thermodynamics'),
(1, 'CS201', 'Data Structures and Algorithms');



