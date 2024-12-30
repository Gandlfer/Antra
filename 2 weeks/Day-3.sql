/*
Common Table Expression (CTE)
used for resursive functionality when view is not required.
CTE must be used in the next select statement
*/

/*
with CTEExample 
as 
(Select EmployeeID,FirstName+' '+LastName as 'EmpName' from Employees)
Select * from CTEExample -- needs to be immediate next CTE statement
*/

/*
-- Recursive CTE
-- No outer join, inner join only
-- Creates a hierarchy of employeeID

with CTEEmployeeHierarchy
as
(
Select EmployeeID,ReportsTo,FirstName, 1 as 'level'
From Employees
Where ReportsTo is null
Union All
Select e.EmployeeID,e.ReportsTo,e.FirstName, c.level+1
From Employees e inner Join CTEEmployeeHierarchy c
on e.ReportsTo=c.EmployeeID
)
Select * from CTEEmployeeHierarchy
*/

/*
Temperary Table
Local TempTable - Used within the session
				- # For local temptable
Global TempTable - Used with any other session
				- ## for Global temptable

*/

-- Table Variables
-- Also stored in tempdb
-- Used for analytical not for TranSQL
/*
declare @empvar Table (id int, ename varchar(20))
insert into @empvar values (1,'Daniel')
insert into @empvar values (2,'Scott')

Select * from @empvar
*/

/*
Stored Procedured are precomplied group of statements
which can be reused when required.
Stored Procedures are used for DML Operation
Ex: Insert, Update Delete, Select
*/

-- Create Table emp(Id int, ename varchar(20), salary decimal)

-- insert into emp values (1,'scott',6000)

-- SQL server understand SQL as query execution plan
-- Cached the SQL statement, but if value changes, it needs to recreate the plan and cache it
-- Stored Procedure can prevent injection attacks by using parameterized value

/*
create proc spWelcome
as
begin
	print 'welcome to sp'
end
*/

-- spWelcome

-- drop proc spWelcome

-- Procedures with param
/*
create proc spPrintMsg
@ename varchar(20)
as
begin
	print 'welcome to sp ' + @ename
end
*/

/*
declare @en varchar(20) = 'jack'
exec spPrintMsg @en
*/

/*
Modes Paramater
In mode - Input for proc
out mode - Output for proc
*/

/*
create proc spTotal
@x int, -- input
@y int, -- input
@sum int out -- output
as
begin
	set @sum = @x+@y
end
*/

--declare @sum int
--exec spTotal 4,6, @sum out
--print @sum
/*
create proc spGetMulitply
@x int, @y int
as
begin
return @x*@y
end
*/

/*
declare @result int
exec @result = spGetMulitply 5,6
print @result
*/

/*
alter proc spGetMulitply
@x int, @y int
as
begin
return 'welcome'
end
*/

-- cannot return varchar, need out mode for string return
/*
declare @result varchar(20)
exec @result = spGetMulitply 5,6
print @result
*/

/*
create proc spGetProductsBySupplierId
@supId int
as
begin
	select * from products where SupplierID = @supId
end
*/

-- exec spGetProductsBySupplierId 4

-- drop proc spGetProductsBySupplierId

/*
Functions vs Stored Procedures
Functions cannot perform Delete, Insert because 
functions cannot support Transactions
functions need 1 parameter and need a return

Find Functions vs Stored Procedures
Find Drop vs Delete
*/

-- insert into emp values (2,'sarah',6500,300)

-- select id,ename,salary,commission,dbo.getTotalSalary(salary,commission)
-- from emp

/*
create function getTotalSalary(@s decimal, @c decimal)
returns decimal
as 
begin
if @c is null
	return @s

return @s + @c
end
*/

select id,ename,salary,commission,dbo.getTotalSalary(salary,commission)
from emp
