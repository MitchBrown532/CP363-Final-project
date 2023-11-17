-- Course Table DDL
USE SchoolDB;

IF OBJECT_ID (N'Course', N'U') IS NOT NULL
DROP TABLE Course;

CREATE TABLE Course (
	CourseID Integer NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	InstructorID INT,
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