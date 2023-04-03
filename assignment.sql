USE University;

SELECT first_name, last_name 
FROM Student;

SELECT instructor_id 
FROM instructor
WHERE tenured = 1;

SELECT student.first_name AS Student_first, student.last_name AS Student_last,
instructor.first_name AS instructor_first, instructor.last_name as instructor_last
FROM student, instructor
WHERE student.advisor_id = instructor.instructor_id;

SELECT ad.instructor_id as Advisor_Id,ad.first_name as Advisor_First_Name,
ad.last_name as advisor_last_name
FROM instructor ad LEFT JOIN student st
on ad.instructor_id=st.advisor_id 
WHERE st.advisor_id is null;


SELECT ad.first_name AS Instructor_First_Name,
ad.last_name AS Instructor_last_name,
sum(cs.num_credits) AS 'the total number of credit hours'
FROM Instructor ad,course cs 
WHERE ad.instructor_id = cs.instructor_id
GROUP BY ad.first_name,ad.last_name;

SELECT course_code, course_name
FROM course
WHERE course_code LIKE ('%3%%');


SELECT cs.course_code as course_code,ad.first_name as Instructor_First_Name,
ad.last_name as Instructor_last_name,
sum(cs.num_credits) AS 'the number of credit hours'
FROM Instructor ad,course cs,student_schedule ss
WHERE ad.instructor_id = cs.instructor_id AND cs.course_id=ss.course_id
AND ss.student_id=1
GROUP BY cs.course_code,ad.first_name,ad.last_name;
