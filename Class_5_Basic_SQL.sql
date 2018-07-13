/*NOTES AFTER REVIEWING THE CLASS VEDIO

----TOP WITH TIES






----- OFFSET with FETCH

		select *
		from TableName
		order by [column]
		offset n rows        ##select rows from n + 1 onwards to 
		fetch next m rows only ## the next m numbers of rows starting from n+1 


-----CASE-------
conditional branching statement means check the conditions and go to the next statement if the case in not true
example 
		select [column]
			case 
				when [coumn] = 'a' then 'somethingelse'   ##we can add any logical/conditions statements here, AND OR NOT can be implemented 
				when [coumn] = 'a' then 'somethingelse'
				when [coumn] = 'a' then 'somethingelse'
				when [coumn] = is null then 'somethingelse'
				else 'undefined'
			
			end as [NewDynamicColumnNmame]
		from TableName 

		*****if cannot be used here. case is the only branching statement used in the select statement 
		******open row set is a syntax we used to import excel files into database 

		
--------COALESCE -----------------
is a function which accepts n number of parameters and the output is the first not null input parameter. if all the input is null, the coalesce function will give us a null value. 

example 

	select * coalesce(hourly*40*52,salary, commission*num_sales)
	from TableName
	
this can be done using case statement as follow
		select *
			case 
				when hourly is not null then hourly*40*52
				when salary is not null then salary
				when commission is not null then commission*num_sales
				else 'null'
			end as [newdyanamicColumnName]
		
		from

		
---------NULLIF----------------------------
accepts two parameters 
example 
		select [column1],[column2],nullif(column1,column2)
		from TableName
		

----ISDATE -------------------------------

used to check where the date format is valid 
 select 
 from TableName
 where isdate(column) = 0  #this checks if there is an invalid date format. if there is an invalid date format it will return zero.
 
 getdate() give the current system date and time 
 
 
 
 -----ISNUMERIC-----------------
 
 select *
 from TableName
 where isnumeric(colunm) = 0 
 
 
 ------COUNT-------------------------
 its is part of an aggregate functions(aggregate functions are sum, absolute,count,average,)
 
 gives the total number of record satisfied by the select statement 
 
 example 
	select count(*) as 'COUNTCOLUMN'
	
	from TableName
	where [colunm] = something
	
----Row constractor/Table-Valued Constructor) --------
CERTIFICATION QUESTION
max rows you can create in row constructor is 1000. This limitation is one of the drawback of using this. This is not really used.

select *
from ((),
	(),
	()

	) as NameofNewTable ([NewColumn1],[NewColumn2])
	
	
---------------CAST and CONVERT functions--------------------
convert function is used to convert one data type to another and to convert one date formate to another date formate 
example 
	select [column1], convert (varchar(20),date,ConversionCode)  ##there is a conversion code to refer or to be aware of during date formate conversion 
	from TableName
	

		
*/
--Offset with fetch 
select *
from HumanResources.EmployeePayHistory
order by rate desc 
OFFSET 9 ROWS
FETCH NEXT 6 ROWS ONLY;

--Offset with fetch 
select *
from HumanResources.EmployeePayHistory
order by rate desc 
OFFSET 9 ROWS


select *
from HumanResources.EmployeePayHistory
where PayFrequency = 1
order by rate desc 
OFFSET 9 ROWS
FETCH NEXT 6 ROWS ONLY;

------------------Case Statement ------------------------
--Display all products with product line description 
select ProductID, [name], ProductLine,
	case
		when ProductLine = 'r' then 'Road'
		when ProductLine = 's' then 'Sports'
		when ProductLine = 'm' then 'Mountain'
		else 'Not Defined' 
	end as 'ProductLineDesc'
from Production.Product

select ProductID, [name], ProductLine,
	case
		when ProductLine = 'r' or ProductLine = 'rd' then 'Road'
		when ProductLine = 's' or ProductLine = 'sp' then 'Sports'
		when ProductLine = 'm' then 'Mountain'
		when ProductLine is null then 'Undefined'
		else 'Could not find a description' 
	end as 'ProductLineDesc'
from Production.Product


select ProductID, [name], ProductLine,
	case ProductLine
		when 'r' then 'Road'
		when 's' then 'Sports'
		when 'm' then 'Mountain'
		else 'Not Defined' 
	end as 'ProductLineDesc'
from Production.Product

-----------------------COALESCE-------------------------
CREATE TABLE dbo.wages
(
    emp_id        tinyint   identity,
    hourly_wage   decimal   NULL,
    salary        decimal   NULL,
    commission    decimal   NULL,
    num_sales     tinyint   NULL
)

INSERT dbo.wages (hourly_wage, salary, commission, num_sales)
VALUES
    (10.00, NULL, NULL, NULL),
    (20.00, NULL, NULL, NULL),
    (30.00, NULL, NULL, NULL),
    (40.00, NULL, NULL, NULL),
    (NULL, 10000.00, NULL, NULL),
    (NULL, 20000.00, NULL, NULL),
    (NULL, 30000.00, NULL, NULL),
    (NULL, 40000.00, NULL, NULL),
    (NULL, NULL, 15000, 3),
    (NULL, NULL, 25000, 2),
    (NULL, NULL, 20000, 6),
    (NULL, NULL, 14000, 4);


select *, COALESCE(hourly_wage * 40 * 52, salary,  commission * num_sales) 
from dbo.wages

select *, 
	case
		when hourly_wage is not null then hourly_wage * 40 * 52
		when salary is not null  then salary
		when commission is not null and num_sales is not null then commission * num_sales
		else null 
	end as 'Wages'
from dbo.wages

select *, COALESCE(hourly_wage * 40 * 52, salary + (commission * num_sales),  salary,  commission * num_sales) as 'YealySalary'
from dbo.wages

--------------------NULLIF-----------------------
select UnitPrice,LineTotal, NULLIF(UnitPrice,LineTotal) 
from Sales.SalesOrderDetail

-------------------ISDATE------------------------
select *
from sales.SalesOrderHeader 
where isdate(orderdate) = 0

select isdate('12/12/2018')

-----------------ISNUMERIC -----------------------
select *
from person.[Address]
where ISNUMERIC(postalcode) = 1

select *
from person.[Address]
where ISNUMERIC(postalcode) = 0

select *
from person.[Address]
where PostalCode like '[0-9][0-9][0-9][0-9][0-9]' 

select *
from person.[Address]
where ISNUMERIC(postalcode) = 1 and len(postalcode) = 5

select *
from person.[Address]
where  len(postalcode) = 20

select *
from person.[Address]
where PostalCode like '%[a-z]%'

select *
from person.[Address]
where PostalCode like '[a-z][0-9]%'

----------------Count ------------------------------
--count, avg, min, max, sum, abs

select count(*) as 'rec_count' 
from Production.Product
where color = 'red'

select count(distinct Title)
from HumanResources.Employee

-----Row Constructor (or Table-Valued Constructor)----
--	One limitation of the row constructor is the maximum number of rows that can be 
--	inserted, which is 1000 rows.
SELECT * 
FROM (VALUES ('USD', 'U.S. Dollar'),
             ('EUR', 'Euro'),
             ('CAD', 'Canadian Dollar'),
             ('JPY', 'Japanese Yen')
     ) AS [Currency] ( [CurrencyCode], [CurrencyName] )

------------Cast & Convert Function ----------------------
select cast(ProductID as varchar(10)) + ' - ' + [name] + ' - ' + ProductNumber
from Production.Product

select SalesOrderID, convert(varchar(20), OrderDate, 100), CustomerID 
from sales.SalesOrderHeader

select SalesOrderID, convert(date, OrderDate, 101), CustomerID 
from sales.SalesOrderHeader
--https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017



--SQL Execution order
	--1.FROM
	--2.INNER
	--3.OUTER
	--4.WHERE
	--5.GROUP
	--6.HAVING
	--7.SELECT
	--8.DISTINCT
	--9.ORDER BY 
	--10.TOP - Offset/Fetch











 

