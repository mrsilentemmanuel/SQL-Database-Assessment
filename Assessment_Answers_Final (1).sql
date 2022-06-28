/*
Microsoft SQL Evaluation Assignment
*/


/*
1. Data exists in the below tables as follows:

Student
student_id int (with identity & primary key)
first_name varchar(50) not null
last_name varchar(50) not null
campus_id int (fk campus.campus_id)

Course
course_id int
course_code varchar(10)
course_name varchar(50)

Campus
campus_id int (with identity & primary key)
campus_name varchar(150)
address varchar(max)

Student_Results
student_result_id int (with identity & primary key)
student_id (fk student.student_id)
course_id int (fk course.course_id)
result float
*/

/*
2. Create and populate the tables with relevant data as per the provided script in a blank database
*/

/*
3. Write a stored procedure No3_CourseAverages that calculates & selects the average results for all courses ordered from highest to lowest.
Result should include Course Name, Course Average
*/

create PROCEDURE No3_CourseAverages as
select c.course_name, round(avg(r.result),2) avg_Result
  from dbo.Course c,  
       dbo.Student_Results r
 where r.course_id =  c.course_id
 group by c.course_name
 order by avg(r.result) desc 
GO

 
/*
4. Write a stored procedure No4_StudentResults that calculates & selects the subjects and the result % per course for that student as well as a “Pass” or “Fail” in a “Promotion” column for each subject should the result be over 50%.
The stored procedure should accept the student_id as an input.
Result should include Student Name, Course Name, Result, Promotion
*/

CREATE PROCEDURE No4_StudentResults AS
select s.first_name + ' ' + s.last_name studen_name, c.course_name, sr.result, case when sr.result > 50 then 'Pass' else 'Fail' end as Promotion
  from dbo.student s, dbo.student_results sr, dbo.course c
 where s.student_id = sr.student_id
   and c.course_id = sr.course_id
GO

/* 5. Write a stored procedure No5_CourseStudents_Above75 to 
select a list of students that are achieving above 75% in a course. 
Include the name of the campus that the student attends.
The stored procedure should accept the course_id as an input-----
Result should include Course Name, Student First & Last Name, Campus Name
*/

CREATE PROCEDURE No5_CourseStudents_Above75(@course_id INT) AS
SELECT first_name + ' ' + last_name as name , course_name, campus_name, result
FROM dbo.Campus
INNER JOIN dbo.Student
ON dbo.Campus.campus_id = dbo.Student.campus_id
INNER JOIN dbo.Student_Results
on dbo.Student_Results.student_id = dbo.Student.student_id
INNER join dbo.Course
on dbo.Course.course_id = dbo.Student_Results.course_id
where result > 75
  and dbo.Course.course_id = @course_id 
GO



/* 6. Write a scalar function No6_StudentInfo that will produce a student’s first & last name, 
student id in brackets and their campus name.
The function should accept a student_id as an input
Result should look something like this: James Bond (12) - City Campus*/


CREATE FUNCTION No6_StudentInfo(@student_id INT)
	RETURNS varchar(50) AS 
BEGIN
	RETURN (SELECT first_name + ' ' + last_name + ' ('+ (convert(varchar(50), @student_id)) +') '  + '-' + ' ' + campus_name AS FullName 
			  FROM dbo.Student inner join dbo.Campus
				on dbo.Student.campus_id = dbo.Campus.campus_id
			 WHERE Student.student_id = @student_id)
END

SELECT dbo.No6_StudentInfo(8) No6_StudentInfo;


/*
7. Backup and submit your database backup file.
*/

master-2022627-22-37-16.bakBACKUP DATABASE [master] TO  DISK = N'/var/opt/mssql/data/master-2022627-23-7-52.bak' WITH NOFORMAT, NOINIT,  NAME = N'master-Full-2022-06-27T21:07:52', NOSKIP, REWIND, NOUNLOAD, COMPRESSION,  STATS = 10
