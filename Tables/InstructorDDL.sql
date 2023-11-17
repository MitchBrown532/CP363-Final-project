-- Instructor Table DDL

USE SchoolDB;

IF OBJECT_ID (N'Instructor', N'U') IS NOT NULL
DROP TABLE Instructor;

CREATE TABLE Instructor (
	InstructorID Integer NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	FirstName Varchar(40) NOT NULL,
	Surname Varchar(40) NOT NULL,
);

CREATE OR REPLACE VIEW VInstructor 
(
	 InstructorID
	,FirstName
	,Surname
) AS
SELECT
	 InstructorID
	,FirstName
	,Surname
FROM Instructor;