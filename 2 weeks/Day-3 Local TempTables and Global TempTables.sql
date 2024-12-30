--scope 2

-- Local temptable stays within the scope/session
-- create table #emp(id int, ename varchar(40), salary decimal)

-- insert into #emp values (1,'scott',6000)

-- select * from #emp

-- Drop table #emp

-- Global temptable

-- create table ##emp(id int, ename varchar(40), salary decimal)

-- create table #dept(id int,dname varchar(40))
/*
	Local temptable can have same names as other local temptables
	Global temptable cannot have the same names as other global templates
	All temptables will be closed when the scope is closed
	There are hashes in local temptable  to identify unique

	Avoid using temp tables
	- Can cause deadlocks
	- Cant be access again

	But if needed
	When to use
	Avoid using global temp because 2 simultanious people will use it, keeps creating global
	Only use localtemp when very large datasets
*/