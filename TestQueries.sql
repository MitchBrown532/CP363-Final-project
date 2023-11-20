-- Testing Queries

-- Show TABLES
SHOW TABLES;


-- Show all data from each table
SELECT *
FROM VStudent

SELECT *
FROM VInstructor

SELECT *
FROM VCourse

SELECT *
FROM VPersonalInfo

SELECT *
FROM VStudentGrades

-- Show info about students and instructor

SELECT
	 StudentID
	,FirstName
	,Surname
FROM VStudent
ORDER BY StudentID

SELECT
	 InstructorID
	,FirstName
	,Surname
FROM VInstructor
ORDER BY InstructorID

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
ORDER BY s.StudentID

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
ORDER BY instor.IntructorID

-- Check student courses and grades
SELECT
	 s.StudentID
	,s.FirstName
	,s.Surname
	,c.CourseCode
	,c.CourseName
	,i.FirstName
	,i.Surname
FROM VStudent s 
	INNER JOIN VCourseEnrollment e 
		ON s.StudentID = e.StudentID
	INNER JOIN VCourse c 
		ON e.CourseID = c.CourseID 
	INNER JOIN VInstructor i 
		ON c.InstructorID = i.InstructorID

	

-- Add table for student enrollment since instructorID would be duplciated
