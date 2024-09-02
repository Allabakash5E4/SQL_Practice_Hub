USE example1_DB;

SELECT *
FROM superstore;

-- Q1. What is the difference between COUNT(*), COUNT(expression), 
		-- and COUNT(DISTINCT expression)?
                 -- COUNT(*) counts all the records in the group. 
                 -- COUNT(column_name) only counts non-null values. 
				 -- COUNT(DISTINCT column_name) , that counts non-null distinct values.
        
-- Q2. Do basic Exploratory data analysis (EDA) of the dataset. For example-
		-- How many rows do we have?
        SELECT COUNT(*)
        FROM superstore;
        -- How many orders were placed?
		SELECT COUNT(DISTINCT Order_id)
        FROM superstore;
		-- How many customers do we have?
        SELECT COUNT(DISTINCT customer_name)
        FROM superstore;
		-- How much profit did we make in total?
		SELECT SUM(profit)
        FROM superstore;
		-- How many days orders were placed?
		SELECT count(distinct order_date)
        FROM superstore;
		-- What was the highest and lowest sales per quantity ?
		SELECT MAX(sales/quantity),MIN(sales/quantity)
        FROM superstore;
        
-- Q3- Write a query to get total profit, first order date and latest order date for each category
SELECT category, SUM(profit) as total, MIN(Order_date),MAX(Order_date)
FROM superstore
GROUP BY category;
-- Q4. How many orders were placed on each day?
SELECT order_date, COUNT(DISTINCT order_id)
FROM superstore
GROUP BY order_date;

-- Q5. How many orders were placed for each type of Ship mode? 
SELECT ship_mode, COUNT(DISTINCT order_id)
FROM superstore
GROUP BY ship_mode;
    
-- Q6. How many orders were placed on each day for Furniture Category?
SELECT order_date,COUNT(DISTINCT order_id)
FROM superstore
WHERE category = "Furniture"
GROUP BY order_date;

-- Q7. How many orders were placed per day 
		-- for the days when sales was greater than 1000?
      SELECT order_date, COUNT(distinct order_id) as col, SUM(sales)
      FROM superstore
      GROUP BY order_date
      HAVING SUM(sales) > 1000;

-- Q8. What will below codes return? What is the issue here?
		SELECT category, sub_category, SUM(profit) AS profit
		FROM superstore
		GROUP BY category;

		SELECT category, SUM(profit) AS profit
		FROM superstore
		GROUP BY category, sub_category;
	
-- Q9. How many Sub categories and products are there for each categories?
SELECT category,COUNT(DISTINCT product_id),COUNT(DISTINCT sub_category)
FROM superstore
GROUP BY category;

-- Q10. Find sales, profit and Quantites sold for each categories.
SELECT category,SUM(sales),SUM(profit),SUM(quantity)
FROM superstore
GROUP BY category;

-- Q11. Write a query to find top 5 sub categories in west region by total quantity sold
SELECT sub_category, SUM(quantity)
FROM superstore
WHERE region = "west"
GROUP BY sub_category
ORDER BY SUM(quantity)  DESC
LIMIT 5;

-- Q12. Write a query to find total sales for each region and ship mode combination for orders in year 2020
SELECT region,ship_mode,SUM(sales)
FROM superstore
WHERE (order_date >= "2020-01-01" AND order_date <= "2020-12-31" )OR (order_date BETWEEN "2020-01-01" AND "2020-12-31")
GROUP BY region,ship_mode;

-- Q13. Find quantities sold for combination of each category and subcategory
SELECT category,sub_category,SUM(quantity)
FROM superstore
GROUP BY category,sub_category;

-- Q14. Find quantities sold for combination of each category and subcategory 
		-- when quantity sold is greater than 2
SELECT category,sub_category,SUM(quantity)
FROM superstore
WHERE quantity > 2
GROUP BY category,sub_category;


-- Q15. Find quantities sold for combination of each category and subcategory 
		-- when quantity sold in the combination is greater than 100
SELECT category,sub_category,SUM(quantity)
FROM superstore
GROUP BY category,sub_category
HAVING SUM(quantity) > 100;

-- Q16. Write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category
SELECT sub_category,AVG(profit),MAX(profit)/2
FROM superstore
GROUP BY sub_category
HAVING AVG(profit) > MAX(profit)/2 ;

-- Q17. Create the exams table with below script
-- Write a query to find students who have got same marks in Physics and Chemistry.

CREATE TABLE exams 
(student_id int, 
subject varchar(20), 
marks int);

INSERT INTO exams VALUES 
(1,'Chemistry',91),
(1,'Physics',91),
(1,'Maths',92),
(2,'Chemistry',80),
(2,'Physics',90),
(3,'Chemistry',80),
(3,'Maths',80),
(4,'Chemistry',71),
(4,'Physics',54),
(5,'Chemistry',79);

SELECT *
FROM exams;

SELECT student_id,marks
FROM exams
WHERE subject in ("Physics","Chemistry")
GROUP BY student_id,marks
HAVING Count(*) =2 AND count(distinct marks) =1;
