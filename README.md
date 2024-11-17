# SQL
Learning of MYSQL (Basic to Advance with Project)

My learning of Mysql and brush-up the skills from basic to advance

#Day 1 of Learning Conclusion -- 
-- Creation of DATABASE, TABLE, MAPPING ALL KEYS PROPERLY. 

#Day 2 of Learning Conclusion --
--- 
Explanation: 
This query joins the Student, StudentGrade, and Course tables to retrieve information about students who are enrolled in a specific course in this case “Advance DBMS” and have grade less than or equals to grade - 3.0. I have used here inner join which means it will return only the rows where there is a match in both tables being joined and Using Order By for Grades will give us the Desc to ASC order. Hence, it selects the student's ID, first name, last name, the course ID, course description, and their grade in the course.
For whom: 
This query is important for instructors and administrators who want to monitor the performance of students in a specific course and identify who has equals to or below 3.0 GPA. It helps them track the progress of students taking for a particular course, allowing them to provide necessary support or adjustments if needed.

Query 2:
Explanation:
This query uses a left join to combine the Course table with the StudentGrade table to determine which courses have no students enrolled or students less than 5. It returns all records from the left table (in our case, Course), and the matched records from the right table (StudentGrade). The result is NULL from the right side if there is no match. For this case we need to use COALESCE Which makes null to 0 and will filters for courses with no enrolled students (EnrolledStudents count is NULL or 0) or we check if it’s is less than 5. Hence, it will give the result of the CourseID , Course Description and Enrolled Student total Count. 
For whom: This query is important for course administrators and schedulers who need to identify courses that have low or no enrollment. It allows them to make informed decisions about course offerings and resource allocation. 
These SQL queries provide valuable insights into student performance, course enrollment, and faculty involvement, making them essential tools for different stakeholders within an educational institution.





