-- in-built functions
-- are functions which exist within SQL database engine and can be called anytime
-- string functions 
SELECT char(78);
SELECT left('Mandela', 5);
SELECT right('Mandela', 5);
SELECT length('This is an SQL class');
SELECT ltrim(' mango');
SELECT rtrim('owen   ');
SELECT trim(' instant ');
SELECT reverse('year');
SELECT upper('my name is mr nobody');

-- date functions
SELECT dateadd(mm, 2, '2023-10-19');
SELECT datename(month, convert(datetime, '2023-10-19'));
-- SELECT getdate() or
SELECT current_timestamp();

-- mathematical functions
SELECT round(144.78925, 3);
SELECT ceiling(12.0);
-- rounds a decimal type to its nearest highest whole number
SELECT floor(12.8);
-- rounds a decimal type to its nearest lowest whole number
SELECT power(3,3);
SELECT exp(5);
SELECT sqrt(49);
SELECT pi();

-- logical functions
SELECT IF(5 > 10,'true','false');
SELECT CHOOSE();
SELECT COALESCE();

-- system functions
SELECT host_id();
SELECT connection_id() AS my_id;

-- aggregate functions
-- count()
-- max()
-- min()
-- sum()
-- avg()

-- count() is used to count the number of rows
-- eg
SELECT count(student_id) AS total_students FROM student_records.mms_students;
-- sum() used to add up integer, float, decimal data type columns
-- eg
SELECT sum(amount_paid) AS total_fee FROM student_records.mms_students;
-- max() used to retrieve maximum record from a column
-- eg
SELECT max(amount_paid) AS highest_fee FROM student_records.mms_students;
-- min() used to retrieve minimum record from a column
-- eg
SELECT min(amount_paid) AS lowest_fee FROM student_records.mms_students;
-- avg() used to calculate average result
-- eg
SELECT avg(amount_paid) AS average_fee FROM student_records.mms_students;

-- rank functions
-- we can use rank() to rank records without following numerical order
-- rank in descending order
SELECT student_name, amount_paid, RANK() OVER(ORDER BY amount_paid DESC) AS student_rank FROM student_records.mms_students;
-- rank in ascending order
SELECT student_name, amount_paid, RANK() OVER(ORDER BY amount_paid ASC) AS student_rank FROM student_records.mms_students;
-- we can use dense_rank() to rank records whilst following numerical order
SELECT student_name, amount_paid, DENSE_RANK() OVER(ORDER BY amount_paid DESC) AS student_rank FROM student_records.mms_students;
SELECT student_name, amount_paid, DENSE_RANK() OVER(ORDER BY amount_paid ASC) AS student_rank FROM student_records.mms_students;


-- using delete statement
DELETE FROM MYSHOP.STOCK WHERE Item_name = 'DY';
SELECT * FROM MYSHOP.STOCK;

-- Exercise
-- Creating a database 
CREATE DATABASE MYSHOP;
CREATE TABLE MYSHOP.STOCK(Item_id int, Item_name varchar(15), Item_price int, Item_quantity varchar(15));
-- INSERTING DATA INTO TABLE
-- single rows
INSERT INTO MYSHOP.STOCK VALUES (1,'GADY','2000','24');
-- MULTIPLE ROWS
INSERT INTO MYSHOP.STOCK VALUES (3,'soap','2000','24'), (2,'DY','2340','14');
SELECT * FROM MYSHOP.STOCK;

CREATE DATABASE my_shop;
CREATE TABLE my_shop.stock(item_id int, item_name varchar(50), item_price int, item_qty int);
INSERT my_shop.stock VALUES(1, 'toiletries', 1500, 11),(2, 'skincare', 60000, 25),(3, 'chocolate bars', 2400, 13),
(4, 'toys', 65000, 4),(5, 'shoes', 16800, 7);
SELECT item_name, item_price, DENSE_RANK() OVER(ORDER BY item_price DESC) AS item_rank FROM my_shop.stock;


SELECT * FROM my_shop.stock;
-- creating database
CREATE DATABASE mms2;
-- deleting a database
DROP DATABASE mms2;
-- sp_renamedb mm2, mmsecond;
-- creating tables
CREATE TABLE mms2.users(id int, firstname varchar(20), lastname varchar(20), email varchar(40));
ALTER TABLE mms2.users ADD COLUMN mobile varchar(13);
ALTER TABLE mms2.users ADD COLUMN reg_date datetime;
ALTER TABLE mms2.users DROP COLUMN email;

-- INSERTING DATA INTO TABLES 
-- single row
INSERT INTO mms2.users(id, firstname, lastname, mobile, reg_date) VALUES (1, 'Hamza', 'Abdulraman', '08103864047', '2023-10-20 05:40:57');
-- or
INSERT INTO mms2.users SET id = 4, firstname = 'Eunice', lastname = 'Abraham', mobile = '289220202', reg_date = '2023-10-20 05:40:57';
-- multiple rows
INSERT mms2.users VALUE(2, 'Emmanuel', 'Kosoko', '0902192901', '2021-08-20 05:40:57'),
(3, 'Kelechi', 'Andrews', '920290201', '2019-02-15 05:40:57'),(4, 'Uche', 'Jumbo', '0220292922', '2023-12-04 05:40:57');


-- USING WHERE CLAUSE 
-- update statement
UPDATE student_records.mms_students SET amount_paid = 300000 WHERE student_name = 'Kelechi';
UPDATE student_records.mms_students SET amount_paid = 170000 WHERE student_id = 2;
UPDATE student_records.mms_students SET student_name = 'Sam', amount_paid = 350000 - 150000 WHERE student_id = 3;

-- QUERYING SQL SERVER
-- all records
SELECT * FROM student_records.mms_students;
-- some columns

TRUNCATE TABLE student_records.mms_students;

SELECT student_name, reg_date FROM student_records.mms_students;
-- using WHERE clausestudent_records.mms_students;
SELECT * FROM student_records.mms_students WHERE student_name = 'kelechi';
SELECT * FROM student_records.mms_students WHERE student_id = 1;

-- using AND logical operator
SELECT * FROM student_records.mms_students WHERE amount_paid = 300000 AND student_name = 'Favour';
-- using OR logical operator
SELECT * FROM student_records.mms_students WHERE student_id = 2 OR student_id = 6;
-- using NOT logical operator
SELECT * FROM student_records.mms_students WHERE NOT student_name = 'Ayo';


-- relational / comparison operators
-- = equal to (checks whethers multiple values are the same)
-- eg 
SELECT * FROM student_records.mms_students WHERE student_id = 1;
-- > greater than (checks whether a value is greater than another value)
-- eg
SELECT * FROM student_records.mms_students WHERE student_id > 1;
-- >= greater than equal to (checks whether a value is greater oe equal to than another value)
-- eg
SELECT * FROM student_records.mms_students WHERE student_id >= 3;

-- logical operators
-- AND - executes when all conditions are true
-- OR- executes when at aleast one condition is true
-- NOT- executes when condition is false

SELECT * FROM student_records.mms_students;

INSERT student_records.mms_students VALUES (7, 'Stephen', 45000, '2023-04-02 12:30:00'),(8, 'Ayetunde', 170000, '2020-11-28 08:33:57');

-- Using match and wildcards to run quick query
-- wildcards are characters used to run quick searches
-- % used to retrieve values that contain specific letters as first or last letters
-- examples 
-- %letter used to retrieve data that ends with specified letters; 
SELECT student_name FROM student_records.mms_students WHERE student_name LIKE '%i';
-- letter% used to retrieve data that begin with specified letter; 
SELECT student_name FROM student_records.mms_students WHERE student_name LIKE 'ay%';
-- %letter(s)% used to retrieve data that contains specified letter(s); 
SELECT student_name FROM student_records.mms_students WHERE student_name LIKE '%e%';

-- using join
-- the join keyword is used to merge multiple database tables together as one
-- some types of join
-- 1. inner join or equi join
-- 2. left outer join
-- 3. right outer join
-- 4. cross join or cartesan product

SELECT * FROM student_records.mms_student_contacts;
CREATE TABLE student_records.mms_student_contacts(student_id int, student_name varchar(50), 
student_mobile varchar(15), student_email varchar(50));

INSERT student_records.mms_student_contacts VALUES (1, 'Kelechi', '09037391566', 'kelechi@gmail.com'),(2, 'Ayo', '08106783340', 'ayo@gmail.com'),
(3, 'Sam', '070728729292','sam2gmail.com'),(4, 'Favour', '0802828828','favour@gmail.com'),(5, 'Emmanuel','09032727292','emma@gmail.com'),
(6, 'Ifeanyi','07035689022','ifeanyi@gmail.com'),(7, 'Stephen','0928202022','stephen@gmail.com'),(8, 'Ayetunde','0702729292','tunde@gmail.com');

-- INNER JOIN retrieves only the matching records from tables involved after comparing their common columns
SELECT mms_students.student_id, mms_students.student_name, mms_students.amount_paid, mms_student_contacts.student_mobile, 
mms_student_contacts.student_email FROM student_records.mms_students INNER JOIN student_records.mms_student_contacts ON 
mms_students.student_name = mms_student_contacts.student_name;

SELECT * FROM student_records.mms_students;
-- LEFT OUTER JOIN joins all the records from left table with matching records from right table(displays null cells)
SELECT mms_students.student_id, mms_students.student_name, mms_students.amount_paid, mms_student_contacts.student_mobile, 
mms_student_contacts.student_email FROM student_records.mms_students LEFT OUTER JOIN student_records.mms_student_contacts ON 
mms_students.student_name = mms_student_contacts.student_name;

-- RIGHT OUTER JOIN joins all the records from right table with matching records from left table(displays null cells)
SELECT mms_students.student_id, mms_students.student_name, mms_students.amount_paid, mms_student_contacts.student_mobile, 
mms_student_contacts.student_email FROM student_records.mms_students RIGHT OUTER JOIN student_records.mms_student_contacts ON 
mms_students.student_name = mms_student_contacts.student_name;

INSERT student_records.mms_student_contacts VALUES(7, 'Stephen', '0198091290','stephen@gmail.com'),
(8, 'Ayetunde', '791721988', 'aye@yahoo.com');

-- CROSS JOIN joins a row from left table with every row from right table, and repeat until all rows from left table are complete
SELECT mms_students.student_name, mms_student_contacts.student_mobile FROM student_records.mms_students CROSS JOIN 
student_records.mms_student_contacts;

-- SUBQUERIES
SELECT * FROM student_records.mms_students WHERE student_id = 
(SELECT mms_students.student_id FROM student_records.mms_students WHERE student_name = "Emmanuel");

UPDATE student_records.mms_students SET amount_paid = 250000 WHERE student_id = 3;

UPDATE student_records.mms_students SET amount_paid =
(SELECT amount_paid FROM student_records.mms_students WHERE student_id = 3) + 25000 WHERE student_id = 3;

DESCRIBE student_records.mms_students;

-- modified comparison
-- >ALL greater than the maximum value retrieved by the subquery
SELECT * FROM student_records.mms_students WHERE student_id >ALL (SELECT student_id FROM student_records.mms_students WHERE student_id = 4);
SELECT * FROM student_records.mms_students WHERE student_id >ALL (SELECT student_id FROM student_records.mms_students WHERE student_id > 2);
-- >ANY greater than the minimum value retrieved by the subquery
SELECT * FROM student_records.mms_students WHERE student_id >ANY (SELECT student_id FROM student_records.mms_students WHERE student_id > 3);
SELECT * FROM student_records.mms_students WHERE student_id >ANY (SELECT student_id FROM student_records.mms_students WHERE student_id > 1) AND student_id < 6;
SELECT * FROM student_records.mms_students WHERE student_id >ALL (SELECT student_id FROM student_records.mms_students WHERE student_id < 3) AND student_id < 6;
-- <>ALL retrieves records greater than all result of the subquery
SELECT * FROM student_records.mms_students WHERE student_id <>ALL (SELECT student_id FROM student_records.mms_students WHERE student_id < 5);