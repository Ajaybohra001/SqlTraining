Create Database SqlAssignment2;

use SqlAssignment2;

Create Table tbl_students(StudentID int Primary Key, FirstName varchar(50),LastName varchar(50));

Create Table tbl_courses(CourseID int Primary Key, CourseName varchar(50), DepartmentID int );

Create Table tbl_departments(DepartmentID int Primary Key, DepartmentName varchar(50));

Create Table tbl_enrollments (EnrollmentID int Primary Key, StudentID int Foreign Key references tbl_students(StudentID), CourseID int Foreign Key references tbl_courses(CourseID),EnrollmentDate date);

Insert Into tbl_courses Values(501,'MCA',1001) ;
Insert Into tbl_courses Values(502,'Btech',1002) ;
Insert Into tbl_courses Values(503,'Bsc',1003) ;
Insert Into tbl_courses Values(504,'Msc',1004) ;
Select * from tbl_courses ;
Select * from tbl_students ;
Select * from tbl_departments ;
Select * from tbl_enrollments ;

Insert Into tbl_enrollments Values(101,1,501,'2023-04-05');
Insert Into tbl_enrollments Values(102,2,502,'2023-04-06');
Insert Into tbl_enrollments Values(103,3,503,'2023-04-07');
Insert Into tbl_enrollments Values(104,4,504,'2023-04-08');




Alter Table tbl_courses ADD Foreign key (DepartmentID) references tbl_departments(DepartmentID);



--Question 1:Retrieve the full names of students who are enrolled in more than one course in the "Computer
----Science" department.

Select FirstName,LastName from tbl_students s Inner Join tbl_enrollments e On s.StudentID =e.StudentID 
Inner Join tbl_courses c on e.CourseID =c.CourseID 
Inner Join tbl_departments d on c.DepartmentID =d.DepartmentID
Where d.DepartmentName ='Cs'
group  by s.StudentID ,s.FirstName ,s.LastName  Having Count(Distinct e.CourseId)>0;

--Question 2: List the names of courses that have at least one student enrolled but have not yet started.
SELECT c.CourseName
FROM tbl_courses  c
LEFT JOIN tbl_enrollments  e ON c.CourseID = e.CourseID
WHERE e.EnrollmentDate IS NULL;

--Question 3:Find the students who are enrolled in courses from more than one department.

SELECT s.FirstName, s.LastName
FROM tbl_students  s
INNER JOIN tbl_enrollments  e ON s.StudentID = e.StudentID
INNER JOIN tbl_courses  c ON e.CourseID = c.CourseID
GROUP BY s.FirstName, s.LastName
HAVING COUNT(DISTINCT c.DepartmentID) > 0;

--Question 4:Retrieve the names of students who are enrolled in all courses offered by the "DotNet"
--department.
Select firstName,LastName from tbl_students  s Inner Join tbl_enrollments  e
On s.StudentID =e.StudentID 
Inner Join tbl_courses  c On c.CourseID  = e.CourseID 
Inner Join tbl_departments d on d.DepartmentID =c.DepartmentID 
where d.DepartmentName ='DotNet'

group by firstName,LastName 

--Question 5:Calculate the total number of students enrolled in each department for each course.


SELECT d.DepartmentName, c.CourseName, COUNT(DISTINCT s.StudentID) AS TotalStudents
FROM tbl_departments d
INNER JOIN tbl_courses c ON d.DepartmentID = c.DepartmentID
INNER JOIN tbl_enrollments  e ON c.CourseID = e.CourseID
INNER JOIN tbl_students s ON e.StudentID = s.StudentID
GROUP BY d.DepartmentName, c.CourseName;

--Question 6:List the students who have the same first name as the department they are enrolled in.
SELECT s.FirstName, s.LastName
FROM tbl_students s
INNER JOIN tbl_enrollments  e ON s.StudentID = e.StudentID
INNER JOIN tbl_courses c ON e.CourseID = c.CourseID
INNER JOIN tbl_departments d ON c.DepartmentID = d.DepartmentID
WHERE s.FirstName = d.DepartmentName;

--Question 7:Find the department with the highest average number of students enrolled per course.
SELECT TOP 1 d.DepartmentName  , AVG(Student_count) AS Avg_Students_Per_Course
FROM (
    SELECT c.DepartmentID , COUNT(e.CourseID) AS Student_count
    FROM tbl_enrollments  AS e
    INNER JOIN tbl_courses  AS c ON e.CourseID = c.courseID
    GROUP BY c.DepartmentID , e.CourseID
) AS subquery
INNER JOIN tbl_departments  AS d ON d.DepartmentID  = subquery.DepartmentID 
GROUP BY d.DepartmentName 
ORDER BY Avg_Students_Per_Course DESC

--Question 8:Retrieve the students who have not enrolled in any courses offered by the "Science" department.

SELECT s.FirstName, s.LastName
FROM tbl_students  s
WHERE s.StudentID
NOT IN 
(SELECT e.StudentID FROM tbl_enrollments  e 
INNER JOIN tbl_courses c ON e.CourseID = c.CourseID 
INNER JOIN tbl_departments d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'CS');

--Question 9:

SELECT  top 1 d.DepartmentName, c.CourseName, MAX(e.EnrollmentDate) AS MostRecentEnrollmentDate
FROM tbl_departments d
INNER JOIN tbl_courses c ON d.DepartmentID = c.DepartmentID
INNER JOIN tbl_enrollments  e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName, c.CourseName;

--Questsion 10:Calculate the total number of students in the "Engineering" department who have enrolled in
--more courses than the average number of courses per student in that department.

SELECT  d.DepartmentName , AVG(Student_count) AS Avg_Students_Per_Course
FROM (
    SELECT c.DepartmentID, COUNT(e.CourseID) AS Student_count
    FROM tbl_Enrollments AS e
    INNER JOIN tbl_Courses AS c ON e.CourseID = c.CourseID 
    GROUP BY c.DepartmentID, e.CourseID
) AS subquery
INNER JOIN tbl_Departments AS d ON d.DepartmentID = subquery.DepartmentID
where d.DepartmentName ='Dotnet'
GROUP BY d.DepartmentName ,d.DepartmentID 
ORDER BY Avg_Students_Per_Course DESC
