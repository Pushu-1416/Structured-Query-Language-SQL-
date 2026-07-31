use student;


CREATE TABLE Emp (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Age INT,
    City VARCHAR(50)
);

INSERT INTO Emp (EmpID, Name, Department, Salary, Age, City) VALUES
(1, 'Amit', 'HR', 35000, 29, 'Delhi'),
(2, 'Sneha', 'Finance', 48000, 32, 'Mumbai'),
(3, 'Ravi', 'IT', 55000, 28, 'Bangalore'),
(4, 'Priya', 'Sales', 40000, 30, 'Chennai'),
(5, 'Karan', 'Finance', 60000, 35, 'Delhi'),
(6, 'Meena', 'HR', 30000, 26, 'Pune'),
(7, 'Suresh', 'IT', 70000, 40, 'Hyderabad'),
(8, 'Divya', 'Sales', 42000, 27, 'Mumbai'),
(9, 'Vikram', 'Finance', 65000, 36, 'Bangalore'),
(10, 'Nisha', 'IT', 72000, 31, 'Delhi'),
(11, 'Rohit', 'HR', 31000, 25, 'Chennai'),
(12, 'Pooja', 'Sales', 38000, 29, 'Pune'),
(13, 'Anil', 'Finance', 58000, 34, 'Hyderabad'),
(14, 'Neha', 'IT', 64000, 33, 'Mumbai'),
(15, 'Rajesh', 'Sales', 45000, 37, 'Delhi'),
(16, 'Komal', 'HR', 33000, 28, 'Bangalore'),
(17, 'Deepak', 'Finance', 52000, 30, 'Chennai'),
(18, 'Swati', 'IT', 76000, 38, 'Pune'),
(19, 'Arjun', 'Sales', 47000, 29, 'Hyderabad'),
(20, 'Lakshmi', 'Finance', 61000, 32, 'Delhi'),
(21, 'Manoj', 'IT', 69000, 36, 'Bangalore'),
(22, 'Sakshi', 'Sales', 39000, 26, 'Mumbai'),
(23, 'Harish', 'HR', 29500, 24, 'Chennai'),
(24, 'Kavita', 'Finance', 57000, 35, 'Hyderabad'),
(25, 'Sunil', 'IT', 73000, 39, 'Delhi'),
(26, 'Ramesh', 'Sales', 46000, 33, 'Pune'),
(27, 'Jyoti', 'Finance', 59000, 31, 'Bangalore'),
(28, 'Ashok', 'IT', 71000, 34, 'Mumbai'),
(29, 'Tanvi', 'Sales', 41000, 27, 'Delhi'),
(30, 'Gaurav', 'HR', 34000, 29, 'Hyderabad');

# Find employees whose salary is greater than the average salary of all employees.
select * from Emp where salary >
(select avg(salary) from Emp);

# Find employees whose age is less than the youngest employee in the HR department.
select * from Emp where age <
(select min(age) from Emp where Department="Hr");

# Find employees living in the same city as Ravi
select * from Emp where city =
(select city from Emp where Name="ravi");

 # Find employees with the same salary as Karan
 select * from Emp where salary = 
 (select salary from Emp where Name="kiran");
 
  # Find employees earning more than Sneha
  select * from Emp where salary >
  (select salary from Emp where name = "sneha");

 # Find employees working in the same department as Nisha
 select * from Emp where Department =
(select Department from Emp where name="nisha");

# Find employees who live in the same cities as Finance department employees
select * from Emp where city in
(select city from Emp where department="finance");

 # Find employees older than any employee in the Sales department
 select * from Emp where age > any
 (select age from Emp where department="sales");
 
 # Find employees earning more than all employees in HR
 select * from Emp WHERE Salary > ALL
 (select Salary from Emp where Department = 'HR');
 
 # Find employees working in a department where at least one employee earns more than 70,000
select * from Emp where Department in 
(select Department from Emp where Salary > 70000);

#Find employees whose salary is greater than the average salary of their department.
SELECT *
FROM Emp e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Emp
    WHERE Department = e.Department
);

#Find employees earning the maximum salary in their department.
SELECT *
FROM Emp e
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Emp
    WHERE Department = e.Department
);

#Find employees earning the minimum salary in their department.
SELECT *
FROM Emp e
WHERE Salary = (
    SELECT MIN(Salary)
    FROM Emp
    WHERE Department = e.Department
);

#Find employees older than the average age of their department.
SELECT *
FROM Emp e
WHERE Age > (
    SELECT AVG(Age)
    FROM Emp
    WHERE Department = e.Department
);

#Find employees who have the same city as at least one of their department colleagues.
SELECT *
FROM Emp e
WHERE EXISTS (
    SELECT 1
    FROM Emp e2
    WHERE e2.Department = e.Department
      AND e2.City = e.City
      AND e2.EmpID <> e.EmpID
);

#Find the city with the maximum number of employe
SELECT City
FROM Emp e
GROUP BY City
HAVING COUNT(*) = (
    SELECT MAX(CityCount)
    FROM (
        SELECT COUNT(*) AS CityCount
        FROM Emp
        GROUP BY City
    ) x
);

#Find employees whose salary equals the second-highest salary in the company.
 SELECT *
FROM Emp
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Emp
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM Emp
    )
);
 #Find employees whose salary equals the third-highest salary in the company.
 SELECT *
FROM Emp
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Emp
    WHERE Salary < (
        SELECT MAX(Salary)
        FROM Emp
        WHERE Salary < (
            SELECT MAX(Salary)
            FROM Emp
        )
    )
);
 #Find employees whose salary is greater than the average salary of employees in Delhi.
 SELECT *
FROM Emp
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Emp
    WHERE City = 'Delhi'
);

 #Find employees who earn more than the average salary of employees who are older than
 SELECT *
FROM Emp
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Emp
    WHERE Age > 30
);

 #Find employees who are younger than the oldest employee in Sales department.
 SELECT *
FROM Emp
WHERE Age < (
    SELECT MAX(Age)
    FROM Emp
    WHERE Department = 'Sales'
);
 Find employees whose salary is greater than the average salary of Finance employees but
less than the maximum salary of IT employees.
SELECT *
FROM Emp
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Emp
    WHERE Department = 'Finance'
)
AND Salary < (
    SELECT MAX(Salary)
    FROM Emp
    WHERE Department = 'IT'
);
#Find employees who belong to the department that has the least number of employees.
SELECT *
FROM Emp
WHERE Department IN (
    SELECT Department
    FROM Emp
    GROUP BY Department
    HAVING COUNT(*) = (
        SELECT MIN(DeptCount)
        FROM (
            SELECT COUNT(*) AS DeptCount
            FROM Emp
            GROUP BY Department
        ) x
    )
); 
#Find employees whose city has more employees than the city of Priya.
SELECT *
FROM Emp
WHERE City IN (
    SELECT City
    FROM Emp
    GROUP BY City
    HAVING COUNT(*) > (
        SELECT COUNT(*)
        FROM Emp
        WHERE City = (
            SELECT City
            FROM Emp
            WHERE Name = 'Priya'
        )
    )
);
#Find employees who belong to the department where the average salary is greater than
#55,000.
SELECT *
FROM Emp
WHERE Department IN (
    SELECT Department
    FROM Emp
    GROUP BY Department
    HAVING AVG(Salary) > 55000
);
#Find employees who earn more than the average salary of all employees but less than the
#maximum salary of their department.
SELECT *
FROM Emp e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Emp
)
AND Salary < (
    SELECT MAX(Salary)
    FROM Emp
    WHERE Department = e.Department
);
#Find employees whose salary is above the company average and age is below the company
#average.
SELECT *
FROM Emp
WHERE Salary > (SELECT AVG(Salary) FROM Emp)
AND Age < (SELECT AVG(Age) FROM Emp);



