
#Task 1: Create a Student Table
#Create a table Students with the following requirements:
#student_id → Auto-incrementing primary key
#email → Must be unique
#name → Cannot be null
#age → Must be between 18 and 30
#city → Default value should be 'Hyderabad'

#Task 2: Create an Employee Table
#Create a table Employees with:
#emp_id → Auto-incrementing primary key
#emp_name → Not null
#email → Unique
#salary → Must be greater than 15000
#joining_date → Default current date

#Task 3: Product Management
#Create a table Products with:
#product_id → Auto-incrementing primary key
#product_name → Not null
#barcode → Unique
#price → Must be greater than 0
#stock → Default 0
#Bonus Task
#Write a single CREATE TABLE statement for a Customers table that uses all five constraints:
#AUTO_INCREMENT
#PRIMARY KEY
#UNIQUE
#NOT NULL
#CHECK
#DEFAULT
#Then insert sample records to demonstrate each constraint.


use student;
#create table student(student_id int auto_increment primary key,email varchar(100) unique,
#name varchar(100) not null,age int check (age>18 and age<30),
#city varchar(10) default 'hyderabad');

#create table employee(employee_id int auto_increment primary key,
#empname varchar(100) not null,email varchar(100) unique,
#salary int check(salary>15000),joining_date date default '2026-07-01')

#create table product(product_id int auto_increment primary key,
#product_name varchar(100) not null,barcode varchar(100) unique,
#price int check (price > 0),stock int default 0)

#create table customer(customer_id int auto_increment primary key,
#customer_name varchar(100) not null,customer_email varchar(100) unique,
#product varchar(20) default 'mobile',price int check(price>2000));
insert into customer values(1,'anjali','anjali@gmail.com','iphone',3000);
insert into customer values(2,'pujitha','pujitha@gmail.com','samsung',5000);


