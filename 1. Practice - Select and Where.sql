-- Note: please do not use any functions which are not taught in the class. you need to solve the questions only with the concepts that have been discussed so far.
Use example1_db;
SELECT * from superstore;


-- 1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character (58 rows)
SELECT Customer_Name
FROM superstore
WHERE Customer_Name LIKE "_a_d%";

SELECT Customer_Name
FROM superstore
WHERE Customer_Name LIKE "_a%" AND Customer_Name LIKE "___d%";

-- 2- write a sql to get all the orders placed in the month of dec 2020 (352 rows) 
SELECT COUNT(*)
FROM superstore
WHERE  Order_Date >= "2020-12-01" AND Order_Date <="2020-12-31" ;

-- 3- write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020 (944 rows)
SELECT COUNT(*)
FROM superstore
WHERE Ship_Mode NOT IN ("Standard Class","First Class") AND ship_date > "2020-11-30";

-- 4- write a query to get all the orders where customer name neither start with "A" and nor ends with "n" (9815 rows)
SELECT COUNT(*)
FROM superstore
WHERE customer_name NOT LIKE "A%" or customer_name NOT LIKE "%n";


-- 5- write a query to get all the orders where profit is negative (1871 rows)
SELECT COUNT(*)
FROM superstore
WHERE profit < 0;

-- 6- write a query to get all the orders where either quantity is less than 3 or profit is 0 (3348)
SELECT COUNT(*)
FROM superstore
WHERE  quantity < 3 or profit =0;

-- 7- your manager handles the sales for South region and he wants you to create a report of all the orders in his region where some discount is provided to the customers (815 rows)
SELECT COUNT(*)
FROM superstore
WHERE region = "South" AND discount > 0;

-- 8- write a query to find top 5 orders with highest sales in furniture category 
SELECT *
FROM superstore
WHERE category = "Furniture" 
ORDER BY sales DESC
LIMIT 5;

-- 9- write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only (1021 rows)
SELECT COUNT(*)
FROM superstore
WHERE category  IN("Furniture" ,"Technology") AND Order_date >= '2020-01-01'AND Order_date<= '2020-12-31';

-- 10 -write a query to find all the orders where order date is in year 2020 but ship date is in 2021 (33 rows)
SELECT COUNT(*)
FROM superstore
WHERE  (Order_date >= "2020-01-01" AND Order_date <= "2020-12-31") AND (ship_date >= "2021-01-01" AND ship_date <= "2021-12-31");