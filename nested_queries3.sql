CREATE DATABASE nested_queries3;

USE nested_queries3;

-- Create 'courses' table (no PK)
CREATE TABLE courses (
    course_id INT,
    course_name VARCHAR(50),
    teacher VARCHAR(50)
);

SELECT * FROM courses;

-- Create 'students' table (no PK)
CREATE TABLE students (
    student_id INT,
    name VARCHAR(50),
    age INT,
    course_id INT
);

SELECT * FROM students;

-- Insert into 'courses' table
INSERT INTO courses (course_id, course_name, teacher) VALUES
(101, 'Math', 'Mr. Roy'),
(102, 'Science', 'Ms. Lee'),
(103, 'History', 'Mr. Khan'),
(104, 'Art', 'Ms. Dsouza');  -- course with no students

-- Insert into 'students' table
INSERT INTO students (student_id, name, age, course_id) VALUES
(1, 'Alice', 18, 101),
(2, 'Bob', 19, 102),
(3, 'Charlie', 20, 101),
(4, 'David', 21, 103);

-- Find names of students enrolled in the course taught by “Ms. Lee”
SELECT name FROM students WHERE course_id =(
SELECT course_id FROM courses WHERE teacher = 'Ms.Lee');

-- Find course names where at least one student is enrolled
SELECT course_name FROM Courses WHERE course_id IN (
SELECT course_id FROM students);

-- Find courses that don’t have any students enrolled
SELECT course_name FROM courses WHERE course_id NOT IN (
SELECT course_id FROM students);