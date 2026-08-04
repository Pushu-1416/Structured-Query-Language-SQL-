use student;
CREATE TABLE EmployeeAttendance (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    JoinDate DATE,
    BirthDate DATE,
    LoginTime DATETIME,
    LastWorkingDay DATE
);

INSERT INTO EmployeeAttendance
(EmpID, EmpName, JoinDate, BirthDate, LoginTime, LastWorkingDay)
VALUES
(101,'Rahul Sharma','2022-01-15','1999-08-20','2026-08-01 09:15:30','2026-08-10'),
(102,'Anjali Reddy','2021-05-18','2000-11-12','2026-08-01 08:55:20','2026-08-05'),
(103,'Vikram Kumar','2020-09-30','1998-03-14','2026-08-02 09:05:10','2026-08-15'),
(104,'Arjun Rao','2023-02-11','2001-12-05','2026-08-03 09:45:55','2026-08-20'),
(105,'Sneha Patel','2024-04-25','2002-07-22','2026-08-03 08:50:00','2026-08-30'),
(106,'Meera','2022-06-10','1999-01-08','2026-08-04 09:20:15','2026-08-25'),
(107,'Aakash','2021-11-19','2000-05-28','2026-08-04 09:00:00','2026-08-18'),
(108,'Ravi Kumar','2020-12-01','1997-09-16','2026-08-05 09:30:40','2026-08-28');

#Display the current date.
select current_date();

# Display the current time.
select current_time();

# Display the current date and time.
select now();
# Display each employee's joining year.
select EmpName, year(JoinDate) from EmployeeAttendance ;

# Display each employee's joining month.
select EmpName, month(joindate) from EmployeeAttendance;

# Display each employee's joining day.
select EmpName, day(joindate) from EmployeeAttendance;

# Display the month name of each employee's joining date.
select EmpName, monthname(joindate) from EmployeeAttendance;

# Display the day name of each employee's birth date.
select EmpName, dayname(birthdate)  from EmployeeAttendance;

# Display today's year, month, and day separately.
select year(current_date());
select month(current_date());
select day(current_date());

# Display employees who joined in the year 2022.
select * from EmployeeAttendance where year(joindate)='2022';

#Display employees who joined in January.
select * from EmployeeAttendance where month(joindate)=1;

# Display employees born after the year 2000.
select * from  EmployeeAttendance where year(BirthDate)='2000';

# Find employees whose birthday is in August.
select * from EmployeeAttendance where month(BirthDate) = 8;

# Display employees who joined before 2022.
select * from EmployeeAttendance where JoinDate < '2022-01-01';

# Display employees who joined after a specific date.
select * from EmployeeAttendance where JoinDate > '2022-06-30';

# Find employees whose last working day is within the next 15 days.
select *
from EmployeeAttendance
where LastWorkingDay
between CURDATE() and DATE_ADD(CURDATE(), interval 15 day);

# Calculate the number of days between the joining date and the last working day.
select EmpName,
datediff(LastWorkingDay, JoinDate) 
from EmployeeAttendance;

# Display employees sorted by their joining date.
select *
from EmployeeAttendance
order by JoinDate;

#Add 30 days to each employee's joining date.
select EmpName,
date_add(JoinDate, interval 30 DAY) 
from EmployeeAttendance;

# Subtract 10 days from each employee's last working day.
select EmpName,
date_sub(LastWorkingDay, interval 10 DAY) 
from EmployeeAttendance;

# Display employees who joined exactly 3 years ago.
select *
from EmployeeAttendance
where TIMESTAMPDIFF(year, JoinDate, CURDATE()) = 3;

# Display employees whose birthday is today.
select *
from EmployeeAttendance
where month(BirthDate) = month(CURDATE())
and day(BirthDate) = day(CURDATE());

# Find the employee with the earliest joining date.
select *
from EmployeeAttendance
where JoinDate =
(
select min(JoinDate)
from EmployeeAttendance
);

# Find the employee with the latest joining date.
select *
from EmployeeAttendance
where JoinDate =
(
select max(JoinDate)
from EmployeeAttendance
);

# Display the first day of the joining month.
select EmpName,
DATE_FORMAT(JoinDate, '%Y-%m-01') 
from EmployeeAttendance;

# Display the last day of the joining month.
select EmpName,
LAST_DAY(JoinDate)
from EmployeeAttendance;


