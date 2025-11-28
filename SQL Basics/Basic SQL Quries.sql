SELECT * 
FROM students;

SELECT full_name, course
FROM students;

SELECT DISTINCT course
FROM students;

SELECT full_name AS "Full Name"
FROM students;

SELECT CONCAT(full_name, ' - ', course) AS Student_Details
FROM students;
