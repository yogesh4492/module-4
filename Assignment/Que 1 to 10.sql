/*1.INTRODUCTION TO SQL:-
 Lab 1: Create a new database named school_db 
and a table called students with the following 
columns: student_id, student_name,
 age, class, and address
*/

create database if not exists school_db; -- for database create
   use school_db; -- use database
create table if not exists student(student_id int primary key auto_increment,student_name varchar(20), age int,
class varchar(20),address varchar(20));

-- Lab 2: Insert five records into the students table and retrieve all records using the SELECT statement.

insert into student(student_name,age,class,address) values("Yogesh",20,"graduate","Modasa,Gujarat"),
("Vanraj",20,"graduate","Megraj,Gujarat"),
("Ayan",20,"graduate","Ahmedabad,Gujarat"),
("Yash",23,"graduate","Rajasthan"),
("Jay",20,"graduate","Porbandor,Gujarat");
Select * from student;

/*--------------------------------------------------------------------------------------------------------------------------------*/
/* 2.SQL SYNTAX-
Lab 1: Write SQL queries to retrieve specific columns (student_name and age) from the students table. */

select student_name,age from student;

/*Lab 2: Write SQL queries to retrieve all students whose age is greater than 10.*/

select * from student where age>10;
/*--------------------------------------------------------------------------------------------------------------------------------*/
/*Que-3. SQL CONSTRAINTS:-
Lab 1: Create a table teachers with the following columns: teacher_id (Primary Key), teacher_name (NOT NULL), subject (NOT NULL), and email (UNIQUE). 
*/
 create table if not exists teachers(teacher_id int primary key auto_increment,
teacher_name varchar(20) not null,subject varchar(20) not null,email varchar(30) unique );

-- Lab 2: Implement a FOREIGN KEY constraint to relate the teacher_id from the teachers table with the students table
-- First add teacher_id field in student table:
-- Query:-
 alter table student add column teacher_id int;
 
-- foreign key add in column:-
 alter table student add constraint foreign key(teacher_id) references teachers(teacher_id) ;

/*--------------------------------------------------------------------------------------------------------------------------------*/
-- 	4.  Main SQL Commands and Sub-commands(DDL):-
-- Lab 1: Create a table courses with columns: course_id, course_name, and course_credits. Set the course_id as the primary key.
-- Query:-

 create table if not exists course(course_id int primary key auto_increment,course_name varchar(20),course_credits varchar(20));

-- Lab 2: Use the CREATE command to create a database university_db.
-- Query:-

create database university_db; -- database created successfully
/*---------------------------------------------------------------------------------------------------------------------------------*/
-- 5. ALTER COMMAND:-
-- Lab 1: Modify the courses table by adding a column course_duration using the ALTER command. 
-- Query:-

alter table course add course_duration varchar(20); -- //colum added

-- Lab 2: Drop the course_credits column from the courses table.
-- Query:-

 alter table course drop column course_credits; -- //column dropped 
/*----------------------------------------------------------------------------------------------------------------------------------*/
-- 	 6. DROP COMMAND:-
-- Lab 1: Drop the teachers table from the school_db database. 
-- Query:-

drop table teachers; -- //manually

-- Lab 2: Drop the students table from the school_db database and verify that the table has been removed.
-- Query:-
drop  table student;

-- Note :- this manually query can’t work because we can use foreign key that connect teacher_id in both student and teacher table so these query use for it
-- Query:-

drop tables teacher,student;

/*-------------------------------------------------------------------------------------------------------------------------*/

-- 	7. Data Manipulation Language (DML):-
-- Lab 1: Insert three records into the courses table using the INSERT command. 
-- Query:-//bydefault value of course_id start with 101

insert into course(course_name,course_duration) values("Full Stack","12-15 Months"),
("Graphicd Designer","10-14 Months"),("UI/Ux","7-11 Months");

-- Lab 2: Update the course duration of a specific course using the UPDATE command. 
-- Query:-

update course set course_duration="1 year" where course_id=101; -- //for 101
update course set course_duration=" less than 1 year" where course_id=102; -- // for 102
update course set course_duration="more than 1 year" where course_id=103; -- //for 103

-- Lab 3: Delete a course with a specific course_id from the courses table using the DELETE command.
-- Query:-

delete from course where course_id=102;
/*----------------------------------------------------------------------------------------------------------------------------*/
-- 8. Data Query Language (DQL):-
-- Lab 1: Retrieve all courses from the courses table using the SELECT statement. 
-- Query:-  

   select * from course;

-- Lab 2: Sort the courses based on course_duration in descending order using ORDER BY. 
-- Query:-

select * from course order by course_duration desc;

-- Lab 3: Limit the results of the SELECT query to show only the top two courses using LIMIT.
-- Query:- 

select * from course order by course_duration desc limit 1;

/*-------------------------------------------------------------------------------------------------------------------------*/
-- 	9. Data Control Language (DCL):-
-- Lab 1: Create two new users user1 and user2 and grant user1 permission to SELECT from the courses table. 
-- Query:-

create user 'user1'@'localhost' identified by 'Mysql';
create user 'user2'@'localhost' identified by 'Mysql';
grant select on course to user1@localhost;

-- Lab 2: Revoke the INSERT permission from user1 and give it to user2
-- Query:-
revoke insert on course from user1@localhost;
grant insert on course to user2@localhost;

/*-----------------------------------------------------------------------------------------------------------------------------*/
-- 	10. Transaction Control Language (TCL):-
-- Lab 1: Insert a few rows into the courses table and use COMMIT to save the changes. 
-- Query:-

insert into  course(course_name,course_duration) values
('C++ Programming', '1 month'),
('Java Fundamentals', '6 months'),
('Python for Beginners', '7 months'),
('Web Development', '2 months'),
('Database Management', '3 months');

Commit;

-- Lab 2: Insert additional rows, then use ROLLBACK to undo the last insert operation. 
-- Query:-

start transaction;
Insert into course(course_name,course_duration) values
('Advance php','3 Months'),
('Advance java','3 Months');
rollback;

-- Lab 3: Create a SAVEPOINT before updating the courses table, and use it to roll back specific changes.
-- Query:-

start transaction;
 savepoint sp2;
update course set course_duration='1 Month' 
where course_id=103;
rollback to sp2;

/*------------------------------------------------------------------------------------------------------------------------------------*/





