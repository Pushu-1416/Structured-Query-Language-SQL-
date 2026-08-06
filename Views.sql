use student;
CREATE TABLE Employe (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    City VARCHAR(30),
    JoiningDate DATE
);

INSERT INTO Employe VALUES
(101,'Rahul','IT',65000,'Hyderabad','2022-01-15'),
(102,'Anjali','HR',50000,'Bengaluru','2023-03-10'),
(103,'Vikram','Finance',70000,'Chennai','2020-09-18'),
(104,'Arjun','IT',75000,'Hyderabad','2019-11-20'),
(105,'Sneha','Marketing',55000,'Mumbai','2023-01-05'),
(106,'Meera','HR',52000,'Delhi','2022-07-08'),
(107,'Aakash','IT',65000,'Hyderabad','2021-06-15'),
(108,'Ravi','Finance',80000,'Pune','2018-12-12'),
(109,'Priya','Marketing',58000,'Mumbai','2022-05-30'),
(110,'Kiran','IT',90000,'Hyderabad','2017-04-21');

# Create a view to display all employee details.
create view AllEmployees AS
select *
from Employe;

# Create a view showing only employee names and salaries.
create view EmployeSalary AS
select EmpName, Salary
from Employe;

# Create a view for employees working in the IT department.
create view ITEmploye AS
select *
from Employe
where Department = 'IT';

# Create a view for employees whose salary is greater than 60,000.
create view HighSalaryEmploye AS
select *
from Employe
where Salary > 60000;

# Display all records from the IT employee view.
select *
from ITEmploye;

# Create a view showing employees from Hyderabad.
create view HyderabadEmploye AS
select *
from Employe
where City = 'Hyderabad';

# Create a view containing only employee names and cities.
create view EmployeCity AS
select EmpName, City
from Employees;

# Replace an existing view using CREATE OR REPLACE VIEW.
create or replace view ITEmploye AS
select EmpID, EmpName, Department, Salary
from Employe
where Department = 'IT';

# Create a view that displays employees ordered by salary.
create view SalaryOrder AS
select *
from Employe
order by Salary DESC;

# Create a view showing employees from the HR and Finance departments.
create view HRFinanceEmploye AS
select *
from Employe
where Department IN ('HR', 'Finance');

# Create a view displaying employee experience (years worked).
create view EmployeeExperience AS
select
    EmpID,
    EmpName,
    Department,
    timestampdiff(YEAR, JoiningDate, CURDATE()) AS Experience_Years
FROM Employe;

# Delete an employee through a simple view.
create view DeleteEmployee AS
select *
from Employe;

# Create a view showing the highest-paid employee in each department.
create view HighestSalaryEmployee AS
select *
from Employee
where (Department, Salary) IN
(
    select Department, MAX(Salary)
    from Employees
    group by Department
);

# Create a view showing the average salary of each department.
create view DeptAgeSalary AS
select
    Department,
    avg(Salary) AS Average_Salary
from Employe
group by Department;
# Create a view displaying the total number of employees in each city.
create view DeptAvgeSalary AS
select
    Department,
    avg(Salary) AS Average_Salary
from Employe
group by Department;
