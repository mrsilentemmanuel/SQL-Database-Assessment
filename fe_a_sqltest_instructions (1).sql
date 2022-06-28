
/*

Microsoft SQL Evaluation Assignment


1.	Data exists in the below tables as follows:

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


2.	Create and populate the tables with relevant data as per the provided script in a blank database


3.	Write a stored procedure No3_CourseAverages that calculates & selects the average results for all courses ordered from highest to lowest. 
	Result should include Course Name, Course Average

4.	Write a stored procedure No4_StudentResults that calculates & selects the subjects and the result % per course for that student as well as a “Pass” or “Fail” in a “Promotion” column for each subject should the result be over 50%. 
	The stored procedure should accept the student_id as an input. 
	Result should include Student Name, Course Name, Result, Promotion

5.	Write a stored procedure No5_CourseStudents_Above75 to select a list of students  that are achieving above 75% in a course. Include the name of the campus that the student attends.
	The stored procedure should accept the course_id as an input
	Result should include Course Name, Student First & Last Name, Campus Name

6.	Write a scalar function No6_StudentInfo that will produce a student’s first & last name, student id in brackets and their campus name.
	The function should accept a student_id as an input
	Result should look something like this:   James Bond (12) - City Campus

7.  Backup and submit your database backup file.


*/