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
    AdmissionYr YEAR NOT NULL,
    GPA Decimal(4,2) NOT NULL
);

ALTER TABLE Student
ADD COLUMN Student_Info_ID Integer NOT NULL UNIQUE,
ADD CONSTRAINT Student_Info
FOREIGN KEY (Student_Info_ID)
REFERENCES PersonalInfo(InfoID) ON DELETE CASCADE;


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