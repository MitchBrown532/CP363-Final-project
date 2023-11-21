-- Students
INSERT INTO Student (FirstName, Surname, Degree, Major, Minor, AdmissionYr, GPA)
VALUES
('John', 'Doe', 'Bachelor of Science', 'Computer Science', 'Mathematics', 2020, 3.75),
('Jane', 'Smith', 'Bachelor of Arts', 'English', 'History', 2019, 3.85),
('Michael', 'Johnson', 'Bachelor of Engineering', 'Mechanical Engineering', NULL, 2021, 3.60);

-- Instructors
INSERT INTO Instructor (FirstName, Surname)
VALUES
('Professor', 'Anderson'),
('Dr.', 'Davis'),
('Ms.', 'Clark');

-- Info for all students & instructors
INSERT INTO PersonalInfo (StudentID, InstructorID, Gender, Address, City, Province, Country, PhoneNum, Email, EmergencyCt)
VALUES
(1, NULL, 'Male', '123 Main St', 'Anytown', 'Anyprovince', 'USA', '555-1234', 'john.doe@example.com', 'John's Emergency Contact'),
(2, NULL, 'Female', '456 Oak St', 'Othercity', 'Otherprovince', 'USA', '555-5678', 'jane.smith@example.com', 'Jane's Emergency Contact'),
(3, NULL, 'Male', '789 Pine St', 'Anothercity', 'Anotherprovince', 'USA', '555-9876', 'michael.johnson@example.com', 'Michael's Emergency Contact'),
(NULL, 1, 'Female', '987 Elm St', 'Somewhere', 'Someprovince', 'USA', '555-4321', 'prof.anderson@example.com', 'Professor Anderson's Emergency Contact'),
(NULL, 2, 'Male', '654 Birch St', 'Nowhere', 'Noprovince', 'USA', '555-8765', 'dr.davis@example.com', 'Dr. Davis's Emergency Contact'),
(NULL, 3, 'Female', '321 Cedar St', 'Anywhere', 'Anyprovince', 'USA', '555-5678', 'ms.clark@example.com', 'Ms. Clark's Emergency Contact');

-- Courses 
INSERT INTO Course (InstructorID, CourseCode, CourseName)
VALUES
(1, 'CS101', 'Introduction to Computer Science'),
(2, 'ENG201', 'American Literature'),
(3, 'MECH301', 'Thermodynamics'),
(1, 'CS201', 'Data Structures and Algorithms');

-- Enrollment info for each student
INSERT INTO Enrollment (StudentID, CourseID)
VALUES
(1, 1),
(1, 4),
(2, 2),
(2, 3),
(3, 3),
(3, 1);

-- Grades for each course each student is enrolled in
INSERT INTO StudentGrades (StudentID, CourseID, MidtermOne, MidtermTwo, ProjectPres, ProjectRpt, FinalExam, FinalGrade)
VALUES
(1, 1, 85.5, 90.0, 92.5, 88.0, 95.0, 91.2),
(1, 4, 88.0, 91.5, 89.0, 87.5, 94.0, 90.5),
(2, 2, 78.0, 82.5, 85.0, 80.5, 88.0, 82.8),
(2, 3, 70.0, 84.5, 86.0, 80.5, 88.0, 82.8),
(3, 3, 92.0, 88.5, 91.5, 90.0, 93.0, 91.8),
(3, 1, 87.5, 90.0, 88.0, 86.5, 92.5, 89.8);