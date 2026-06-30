
use student;
create table student_info(id int unique,name varchar(20) not null,branch varchar(10),marks int);
insert into student_info values(1,'anjali','cse',97),(2,'pujitha','bca',75),(3,'aadi','bipc',99),(4,'lakshmi','bipc',99);
select * from student_info;
delete from student_info where id=3;
update student_info set marks=100 where id=4;
set sql_safe_updates=0;





