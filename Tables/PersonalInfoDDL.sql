-- PersonalInfo Table DDL

USE SchoolDB;

IF OBJECT_ID (N'PersonalInfo', N'U') IS NOT NULL
DROP TABLE PersonalInfo;

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
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
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