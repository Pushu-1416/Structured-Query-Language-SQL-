#Display all employees whose salary is greater than 60,000.
#Display employees who belong to the IT department.
#Display employees whose age is less than 30.
#Display employees who are from Hyderabad and order them by salary in ascending order.
#Display all employees and sort them by salary in descending order.
#Display employees whose salary is between 50,000 and 80,000, ordered by age.
#Display employees whose department is HR, ordered by name alphabetically.
#Display employees who joined after '2021-01-01', ordered by joining date (latest first).
#Display employees whose city is Chennai or Bangalore, ordered by city and then salary descending.
#Display employees whose age is greater than 25, ordered by department (A–Z) and then salary (highest to lowest).




use student;
CREATE TABLE Employees_info(
EmpID INT PRIMARY KEY,
Name VARCHAR(50),
Department VARCHAR(30),
Salary DECIMAL(10,2),
Age INT,
City VARCHAR(30),
JoiningDate DATE
);


INSERT INTO Employees_info VALUES
(101, 'Alice', 'HR', 45000, 25, 'Hyderabad', '2022-01-10'),
(102, 'Bob', 'IT', 70000, 30, 'Chennai', '2021-06-15'),
(103, 'Charlie', 'Finance', 55000, 28, 'Bangalore', '2020-08-20'),
(104, 'David', 'IT', 80000, 35, 'Hyderabad', '2019-03-12'),
(105, 'Eva', 'HR', 48000, 27, 'Mumbai', '2023-02-18'),
(106, 'Frank', 'Sales', 60000, 31, 'Delhi', '2021-11-25'),
(107, 'Grace', 'Finance', 75000, 29, 'Chennai', '2018-09-10'),
(108, 'Henry', 'Sales', 52000, 26, 'Bangalore', '2022-07-05'),
(109, 'Ivy', 'IT', 90000, 32, 'Mumbai', '2017-05-30'),
(110, 'Jack', 'HR', 47000, 24, 'Delhi', '2023-01-12');

#select * from employees_info where salary>60000;
#select * from employees_info where department='IT';
#select * from employees_info where age < 30;
#select * from employees_info where city='hyderabad' order by salary;
#select * from employees_info order by salary desc;
#select * from employees_info where salary > 50000 and salary < 80000 order by age;
#select * from employees_info where department = 'HR' order by name;
#select * from employees_info where joiningDate > '2021-01-01' order by joiningDate desc;
#select * from employees_info where city='chennai' or city='banglore' order by city,salary desc;
select * from employees_info where age>25 order by department,salary desc;