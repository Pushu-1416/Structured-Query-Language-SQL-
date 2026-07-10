use student;
select * from e_commerce_orders;

select sum(total_amount) from e_commerce_orders;
select sum(quantity) from e_commerce_orders;
  
select min(quantity) from e_commerce_orders;
select min(price) from e_commerce_orders;

select max(price) from  e_commerce_orders;
select max(order_date) from e_commerce_orders;

select count(*) from e_commerce_orders;

select avg(total_amount) from e_commerce_orders;
select avg(price) from e_commerce_orders;

create table table_1(id int primary key,name varchar(40),age int);
create table table_2(id int,salary int,city varchar(30),
foreign key (id) references table_1 (id));

