-- 1. List students older than 22.
SELECT *
FROM students
WHERE age > 22;


-- 2. List courses in the "Veritabanı" category.
SELECT *
FROM courses
WHERE category = 'Veritabanı';


-- 3. List students whose first name starts with "A".
SELECT *
FROM students
WHERE first_name LIKE 'A%';


-- 4. List courses containing "SQL" in the course name.
SELECT *
FROM courses
WHERE course_name LIKE '%SQL%';


-- 5. List students aged between 22 and 24.
SELECT *
FROM students
WHERE age BETWEEN 22 AND 24;


-- 6. List students who are enrolled in at least one course.
SELECT DISTINCT s.first_name, s.last_name
FROM students AS s
JOIN enrollments AS e
    ON s.student_id = e.student_id
ORDER BY s.student_id;


-- 7. Find the number of students enrolled in each
-- course in the "Veritabanı" category.
SELECT c.course_name,
       COUNT(e.student_id) AS student_count
FROM courses AS c
JOIN enrollments AS e
    ON c.course_id = e.course_id
WHERE c.category = 'Veritabanı'
GROUP BY c.course_id, c.course_name
ORDER BY c.course_id;


-- 8. List each course and the name of its instructor.
SELECT c.course_name,
       a.name AS instructor_name
FROM courses AS c
JOIN course_instructors AS i
    ON c.course_id = i.course_id
JOIN instructors AS a
    ON a.instructor_id = i.instructor_id
ORDER BY c.course_id;


-- 9. List students who are not enrolled in any course.
SELECT *
FROM students AS s
LEFT JOIN enrollments AS e
    ON s.student_id = e.student_id
WHERE e.student_id IS NULL;


-- 10. Calculate the average age of students for each course.
SELECT c.course_name,
       AVG(s.age) AS avg_age
FROM students AS s
JOIN enrollments AS e
    ON s.student_id = e.student_id
JOIN courses AS c
    ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY c.course_name ASC;
