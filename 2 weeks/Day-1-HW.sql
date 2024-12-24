use AdventureWorks2022
go

/*
1.
*/
Select p.ProductID,p.Name, p.Color, p.ListPrice
from Production.Product p
go

/*
2.
*/
Select p.ProductID,p.Name, p.Color, p.ListPrice
from Production.Product p
where p.ListPrice !=0
go

/*
3.
*/
Select p.ProductID,p.Name, p.Color, p.ListPrice
from Production.Product p
where p.Color is Null
go

/*
4.
*/
Select p.ProductID,p.Name, p.Color, p.ListPrice
from Production.Product p
where p.Color is not Null
go

/*
5.
*/
Select p.ProductID,p.Name, p.Color, p.ListPrice
from Production.Product p
where 
p.Color is not Null 
and
p.ListPrice >0
go

/*
6.
*/
Select p.Name + ' ' + p.Color as 'NameAndColor'
from Production.Product p
where 
p.Color is not Null 
go

/*
7.
*/
Select 'NAME: '+p.Name + ' -- COLOR: ' + p.Color
from Production.Product p
where 
p.Name Like '%Crankarm%' 
OR
p.Name Like '%Chainring%' 
go

/*
8.
*/
Select p.ProductID , p.Name
from Production.Product p
where 
p.ProductID between 400 and 500 
go

/*
9.
*/
Select p.ProductID , p.Name, p.Color
from Production.Product p
where 
p.Color in ('black','blue')
go

/*
10.
*/
Select p.ProductID , p.Name
from Production.Product p
where 
p.Name Like 'S%'
go

/*
11.
*/
Select  p.Name,p.ListPrice
from Production.Product p
where 
p.Name Like 'S%'
order by p.Name asc
go

/*
12.
*/
Select  p.Name,p.ListPrice
from Production.Product p
where 
p.Name Like '[A,S]%'
order by p.Name asc
go

/*
13.
*/
Select  p.Name
from Production.Product p
where 
p.Name Like 'SPO%'
and
p.Name not Like 'SPOK%'
order by p.Name asc
go

/*
14.
*/
Select Distinct p.Color
from Production.Product p
order by p.Color desc
go