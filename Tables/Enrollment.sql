IF OBJECT_ID (N'Enrollment', N'U') IS NOT NULL
DROP TABLE Enrollment;

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