CREATE DATABASE IF NOT EXISTS example_db;
USE example_db;


CREATE table if not exists sample_table(
id INT,
name text
);

SELECT * 
FROM sample_table;


-- ALTER
-- ADD COLUMNS
-- REMOVE COLUMNS
-- CHANGE DATATYPE
-- RENAME COLUMNS
-- RENAME TABLE

ALTER table sample_table
ADD salary int, add Phone_No varchar(10);

SELECT * 
FROM sample_table;

ALTER table sample_table
DROP Phone_No;

SELECT * 
FROM sample_table;

ALTER table sample_table
RENAME COLUMN name to Emp_name;


-- INSERT
insert into sample_table values
(1,"Allabakash",10000);
insert into sample_table values
(2,"Akash",20000);
insert into sample_table values
(3,"Ash",30000);
insert into sample_table values
(4,"Ali",40000);
 
 -- TRUNCATE
 

