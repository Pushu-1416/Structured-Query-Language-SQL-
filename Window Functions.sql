use student;
CREATE TABLE EmployeeSalary (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    Experience INT,
    JoiningDate DATE
);

INSERT INTO EmployeeSalary
VALUES
(101,'Rahul','IT',65000,3,'2022-01-15'),
(102,'Anjali','HR',50000,2,'2023-03-10'),
(103,'Vikram','Finance',70000,5,'2020-09-18'),
(104,'Arjun','IT',75000,6,'2019-11-20'),
(105,'Sneha','Marketing',55000,2,'2023-01-05'),
(106,'Meera','HR',52000,3,'2022-07-08'),
(107,'Aakash','IT',65000,4,'2021-06-15'),
(108,'Ravi','Finance',80000,7,'2018-12-12'),
(109,'Priya','Marketing',58000,3,'2022-05-30'),
(110,'Kiran','IT',90000,8,'2017-04-21'),
(111,'Neha','Finance',70000,5,'2020-10-01'),
(112,'Suresh','HR',50000,2,'2023-04-25');

# Display each employee with a row number based on salary.
select *, row_number() over(order by salary desc) from EmployeeSalary; 

# Display row numbers within each department.
select *, row_number() over(partition by Department order by Salary desc) from EmployeeSalary;

# Display employees ordered by joining date with row numbers.
SELECT *, row_number() over(order by JoiningDate) from EmployeeSalary;

#Rank employees based on salary.
select *,rank() over (order by Salary desc) from EmployeeSalary;
# Rank employees within each department.
select *, rank() over (partition by Department order by Salary desc) from EmployeeSalary;
    
#Display dense ranks by salary.
select *, dense_rank() over (order by Salary desc) from EmployeeSalary;

# Find the top 2 salaries without skipping ranks.
select * from(select *, dense_rank() over (order by Salary desc) AS DenseRank from EmployeeSalary) AS RankedEmployees
WHERE DenseRank <= 2;

# Find the third-highest distinct salary
select *
from(select *, dense_rank() over (order by Salary desc) AS DenseRank
    FROM EmployeeSalary
) AS RankedEmployees
WHERE DenseRank = 3;

# Display the next employee's salary.
select *, lead(Salary) over (order by Salary desc) from EmployeeSalary;

# Display the salary difference from the next employee.
select *, lead(Salary) over (order by Salary desc) ,Salary - lead(Salary) over (order by Salary desc) from EmployeeSalary;

# Display the next joining date.
SELECT *,lead(JoiningDate) over (order by JoiningDate) from EmployeeSalary;

# Display the previous employee's salary.
SELECT *, lag(Salary) over (order by Salary DESC)  from EmployeeSalary;

# Display the salary difference from the previous employee.
select *, lag(Salary) over (order by Salary desc) ,Salary - lag(Salary) over (order by Salary desc) from EmployeeSalary;
