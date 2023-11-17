IF OBJECT_ID (N'StudentGrades', N'U') IS NOT NULL
DROP TABLE StudentGrades;

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