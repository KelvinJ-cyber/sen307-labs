-- ============================================
 -- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
 -- Name:Justine Kelvin Obi Matric: VUG/SEN/24/12727
 -- ============================================
 
 USE sen307_202412727;
 
 -- Task 1: Students in one department, sorted A-Z
 
SELECT
    s.student_id,
    s.full_name,
    d.dept_name
FROM Student s
INNER JOIN Department d
    ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;

-- Explanation: Uses INNER JOIN to connect Student and Department through dept_id.
--              WHERE filters students by department, while ORDER BY ASC sorts their names alphabetically.

-- Task 2: Courses with their lecturers (INNER JOIN)

SELECT
    c.course_id,
    c.course_title,
    l.lecturer_id,
    l.full_name AS lecturer_name
FROM Course c
INNER JOIN CourseAllocation ca
    ON c.course_id = ca.course_id
INNER JOIN Lecturer l
    ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_title ASC;

-- Explanation: Uses two INNER JOIN operations to connect Course, CourseAllocation, and Lecturer.
-- 				It displays each course alongside its assigned lecturer. Courses with multiple lecturers appear multiple times

-- Task 3: Students and their courses (LEFT JOIN)
SELECT
    s.student_id,
    s.full_name,
    c.course_title
FROM Student s
LEFT JOIN Enrolment e
    ON s.student_id = e.student_id
LEFT JOIN Course c
    ON e.course_id = c.course_id
WHERE c.course_title IS NULL;

 -- Explanation: Uses LEFT JOIN to display all students, including those without enrolments.
 -- 			 Students without courses display NULL. Adding WHERE c.course_title IS NULL shows only students without courses.
 
 -- Task 4: Filtering with AND / OR / IN / BETWEEN 
 
SELECT s.student_id, s.full_name, s.gender, s.date_of_birth
FROM Student s
WHERE s.gender = 'F'
AND s.dept_id IN (1, 3)
AND s.date_of_birth BETWEEN '2004-01-01' AND '2005-12-31';
 
 -- Explanation:Uses filtering operators to retrieve students who satisfy specific conditions.
 --  			AND requires all conditions to be true, OR allows alternatives, IN checks multiple values, and BETWEEN checks a range.
 
 -- Task 5: Paginating enrolments with LIMIT and OFFSET
 -- TASK 5: Page 1
SELECT *
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 0;


-- TASK 5: Page 2
SELECT *
FROM Enrolment
ORDER BY enrolment_id ASC
LIMIT 10 OFFSET 10;
 -- Explanation: Uses LIMIT to control the number of records displayed and OFFSET to skip records.
 -- 			 ORDER BY ensures records appear in a consistent order across pages.
 