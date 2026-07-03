#1.Retrieve all employee records where the salary is greater than 30,000.
#2.Display students whose age is less than or equal to 22.
#3.Find products with a price not equal to 500.
#4.Show employees whose department is "IT".
#5.Retrieve customers whose city is not "Hyderabad".

#use student;
#show tables;
#create table employee(id int,name varchar(20),email varchar(20),salary int,doj date,department char(5));
#insert into employee values(1,'sravani','sravani@gmail.com',45000,'2026-07-2','it'),(2,'anjali','anjali@gmail.com',20000,'2026-06-30','cse'),(3,'raju','raju@gmail.com',100000,'2026-09-15','it');
#select * from employee where salary > 30000;

#create table student(id int,name varchar(100),email varchar(100),age int,city varchar(20));
#insert into student values(1,'anjali','anjali@gmail.com',21,'hyderabad'),(2,'pujitha','pujitha@gmail.com',19,'hyderabad'),(3,'lakshmi','lakshmi@gmail.com',45,'macherla');
#select * from student where age <= 22;

#select * from product;
#insert into product values(1,'icecream','98765432',600,5),(2,'waffle','12345678',900,8),(3,'biryani','5432198',400,10);
#select * from product where price != 500;

#select * from employee where department='it';

#select * from student where city != 'hyderabad';
