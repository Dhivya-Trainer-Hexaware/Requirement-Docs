use lms_db;


Select * from lms_book_details


--Display the supplier_id and number of book supplied by each supplier

Select supplier_id , Count(book_code) as NumberOfBooks from LMS_BOOK_DETAILS 
where supplier_id is not null
group by supplier_id ;

--Display the suppplier_name and number of book 
--supplied by each supplier

Select l2.supplier_name ,l2.supplier_id, count(book_code ) as Count from 
lms_book_details as l1 join LMS_SUPPLIERS_DETAILS as l2 
on l1.SUPPLIER_ID=l2.SUPPLIER_ID group by l2.SUPPLIER_Name,l2.supplier_id;


--Display department_id and number of employees in each department

Select department_id, count(id) as CountOfEmps from employee group by department_id;


--Display department name and number of employees in each department

Select   d.name ,count(e.id) as CountOfEmps from employee as e join department as d 
on e.department_id=d.id
group by d.name;





Select * from lms_suppliers_details;
--Display the bookcode, book name and supplier name of the books
--in library

--inner join 

Select l1.book_code, l1.book_title ,l2.supplier_name 
from lms_book_details as l1   join    lms_suppliers_details as l2
on l1.SUPPLIER_ID=l2.supplier_id;

-- N tables will need N-1 joins
---Display the book_title and the member_id who has taken the books from library

Select * from LMS_BOOK_DETAILS;
Select * from lms_members;
Select * from LMS_BOOK_ISSUE;

Select distinct BOOK_TITLE,MEMBER_ID from LMS_BOOK_DETAILS join LMS_BOOK_ISSUE on 
LMS_BOOK_DETAILS.BOOK_CODE=LMS_BOOK_ISSUE.BOOK_CODE;


--Display the Bookname and member name who has taken book from the library

Select * from LMS_BOOK_DETAILS;
Select * from lms_members;


Select distinct l1.BOOK_TITLE,l3.MEMBER_NAME   from lms_book_details as l1 
join LMS_BOOK_ISSUE as l2 on 
l1.BOOK_CODE=l2.BOOK_CODE join LMS_MEMBERS as l3 on l2.MEMBER_ID=l3.MEMBER_ID
;

--3 tables with 2 ==>N tables use N-1 join



Select * from employee;

Select * from department;

Select * from location;

--Display employee name , email and department name
Select first_name+' , '+last_name as Name , email , name  from employee join department
on department_id= department.id;

--Display empl name, dept name and the state location

Select  e.first_name , d.name as Dept , l.state
from employee as e join department as d on d.id=e.department_id join 
location as l on d.location_id=l.id;

--Display department_id and number of employees in each department

Select department_id, count(id) as CountOfEmps from employee group by department_id;


--Display department name and number of employees in each department

Select   d.name ,count(e.id) as CountOfEmps from employee as e join department as d 
on e.department_id=d.id
group by d.name;


use lms_db;



--Joins 

--

Select distinct supplier_id from LMS_BOOK_DETAILS;

Select supplier_id from LMS_SUPPLIERS_DETAILS;


--Outer Joins
--Left outer join
--Right outer join
--Full outer join 






Select l1.book_code, l1.book_title, l2.supplier_name ,l2.supplier_id from 
lms_book_details as l1 join LMS_SUPPLIERS_DETAILS as l2 
on l1.SUPPLIER_ID=l2.SUPPLIER_ID ;


Select l1.book_code, l1.book_title, l2.supplier_name ,l2.supplier_id from 
lms_book_details as l1 right outer join LMS_SUPPLIERS_DETAILS as l2 
on l1.SUPPLIER_ID=l2.SUPPLIER_ID ;


Select l2.member_id,l2.MEMBER_NAME,l1.book_code from 
lms_book_issue as l1 right join lms_members as l2 
on l1.MEMBER_ID= l2.member_id ;


--Left join

Select l1.book_code, l1.book_title, l2.supplier_name ,l2.supplier_id from 
lms_book_details as l1 left outer join LMS_SUPPLIERS_DETAILS as l2 
on l1.SUPPLIER_ID=l2.SUPPLIER_ID ;

--Full outer join

Select l1.book_code, l1.book_title, l2.supplier_name ,l2.supplier_id from 
lms_book_details as l1 full outer join LMS_SUPPLIERS_DETAILS as l2 
on l1.SUPPLIER_ID=l2.SUPPLIER_ID where l2.supplier_name like 'S%';

--Having clause
--Find the supplier details who has supplied maximum number of books.


Select * from lms_suppliers_details;
Select * from LMS_BOOK_DETAILS;

Select count(supplier_id) from LMS_BOOK_DETAILS group by supplier_id 
having count(supplier_id)>=All(
Select Count(supplier_id) from lms_book_details 
group by SUPPLIER_ID);


--subquery Answer
--4
--3
--1

--ALL(4,3,1)
--(0,4,3,1)>=All(0,4,3,1)

-- 0>=All(0,4,3,1)
--4>=All(0,4,3,1)--- For all the comparsion it will give a true 
--3>=All(0,4,3,1)
--1>=All(0,4,3,1)

update employee set salary=38000 where first_name='madhu';
Select supplier_id ,count(supplier_id) from LMS_BOOK_DETAILS 
group by supplier_id having count(supplier_id) >2;

Select member_name ,count(book_code) as NoOfBooks from LMS_BOOK_ISSUE as l1 join
LMS_MEMBERS as l2 on l1.member_id=l2.member_id where member_name like 'A%'
group by member_name having count(book_code)<2 order by member_name desc;


Select * from employee;


Select * from 
(Select first_name, salary, DENSE_RANK() over(order by salary desc) r from 
employee) as e where r=5


Select * from employee as e1 where 2= 
(Select count(distinct salary) from employee e2 where e2.salary>=e1.salary)

Select * from employee where salary =(Select Max(salary) from employee)

Create table Emp
(id int,
name char(10),
salary int
);


insert into Emp values(1,'Saran',45000),
(2,'Deepa',65000),(3,'Ram',76000),(4,'John',35000);

Select * from emp;

Select * from emp as e1 where 2= 
(Select count(distinct salary) from emp e2 where e2.salary>=e1.salary);
--

--2= 3 

-- e2    e1
-- 45000>=45000 yes
--65000>=45000 yes
--76000>=45000 yes
--35000>=45000 no


--2

-- e2    e1
-- 45000>=65000  no
--65000>=65000  yes
--76000>=65000 yes
--35000>=65000 no 

--2=1

-- e2    e1
-- 45000>=76000 no
--65000>=76000 no
--76000>=76000 yes
--35000>=76000 no





