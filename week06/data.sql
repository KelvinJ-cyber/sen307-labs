use sen307_202412727;

INSERT INTO Department (dept_name) VALUES
 ('Software Engineering'), ('Computer Science'),
 ('Artificial Intelligence'), ('Data Science'),
 ('Cybersecurity');
 
 INSERT INTO Course (course_code, course_title, credit_units, description, dept_id)
 VALUES ('SEN307', 'Database Systems', 3, 'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
 ('SEN301', 'Software Architecture', 3, 'Architectural styles, design patterns, microservices and how to structure large software systems.', (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
 ('COS301', 'Operating Systems', 3,'Processes, threads, CPU scheduling, memory management and file systems.', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
 ('COS305', 'Computer Networks', 3, 'TCP/IP, routing, switching, LAN and WAN design and network protocols.', (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')), 
 ('AIN301', 'Introduction to Artificial Intelligence', 3, 'Intelligent agents, search algorithms, knowledge representation and reasoning.', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')), 
 ('AIN305', 'Machine Learning', 3, 'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
 ('AIN307', 'Natural Language Processing', 3, 'Text processing, word embeddings, language models, sentiment analysis and chatbots.', (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
 ('DTS301', 'Data Visualization and Analytics', 2, 'Exploratory data analysis, charts, dashboards and telling stories with data.', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')), 
 ('DTS305', 'Big Data Technologies', 3, 'Distributed storage and processing of very large datasets with Hadoop and Spark.', (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
 ('CYB301', 'Network Security', 3, 'Firewalls, cryptography, intrusion detection and protecting networks from attacks.', (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));
 
 
 SELECT d.dept_name, COUNT(c.course_id) AS courses FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id GROUP BY d.dept_name;
 
 SELECT dept_id, dept_name FROM Department;
 SELECT course_id, course_code FROM Course;
 
 INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor',       'a.okafor@vua.edu.ng',    1),
('VUA/ST/102', 'Dr Musa Bello',         'm.bello@vua.edu.ng',     1),
('VUA/ST/103', 'Prof Ngozi Eze',        'n.eze@vua.edu.ng',       2),
('VUA/ST/104', 'Dr Tunde Adeyemi',      't.adeyemi@vua.edu.ng',   2),
('VUA/ST/105', 'Dr Fatima Abdullahi',   'f.abdullahi@vua.edu.ng', 3),
('VUA/ST/106', 'Mr Chinedu Nwosu',      'c.nwosu@vua.edu.ng',     3),
('VUA/ST/107', 'Dr Ibrahim Yusuf',      'i.yusuf@vua.edu.ng',     4),
('VUA/ST/108', 'Mrs Blessing Udoh',     'b.udoh@vua.edu.ng',      4),
('VUA/ST/109', 'Dr Emeka Okonkwo',      'e.okonkwo@vua.edu.ng',   5),
('VUA/ST/110', 'Dr Hauwa Garba',        'h.garba@vua.edu.ng',     5);

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
-- Dept 1
('20231234', 'Kelvin Justine',       'M', '2005-01-15', 1), 
('20231235', 'Ada Obi',              'F', '2005-03-14', 1),
('20231236', 'Samuel Adebayo',       'M', '2004-07-22', 1),
('20231237', 'Zainab Lawal',         'F', '2005-09-30', 1),
-- Dept 2
('20231238', 'John Musa',            'M', '2004-11-02', 2),
('20231239', 'Chiamaka Okeke',       'F', '2005-02-18', 2),
('20231240', 'Abubakar Sani',        'M', '2004-05-09', 2),
('20231241', 'Folake Ogunleye',      'F', '2005-06-25', 2),
-- Dept 3
('20231242', 'Emmanuel Ikenna',      'M', '2004-12-12', 3),
('20231243', 'Aisha Mohammed',       'F', '2005-04-03', 3),
('20231244', 'Oluwaseun Balogun',    'M', '2004-08-17', 3),
('20231245', 'Ngozi Anyanwu',        'F', '2005-10-21', 3),
-- Dept 4
('20231246', 'Daniel Ekong',         'M', '2004-03-28', 4),
('20231247', 'Halima Danjuma',       'F', '2005-01-07', 4),
('20231248', 'Chukwuemeka Nnamdi',   'M', '2004-09-14', 4),
('20231249', 'Titilayo Adewale',     'F', '2005-07-19', 4),
-- Dept 5
('20231250', 'Ibrahim Waziri',       'M', '2004-06-01', 5),
('20231251', 'Grace Effiong',        'F', '2005-05-11', 5),
('20231252', 'Victor Okoro',         'M', '2004-10-26', 5),
('20231253', 'Maryam Aliyu',         'F', '2005-08-08', 5);

INSERT INTO Enrolment (student_id, course_id) VALUES
-- Course 1 (8 students, for the HAVING lab)
(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),
-- Course 2
(1,2),(2,2),(9,2),(10,2),(11,2),
-- Course 3
(1,3),(3,3),(9,3),(13,3),(14,3),
-- Course 4
(2,4),(4,4),(10,4),(13,4),(15,4),
-- Course 5
(3,5),(7,5),(11,5),(14,5),(16,5),
-- Course 6
(4,6),(8,6),(12,6),(15,6),(17,6),
-- Course 7
(5,7),(12,7),(16,7),(17,7),(18,7),
-- Course 8
(6,8),(18,8);


INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1,1),(1,2),   -- course 1 has two lecturers
(2,3),
(3,4),
(4,5),
(5,6),
(6,7),
(7,8),(7,10),  -- course 7 also has two lecturers
(8,9);

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1,1),(1,2),   -- course 1 has two lecturers
(2,3),
(3,4),
(4,5),
(5,6),
(6,7),
(7,8),(7,10),  -- course 7 also has two lecturers
(8,9);


-- Step 1: Create a department with a student in it

INSERT INTO Department (dept_name) VALUES
 ('Library and Information Science'); 
 INSERT INTO Student (matric_no, full_name, dept_id) VALUES
 ('20239999', 'Transfer Student', (SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));
 
 -- Step 2: Try to delete the department
 DELETE FROM Department WHERE dept_name = 'Library and Information Science';
 
 -- Step 1: reassign the dependent student to another department
 UPDATE Student SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering') WHERE matric_no = '20239999';
 -- Step 2: now the delete succeeds
 DELETE FROM Department WHERE dept_name = 'Library and Information Science'; SELECT * FROM Department;
 
 
 SELECT 'Departments' AS tbl,
 COUNT(*) AS total FROM Department
 UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer 
 UNION ALL SELECT 'Students', COUNT(*) FROM Student
 UNION ALL SELECT 'Courses', COUNT(*) FROM Course 
 UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment 
 UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;
 