-- Lab 4: Write SQL queries to display the titles of books published by
--  a specific author. Sort the results by year_of_publication in descending order.
-- Query:-
select title,author,year_of_publication from books order by year_of_publication desc;
/*--------------------------------------------------------------------------------------------------------------------------------*/
-- Que-3. SQL CONSTRAINTS:-
-- Lab 3: Add a CHECK constraint to ensure that the price of books in the books table is greater than 0.
alter table books add constraint  check(price>0);

-- Lab 4: Modify the members table to add a UNIQUE constraint 
-- on the email column, ensuring that each member has a unique email address.
-- Query:-
alter table members add constraint unique (email);

/*--------------------------------------------------------------------------------------------------------------------------------*/
-- 	4. Main SQL Commands and Sub-commands(DDL):-
-- Lab 3: Create a table authors with the following column
-- s: author_id, first_name, last_name, and country. Set author_id as the primary key. 

create table authors(author_id int primary key,first_name varchar(20),last_name varchar(20),country varchar(20));


-- Lab 4: Create a table publishers with columns: 
-- publisher_id, publisher_name, contact_number, and address. Set publisher_id as the primary key and contact_number as unique.

create table publisher(publisher_id int primary key ,publisher_name varchar(20),contact_number bigint unique,address varchar(50));


/*--------------------------------------------------------------------------------------------------------------------------------*/
-- 5. ALTER COMMAND:-
-- Lab 3: Add a new column genre to the books table. Update the genre for all existing records. 
