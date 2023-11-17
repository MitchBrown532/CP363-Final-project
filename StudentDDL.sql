-- Student Table DDL

USE SchoolDB;

IF OBJECT_ID (N'Student', N'U') IS NOT NULL
DROP TABLE Student;

CREATE TABLE Student (
	StudentID Integer NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	FirstName Varchar(40) NOT NULL,
	Surname Varchar(40) NOT NULL,
	Degree Varchar(40) NOT NULL,
	Major Varchar(40) NOT NULL,
	Minor Varchar(40),
	AdmissionYr Date NOT NULL,
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
FROM Student;