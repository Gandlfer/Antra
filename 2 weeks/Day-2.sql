/*
Single row subquery
select * from customers where city = 
(select city from customers where ContactName = 'Thomas Hardy'
)
*/

-- list of customers who never placed any order

--list of customers ids who placed order
-- get customers ids from customer table and remove result given by inner query

/* multiple row subquery
select * from customers where customerid not in
(select distinct customerid from Orders)
*/

/*
correlated subquery
*/

/*
select c.City, c.CompanyName, c.ContactName,c.CustomerID
from customers c
*/

-- Group function
-- Agregate function sum,count, avg,min,max
-- select sum(unitprice),min(unitprice),max(unitprice), avg(unitprice), count(unitprice) from products

-- select count(region) from employees
-- count(*) will give total number of rows in table
-- count(column name) will give total number of not null values

-- select count(1) from employees
/*
select SupplierID, categoryId, max(unitprice) as 'maxprice' from products
group by SupplierID, CategoryID
*/

/*
select city,country, count(customerid)
from customers
group by city,country
having count(customerid)>2
*/

/*
select count(o.orderid), c.ContactName,c.City
from customers c
left join orders o
on c.customerID=o.customerID
Group by c.contactName,c.City
*/
/*
Derived Table
select productid,productname from
(select * from products)dt
*/
/*
select c.CompanyName,c.ContactName,c.City,dt.total
from customers c left join
(select count(customerid) as total,customerid
from orders
group by customerid)dt
on c.CustomerID = dt.CustomerID
*/

/*
select c.CompanyName, c.city,c.country,
(select count(orderid)as 'total' from orders o where 
o.CustomerID=c.CustomerID group by o.customerid)
from customers c
*/

/*
select * from 
(select productid,productname,unitprice, 
dense_rank() over(order by unitprice desc) rnk
from products) dt
where dt.rnk = 11
*/

/*
select * from
(select productid, productname, unitprice,supplierid ,
dense_rank() over(partition by supplierid order  by unitprice desc ) rnk
from products) dt
where dt.rnk=1
*/

/*
union vs union all
union will remove duplicates but union all will no
union will sort the resultset based on the first column but union all will not
union all will be faster than union
union all can be used in recursive cte but union can not

similarities
they both need same number of columns in each query
order by must be writtin in the last select statement
column aliases must be written in the first select statement
*/

/*
select city as 'Location',country from Employees
union
select city, country from Customers order by city
*/

/*
create view vwCustomerOrderDetails
as 
select c.ContactName, c.CompanyName,c.City, c.Country, 
o.OrderDate,p.productName,
od.Quantity,od.UnitPrice,od.Discount,(od.UnitPrice-od.Discount)*od.Quantity as 'TotalPrice',
e.FirstName+ ' ' +e.LastName as EmpName
from customers c inner join orders o
on c.CustomerID = o.CustomerID
inner join [Order Details] od on
o.OrderID= od.OrderID
inner join products p
on od.ProductID=p.ProductID
inner join Employees e
on o.EmployeeID = e.EmployeeID
*/

--select * from vwCustomerOrderDetails

/*
alter view vwCustomerOrderDetails
as 
select c.ContactName, c.CompanyName,c.City, c.Country, c.Phone,
o.OrderDate,p.productName,
od.Quantity,od.UnitPrice,od.Discount,(od.UnitPrice-od.Discount)*od.Quantity as 'TotalPrice',
e.FirstName+ ' ' +e.LastName as EmpName
from customers c inner join orders o
on c.CustomerID = o.CustomerID
inner join [Order Details] od on
o.OrderID= od.OrderID
inner join products p
on od.ProductID=p.ProductID
inner join Employees e
on o.EmployeeID = e.EmployeeID
*/

