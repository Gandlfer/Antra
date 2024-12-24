use  TutorialDb
Go

--Select ProductName from Products


--select ProductName from Products where supplierID = 3 and CategoryID=3


--select * from products where unitprice !=10


--select * from products where not unitprice !=10

-- select * from customers where City = 'london' --not case sensitive

-- select * from products where unitprice  >=10 and UnitPrice <=30

-- select * from Employees where  region is not Null --where keyword return multiple values as a set

-- select * from Customers where city = 'london' or country = 'uk'  -- OR is better if conditions are different columns
-- select * from Customers where city in ( 'london' ,'paris','seattle') -- IN is better if condition are same columns

--select * from Customers where City Like '%M%' -- fill for any length

-- select * from Employees where TitleOfCourtesy like 'M__.' --fill 1 character per _

-- select * from Customers where City like '[^ M,P,S]%' -- search for multiple that start with array. ^ symbol means not

--select * from products where unitprice between 10 and 20 
--order by SupplierID desc, unitprice 

--select 5+10 as 'Total' -- naming convention, no spaces no keyword
--select country + ' = ' +  as 'location' from Customers

--select c.CompanyName, c.ContactName
--from Customers c


/*
Inner join
Left join/ left outer join
right join/ right outer join
full join / full outer join
self join
cross join
*/

/*
Inner join is used to join the result set of 
two or more tables based on the join condition
OR
It is used to get the data from two or more than 
two tables based on join condition
*/

/*
select c.ContactName, c.City, o.OrderDate, o.ShipPostalCode,od.UnitPrice,od.Quantity,p.ProductName
from Customers c inner join orders o
on c.customerID = o.customerID
inner join [Order Details] od
on o.OrderID = od.OrderID
inner join products p 
on p.ProductID=od.ProductID
*/

-- Customer is left table, orders is right table 


/*
Left join will get all the records from left table 
but only matching records from right table.
For non matching records of left table,
right table returns null
*/

/*
select c.ContactName, c.City,o.OrderDate,o.OrderID
from
Customers c left join orders o
on c.customerID = o.customerID
where o.OrderID is null
*/

/*
Right join will fetch all records from right table but matching records from left table.
For all non matching records of right table, left table will return null
*/


/*
Select c.ContactName, c.city, o.OrderDate, o.OrderID
from orders o right join customers c
on o.CustomerID = c.CustomerID
where o.OrderID is null
*/

/*
full outer join
*/

/*
Self join is used to join a table with itself. 
Create 2 alias of same table, then use them in join condition
*/

/*
Select e.Firstname as 'empName', isNull(m.FirstName,'N/A') as 'manager'
from 
Employees e left join employees m
on e.ReportsTo = m.EmployeeID
*/

/*
Cross join will get match all left and the right table
*/
/*
Identifier Rules
Start with alphabets only
No Spaces
Do not name with keywords
@ is local variable
@@ is global variable (never create for yourself)
*/

/*
declare @i datetime
select @i=GETDATE()
print @i
*/


/*declare @a int, @b int
set @a=5
set @b=10
print @a+@b
*/

/*
difference
char vs varchar
varcar vs nvarchar
char vs nvarchar
*/

/*
Learn flow control
*/

/*
declare @x int =30
if @x%2=0
	begin
		print 'even number'
	end
	else
	begin
	print 'odd number'
	end
*/

/* cant give whole column to value, only 1 value*/
declare @customerCity nvarchar(15)
Select @customerCity=city from Employees where EmployeeID = 2
print @customerCity