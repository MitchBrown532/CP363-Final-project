-- Instructor Table DDL

USE SchoolDB;

IF OBJECT_ID (N'Instructor', N'U') IS NOT NULL
DROP TABLE Instructor;

CREATE TABLE Instructor (
	InstructorID Integer NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	FirstName Varchar(40) NOT NULL,
	Surname Varchar(40) NOT NULL,
);

ALTER TABLE Instructor
ADD COLUMN Instructor_Info_ID Integer NOT NULL UNIQUE,
ADD CONSTRAINT Student_Info
FOREIGN KEY (Instructor_Info_ID)
REFERENCES PersonalInfo(InfoID);

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