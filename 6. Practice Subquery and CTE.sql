USE Example1_db;
select * from superstore;
-- Q1- write a query to find premium customers from superstore data. 
	-- Premium customers are those who have 
		-- done more orders than average no of orders per customer.
     with cte as(
     select customer_id,count(order_id) as total
      from superstore
      group by customer_id)
      select customer_id
      from cte
      where total > (select AVG(total) from cte);
      
      


-- Q2- write a query to find employees whose salary 
	-- is more than average salary of employees in their department
    With cte as (
    select department_id, AVG(salary) as avg_salary
                from employees
                group by department_id
                )
 select *
 from employees as e
 inner join cte as c
 on e.department_id = c.department_id
 where e.salary > c.avg_salary;

-- Q3- write a query to find employees whose age 
	-- is more than average age of all the employees.
  select *
  from employees
  where emp_age > (select avg(emp_age) as avg_age
  from employees);
  
  
-- Q4- write a query to print emp name, salary and dep id 
	-- of highest salaried employee in each department 
with cte as (select distinct department_id,max(salary) as max_salary
from employees
group by department_id)
select e.emp_name,e.department_id,e.salary
from employees as e 
inner join cte as c
on e.department_id = c.department_id
where salary = max_salary;

-- Q5- write a query to print emp name, salary and dep id of 
	-- highest salaried employee overall
   select emp_name,department_id,salary
   from employees
   where salary =(select max(salary) as highest_salaried
    from employees);

-- Q6- write a query to print product id and total sales 
	-- of highest selling products (by no of units sold) in each category
   with cte as (
   select category,max(sales)
    from superstore
    group by category)
    select count(sales)
    from cte
    where sales = max(sales);
    
-- Q7 Find second highest salaried employee from employees table
with cte as(
select * from employees
where salary <> (select max(salary) as max_salary
from employees)
)
select * from cte
where salary = (select max(salary) as max_salary
from cte);





(select distinct city
from superstore
where length(city) = (select min(length(city)) from superstore)
order by city 
limit 1)
union all
(select distinct city
from superstore
where length(city) = (select max(length(city)) from superstore)
order by city 
limit 1);


