USE  example_db;

SELECT * FROM superstore;

SELECT row_id, product_name, customer_name,
LEFT(customer_name,5) as useLEFT,
RIGHT(customer_name,5) as useRIGHT, 
SUBSTR(customer_name,3,9) as useSUBSTR,
LENGTH(customer_name) as useLENGTH,
INSTR(customer_name,"a") as useINSTR,
REPLACE(customer_name,"a","*") as useREPLACE,
REVERSE(customer_name) as useREVERSE,
CONCAT(row_id,customer_name) as useCONCAT,
UPPER(customer_name) as useUPPER,
LOWER(customer_name) as useLOWER
FROM superstore;

-- Q1. Change the Category "Office Supplies" to "School Supplies".

SELECT category,
REPLACE(category,"Office Supplies","School Supplies") as category
FROM superstore;

-- Q2. Change the Category "Office Supplies" to "School Supplies" only when Ship Mode is "Second Class".
SELECT ship_mode, category,
case
    when ship_mode="Second Class"
    THEN REPLACE(category,"Office Supplies","School Supplies") 
    else category
end as col1
FROM superstore;

select sales,
case
    when sales < 100 then "Low"
    when sales < 500 then "Medium"
    else  "High"
    
end as col12

from superstore;


-- Q3. Get the first three letters of Customer Name and make them capital.
SELECT customer_name,
UPPER(LEFT(customer_name,3)) as c_name
FROM superstore;

-- Q4. Get the first name of Customer Name. (Hint: Find the occurence of the first space)
SELECT customer_name,
LEFT(customer_name,INSTR(customer_name," ")-1) as first_name
FROM superstore;


-- Q5. Get the last name of Customer Name. Get the last word from the Product Name.

SELECT customer_name,product_name,
REVERSE(LEFT(REVERSE(customer_name),INSTR(REVERSE(customer_name)," ")-1)) as last_name,
REVERSE(LEFT(REVERSE(product_name),INSTR(REVERSE(product_name)," ")-1)) as last_word
FROM superstore;

-- Q6. Divide Profit by Quantity. 
		-- Did you notice anything strange? What can be done to resolve the issue?
  
  SELECT Quantity,Profit, Profit/Quantity
  FROM superstore;
  

-- Q7. Write a query to get records where the length of the Product Name is less than or equal to 10.
SELECT row_id,Product_Name
FROM superstore
WHERE LENGTH(Product_Name) <= 10 ;


-- Q8. Get details of records where first name of Customer Name is greater than 4.
SELECT customer_name
FROM superstore
WHERE LENGTH(LEFT(customer_name,INSTR(customer_name," ")-1))  > 4;

-- Q9. Get records from alternative rows.
SELECT row_id
FROM superstore
WHERE row_id%2 =0;

	
-- Q10. Create a column to get both Category and Sub Catergory. For example: "Furniture - Bookcases".
SELECT Category,Sub_Category,
CONCAT( Category, " - ", Sub_Category) as new_col
FROM superstore;

-- Q11. Remove last three characters for the Customer Name.
SELECT Customer_Name,
LEFT(Customer_Name,LENGTH(Customer_Name) -3)as newcol
FROM superstore;

-- Q12. Get the records which have smallest Product Name.
select distinct product_name
from superstore
where length(product_name) =(SELECT MIN(LENGTH(Product_Name)) as smallest
FROM superstore);




-- Q13. Get the records where the Sub Category contains character "o" after 2nd character.
SELECT Sub_Category
FROM superstore
WHERE Sub_Category LIKE '__%o%';

SELECT Sub_Category
FROM superstore
WHERE INSTR(Sub_Category, 'o')>2;


-- Q14. Find the number of spaces in Product Name.
SELECT Product_Name,
LENGTH(Product_Name) - LENGTH(REPLACE(Product_Name, " ", "")) as newcol
FROM superstore;


SELECT Product_Name,COUNT(' ')
FROM superstore
GROUP BY Product_Name;

-- Q15  find the occurence of second space in product name.

SELECT Product_Name,
INSTR(Product_Name, " ") +
INSTR(RIGHT(Product_Name,LENGTH(Product_Name) - INSTR(Product_Name, " "))," ") as second_space
FROM superstore;




