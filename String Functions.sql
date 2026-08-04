use student;
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    Department VARCHAR(50),
    Email VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO Employees (EmpID, EmpName, Department, Email, City) VALUES
(101, 'Rahul Sharma', 'IT', 'rahul.sharma@gmail.com', 'Hyderabad'),
(102, 'Anjali Reddy', 'HR', 'anjali.reddy@yahoo.com', 'Bengaluru'),
(103, 'Vikram Kumar', 'Finance', 'vikram.kumar@outlook.com', 'Chennai'),
(104, 'Arjun Rao', 'IT', 'arjun.rao@gmail.com', 'Hyderabad'),
(105, 'Sneha Patel', 'Marketing', 'sneha.patel@gmail.com', 'Mumbai'),
(106, 'Madam', 'Testing', 'madam@test.com', 'Pune'),
(107, 'Nayan', 'Support', 'nayan@company.com', 'Delhi'),
(108, 'Ravi Kumar', 'IT', 'ravi.kumar@gmail.com', 'Hyderabad'),
(109, 'Priya Singh', 'HR', 'priya.singh@yahoo.com', 'Kolkata'),
(110, 'Aravind', 'Finance', 'aravind@gmail.com', 'Visakhapatnam'),
(111, 'Aakash', 'IT', 'aakash@company.com', 'Hyderabad'),
(112, 'Meera', 'Marketing', 'meera@gmail.com', 'Mumbai'),
(113, 'Rahul Sharma', 'Support', 'rahul2@gmail.com', 'Chennai'),
(114, 'Sita Devi', 'HR', 'sita.devi@yahoo.com', 'Bengaluru'),
(115, 'Akash Raj', 'Testing', 'akash.raj@company.com', 'Delhi');
 select * from Employees;

#Display all employee names in uppercase.
select UPPER(EmpName) from Employees;

#Display the length of each employee's name.
select length(EmpName) from Employees;

#Display the first three characters of each employee's name.
select left(EmpName,3) from Employees;

#Concatenate employee name and department into a single column.
select concat(EmpName, ' - ', Department) from Employees;

#Remove leading and trailing spaces from employee names.
select trim(EmpName) from Employees;

#Replace "Hyderabad" with "Bengaluru" in the City column.
select EmpName,replace(city,'hyderabad','Bengaluru') from Employees;

#Display the first occurrence of the letter 'a' in each employee name.
SELECT EmpName, LOCATE('a',LOWER(EmpName)) from Employees;

#Display employee names in reverse order of characters.
select reverse(EmpName) from Employees;

#Intermediate Level
#Count the number of characters in each email address.
select length(Email) from Employees;

#Extract the domain name from each email address.
select Email,
SUBSTRING_index(Email, '@', -1) from Employees;

#Display the first word from employee names (if names contain spaces).
select EmpName,
SUBSTRING_INDEX(EmpName, ' ', 1) from Employees;

#Display only the last name of each employee.
select EmpName,
SUBSTRING_INDEX(EmpName, ' ', -1) 
from Employees;
#Count how many employees belong to each city.
select city, count(*) from Employees group by city;

#Find employees whose names start with 'A'.
select * from Employees where EmpName like 'A%';

#Find employees whose names end with 'n'.
select * from Employees where EmpName like '%n';

#Find employees whose names contain 'ra'.
select * from Employees where EmpName like '%ra%';

#Advanced Level

#Display employee names that are palindromes.
select EmpName
from Employees
where lower(replace(EmpName,' ',''))
=
lower(reverse(replace(EmpName,' ','')));

#Find the employee(s) with the longest name.
select *
from Employees
where length(EmpName)=
(
select max(length(EmpName))
FROM Employees
);
#Display employee names sorted by their length.
select EmpName
from Employees
order by length(EmpName);

#Find duplicate employee names.
select EmpName, count(*) from Employees group by EmpName having count(*)>1;

#Replace every occurrence of the letter 'a' with '@'.
select EmpName, replace(EmpName,'a','@') from Employees;




