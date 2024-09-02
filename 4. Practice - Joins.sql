USE example1_db;

CREATE TABLE IF NOT EXISTS employees(
emp_id INT,
emp_name VARCHAR(20),
department_id INT,
salary INT,
manager_id INT,
emp_age INT
);

SELECT * FROM employees;

INSERT INTO employees VALUES 
(1, 'Ankit', 100, 10000, 4, 30),
(2, 'Mohit', 100, 15000, 5, 48),
(3, 'Vikas', 100, 10000,4,37),
(4, 'Rohit', 100, 5000, 2, 16),
(5, 'Mudit', 200, 12000, 6,55),
(6, 'Agam', 200, 12000,2, 14),
(7, 'Sanjay', 200, 9000, 2,13),
(8, 'Ashish', 200,5000,2,12),
(9, 'Mukesh',300,6000,6,51),
(10, 'Rakesh',300,7000,6,50);

CREATE TABLE department(
dep_id INT,
dep_name VARCHAR(20)
);

INSERT INTO department VALUES
(100, 'Analytics'),
(300, 'IT');

select * from department;

-- Q1. Given EMPLOYEES and DEPARTMENT table. How many rows will be returned after using left, right, inner, full outer joins
     -- INNER JOIN-->6
      -- LEFT JOIN-->10
       -- RIGHT JOIN-->6
        -- FULL OUTER JOIN-->10
    
-- Q2. Create new column for department name in the EMPLOYEES table
SELECT e.*,d.dep_id
from employees as e
left join department as d
on e.department_id = d.dep_id;

-- Q3. In case if the department does not exist, the default department should be "NA".
SELECT e.*,
case
when d.dep_id is null then "NA" else d.dep_id end as newcol
from employees as e
left join department as d
on e.department_id = d.dep_id;

-- Q4. Find employees which are in Analytics department.
SELECT e.*
from employees as e
left join department as d
on e.department_id = d.dep_id
where d.dep_name= "Analytics" ;

-- Q5. Find the managers of the employees
select e.* , m.emp_name
from employees as e 
inner join employees as m
on e.manager_id = m.emp_id
order by emp_id;

-- Q6. Find all employees who have the salary more than their manager salary.
select e.* , m.emp_name
from employees as e 
inner join employees as m
on e.manager_id = m.emp_id
Where e.salary > m.salary;



-- Q7. Find number of employees in each department
SELECT d.dep_name,COUNT(*)
from employees as e
left join department as d
on e.department_id = d.dep_id
GROUP BY d.dep_name;

-- Q8. Find the highest paid employee in each department
with cte as (select distinct department_id,max(salary) as max_salary
from employees
group by department_id)
select e.*
from employees as e 
inner join cte as c
on e.department_id = c.department_id
where salary = max_salary;

-- Q9. Which department recieves more salary

-- Q10. What is cross join? What it can be used for?
      -- CROSS JOIN will returns all the records from both the table like cartesian product or  
         -- A CROSS JOIN produces a cartesian product between the two tables, returning all possible combinations of all rows. 
            -- It has no ON clause because you're just joining everything to everything.
	select *
    from employees
    cross join department;
    
    ---------------------------------------------------------------------------------------------------
    -- UNION
    -- INTERSECT
    -- EXCEPT 
    
    
    -- WINDOW FUNCTIONS
      -- ROW_NUMBER
      select *,
      row_number() over (partition by department_id order by department_id) as rn
      from employees;
      
      -- RANK
       select *,
      rank() over (partition by department_id order by salary) as rn
      from employees;
      
      -- DENSE_RANK
      select *,
      dense_rank() over (order by salary desc) as rn
      from employees;
      
      -- 2nd highest
      with cte as (
      select *,
      dense_rank() over (order by salary desc) as rn
      from employees)
      select * 
      from cte
      where rn = 2;
      
      
      -- LAG
      select *,
      lag(salary) over (order by salary desc) as rn
      from employees;
      
      -- LEAD
      select *,
      lead(salary) over (order by salary desc) as rn
      from employees;
      
      
      -- AGGREGATE WINDOW FUNCTIONS
           -- SUM
            select *,
			sum(salary) over (order by salary desc, emp_id) as sum_cu
		    from employees;
            
		  -- AVG 
		    select *,
			AVG(salary) over (order by salary desc, emp_id) as sum_cu
		    from employees;
            
            -- COUNT
            select *,
			COUNT(salary) over (order by salary , emp_id) as sum_cu
		    from employees;
            
            -- MIN
            -- MAX
            
            
            
            
            -- UPDATE
            select * from employees;
            
            UPDATE employees set emp_name = "Ashish"
            where emp_id = 2;
            drop table employees;
            
            