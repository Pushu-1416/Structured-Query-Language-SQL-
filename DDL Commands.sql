#Create a table named Students with the following columns:
#StudentID (Primary Key)
#StudentName
#Age
#Course
#Email

#Create a table named Employees with:
#EmployeeID (Primary Key)
#EmployeeName
#Department
#Salary
#JoinDate

#Add a column PhoneNumber to the Students table.

#Modify the Salary column in the Employees table to allow decimal values with 2 decimal places.

#Rename the column Course in the Students table to CourseName.

#Rename a Table



use student;

#create table student(studentid int PRIMARY KEY,studentname varchar(100),age int,course varchar(20),email varchar(100)) 
#create table employee(employeeid int PRIMARY KEY,employeename varchar(100),department varchar(20),salary int,joindate date)
#select * from employee;
#alter table student add column PhoneNumber int;
#alter table employee modify column salary decimal(2);
#alter table student rename column course to coursename;
rename table student to studentdetails;