-- 1.
select count(p.ProductID)
from Production.Product as p

-- 2.
select count(p.ProductID)
from production.Product as p
where p.ProductSubcategoryID is not null

-- 3.
select p.ProductSubcategoryID , count(p.ProductID) as CountedProducts
from production.Product as p
group by p.ProductSubcategoryID
having ProductSubcategoryID is not Null

-- 4.
select count(p.ProductID)
from production.Product as p
where p.ProductSubcategoryID is null

-- 5.
select sum(p.Quantity)
from Production.ProductInventory as p

-- 6.
select dt.ProductID, dt.TheSum
from
(select p.ProductID, sum(p.Quantity) as TheSum
from Production.ProductInventory as p
group by p.ProductID) dt
where TheSum<100

-- 7.
select dt.Shelf, dt.ProductID, dt.TheSum
from
(select p.Shelf, p.ProductID, sum(p.Quantity) as TheSum
from Production.ProductInventory as p
group by p.Shelf,p.ProductID) dt
where TheSum<100

-- 8.
select avg(p.Quantity)
from Production.ProductInventory as p
where p.LocationID=10

-- 9.
select p.ProductID,p.Shelf,avg(p.Quantity) as TheAvg
from Production.ProductInventory as p
group by p.ProductID,p.Shelf

-- 10.
select p.ProductID,p.Shelf,avg(p.Quantity) as TheAvg
from Production.ProductInventory as p
group by p.ProductID,p.Shelf
having p.Shelf != 'N/A'

-- 11.
select p.Color, p.Class ,count(p.ListPrice),avg(p.ListPrice) as AvgPrice
from Production.Product as p
group by p.Color,p.Class
having p.Color is not Null and p.Class is not Null

-- 12.
select c.Name as Country, s.Name as Province
from Person.CountryRegion c
inner join Person.StateProvince s
on s.CountryRegionCode = c.CountryRegionCode


-- 13.
select c.Name as Country, s.Name as Province
from Person.CountryRegion c
inner join Person.StateProvince s
on s.CountryRegionCode = c.CountryRegionCode
where c.Name in ('Germany','Canada')

--14.
select distinct p.ProductID, p.ProductName
from Products as p
INNER JOIN [Order Details] as od 
on p.ProductID = od.ProductID
INNER JOIN Orders as o 
on od.OrderID = o.OrderID
where o.OrderDate >= dateadd(year, -27, getdate());

--15.
select top 5 c.PostalCode as ZipCode, count(od.ProductID) as TotalProductsSold
from Customers as c
INNER JOIN Orders as o 
on c.CustomerID = o.CustomerID
INNER JOIN [Order Details] as od 
on od.OrderID = o.OrderID
group by c.PostalCode
having c.PostalCode is not null
order by TotalProductsSold desc

select * from Customers
select * from Orders
select * from [Order Details]