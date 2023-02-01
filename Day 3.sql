Select * from employee;

Select * from manager;

Select * from department;

Select * from location;

Select * from region;

Select * from Countries;

-- A subquery is a select query inside another query 

--Two types 
--Non -corelated 
--Corelated 

-- Select the employee details of HR department

Select first_name, email, salary from employee where department_id=2;-- Hard-coding the data The department id in the department table for HR is 2

--By chance if sometimes the department HR's id is updated as 9 the above query will not give right answer.
update department set id=9 where name='HR'

--Subquery 
Select first_name, email, salary from employee 
where department_id =(Select id from department where name='HR')


Select * from location;
-- Display the states of India

Select state from location where country_id=
(Select id from Countries where name='India') and city='BOmbay'


Select * from manager;


--Multiple subquery
Select first_name from employee where id IN (Select employee_id from manager

where department_id =(Select id from department where name='HR')
)
 ;



--Display the employee detail whose departments's location is in state Texas
--multi-level subquery

Select first_name from employee where department_id=(
Select id from department where location_id =(
Select id from location where state='New Jersey'))


--Emplaoyee Max Salary
Select first_name from employee where salary =(
Select Max(salary) from employee);


--Employee Min salary
Select first_name from employee where salary =(
Select Min(salary) from employee);

Select first_name,salary from employee where salary<(
Select Avg(salary) from employee);

Select first_name,salary from employee where salary>(
Select Avg(salary) from employee);


--2 nd highest salary
Select first_name,salary from employee where salary=(
Select max(salary) from employee where salary !=(
Select Max(salary) from employee));

-- 3rd highest salary
Select max(salary) from employee where salary <(
Select max(salary) from employee where salary !=(
Select max(salary) from employee ))


-- 4th highest salary
Select max(salary) from employee where salary<(
Select max(salary) from employee where salary <(
Select max(salary) from employee where salary !=(
Select max(salary) from employee )))


-- Another type of subquery 





-- Group by 

Select * from employee;


Select department_id, count(id) as EmployeesInEachDept
from employee group by department_id


Select country_id, Count(state) from location 
group by country_id;

Select department_id, max(salary) from employee group by 
department_id;

--Write a query to display the department id and
--the number of managers in the department. 
--Display the records sorted in ascending
--order based on department name.
--Give an alias to the number of managers as 



Select * from manager;

Select department_id, count(employee_id) from manager  group by department_id;





















