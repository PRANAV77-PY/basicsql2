CREATE DATABASE Basic_Queries6;

USE Basic_Queries6;

CREATE TABLE Employee(
	Employee_ID INT,
    Salary INT,
    Name VARCHAR(255),
    Department VARCHAR(255),
    Job_Position VARCHAR(255)
);

SELECT * FROM Employee;

INSERT INTO Employee( Employee_ID,Salary,Name,Department,Job_Position) VALUES
( 1,10000,'Jack','Account','Accountant'),
( 2,25000,'Peter','Manufacturing','Engineer'),
( 3,35000,'Henry','Software','Sofware Engineer'),
( 4,40000,'Wilson','HR','HR Recuriter'),
( 5,60000,'Maxwell','Design','Design Engineer');

-- GROUP BY HAVING
SELECT Employee_ID, AVG(Salary) AS AVG_Salary
FROM Employee
GROUP BY Employee_ID
HAVING AVG (Salary) > 20000;

-- COUNT,AVG,SUM ON SAlary
SELECT 
COUNT(*) AS TOTAL_Salary,
AVG (Salary) AS AVG_Salary,
SUM(Salary) AS Total_SUM
FROM Employee;

-- Find Employee
SELECT * FROM Employee
WHERE Name LIKE 'J%';



    
    