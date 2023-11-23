-- Testing Queries

-- Show TABLES
SHOW TABLES;


-- Show all data from each table
SELECT *
FROM VStudent;

SELECT *
FROM VInstructor;

SELECT *
FROM VCourse;

SELECT *
FROM VPersonalInfo;

SELECT *
FROM VStudentGrades;

-- Show all students and instructors

SELECT
	 StudentID
	,FirstName
	,Surname
FROM VStudent
ORDER BY StudentID;

SELECT
	 InstructorID
	,FirstName
	,Surname
FROM VInstructor
ORDER BY InstructorID;

-- Show info of students and instructors
SELECT
	 s.StudentID
	,s.FirstName
	,s.Surname
	,i.Address
	,i.City
	,i.Province
	,i.Country
FROM VStudent s 
	INNER JOIN VPersonalInfo i 
		ON s.StudentID = i.StudentID
ORDER BY s.StudentID;

SELECT
	 instor.InstructorID
	,instor.FirstName
	,instor.Surname
	,i.Address
	,i.City
	,i.Province
	,i.Country
FROM VInstructor instor 
	INNER JOIN VPersonalInfo i 
		ON instor.InstructorID = i.InstructorID
ORDER BY instor.IntructorID;

-- Check student courses and grades
SELECT
    s.StudentID,
    s.FirstName AS StudentFirstName,
    s.Surname AS StudentSurname,
    c.CourseCode,
    c.CourseName,
    i.FirstName AS InstructorFirstName,
    i.Surname AS InstructorSurname
FROM
    VStudent s
INNER JOIN VEnrollment e ON s.StudentID = e.StudentID
INNER JOIN VCourse c ON e.CourseID = c.CourseID
INNER JOIN VInstructor i ON c.InstructorID = i.InstructorID
ORDER BY
    s.StudentID;


	

-- Find all courses a specific instructor is teaching 
SELECT
    i.FirstName,
    i.Surname,
    c.CourseCode,
    c.CourseName
FROM
    VInstructor i
JOIN VCourse c ON i.InstructorID = c.InstructorID
WHERE
    i.InstructorID = 1;


-- Find a specific students grades
SELECT
    s.FirstName,
    s.Surname,
    c.CourseCode,
    c.CourseName,
    g.MidtermOne,
    g.MidtermTwo,
    g.ProjectPres,
    g.ProjectRpt,
    g.FinalExam,
    g.FinalGrade
FROM
    VStudent s
JOIN VEnrollment e ON s.StudentID = e.StudentID
JOIN VCourse c ON e.CourseID = c.CourseID
LEFT JOIN VStudentGrades g ON s.StudentID = g.StudentID AND c.CourseID = g.CourseID
WHERE
    s.StudentID = 1;

-- Delete to test integrity
DELETE FROM Student WHERE StudentID = ;
