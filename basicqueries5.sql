CREATE DATABASE basicqueries5;

USE basicqueries5;

CREATE TABLE students(
	student_id INT,
    name VARCHAR(50),
    city VARCHAR(50)
);

SELECT * FROM students;

CREATE TABLE results(
	student_id INT,
    subject VARCHAR(30),
    marks INT
);

SELECT * FROM results;

INSERT INTO students VALUES
(1,'Amit','Delhi');

INSERT INTO students VALUES
(2,'Sneha','Mumbai');

INSERT INTO students VALUES
(3,'Ravi','Chennai');

INSERT INTO students VALUES
(4,'Priya','Delhi');

INSERT INTO students VALUES
(5,'Karan','Bangalore');

-- Results
INSERT INTO results VALUES
(1,'Math',78);

INSERT INTO results VALUES
(1,'Science',90);

INSERT INTO results VALUES
(2,'Math',85);

INSERT INTO results VALUES
(2,'Science',75);

INSERT INTO results VALUES
(3,'Math',65);

INSERT INTO results VALUES
(3,'Science',70);

INSERT INTO results VALUES
(4,'Math',95);

INSERT INTO results VALUES
(4,'Science',99);

INSERT INTO results VALUES
(5,'Math',45);

INSERT INTO results VALUES
(5,'Science',50);

-- 1)GROUP BY with HAVING
-- GET students whose average marks are more than 80
SELECT student_id,AVG(marks) AS avg_marks
FROM results
GROUP BY student_id
HAVING AVG (marks)>80;

-- 2) EXISTS
-- List students who have marks in at least one subject
SELECT name 
FROM students 5
WHERE EXISTS(
	SELECT 1 FROM results r
    WHERE r.student_id = s.student_id
);

-- 3)ANY
-- Find students who scored more than any of the marks scored by student ID 5,
SELECT * FROM results
WHERE marks > ANY(
	SELECT marks from results WHERE student_id = 5
);

-- 4) Find students who scored more than all of the marks scored by student ID 3
SELECT * FROM results
WHERE marks > ALL(
	SELECT Marks FROM results WHERE student_id = 3
);