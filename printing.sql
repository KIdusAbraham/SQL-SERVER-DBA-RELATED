
The SQL Syntax

SQL was designed to be entered on a console and results would display back to a screen.

Today, SQL is mostly used by programmers who use SQL inside their language to build applications that access data in a database.


Four fundamental operations that apply to any database are:


Read the data  --  SELECT
Insert new data  --  INSERT
Update existing data  --  UPDATE
Remove data  --  DELETE

Collectively these are referred to as CRUD (Create, Read, Update, Delete).

The general form for each of these 4 operations in SQL is presented next.



The SQL SELECT general form
SELECT column-names
FROM table-name
WHERE condition
ORDER BY sort-order

Example: 
SELECT FirstName, LastName, City, Country 
FROM Customer
WHERE City = 'Paris'
ORDER BY LastName



The SQL INSERT general form
INSERT table-name (column-names)
VALUES (column-values)

Example: 
INSERT Supplier (Name, ContactName, City, Country)
VALUES ('Oxford Trading', 'Ian Smith', 'Oxford', 'UK')



The SQL UPDATE general form
UPDATE table-name
SET column-name = column-value
WHERE condition

Example: 
UPDATE OrderItem
SET Quantity = 2
WHERE Id = 388



The SQL DELETE general form
DELETE table-name
WHERE condition

Example: 
DELETE Customer
WHERE Email = 'alex@gmail.com'



---------------------------------------------------------------------------------------------------------------------
The SQL SELECT syntax

The general syntax is: 
SELECT column-names
  FROM table-name

To select all columns use *
SELECT *
  FROM table-name


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

SQL SELECT Examples


Problem: List all customers
SELECT *
  FROM Customer


Results:  91 records 

Id	FirstName	LastName	City	Country	Phone
1	Maria	Anders	Berlin	Germany	030-0074321
2	Ana	Trujillo	México D.F.	Mexico	(5) 555-4729
3	Antonio	Moreno	México D.F.	Mexico	(5) 555-3932
4	Thomas	Hardy	London	UK	(171) 555-7788
5	Christina	Berglund	Luleå	Sweden	0921-12 34 65



CUSTOMER
Id
FirstName
LastName
City
Country
Phone

Problem: List the first name, last name, and city of all customers
SELECT FirstName, LastName, City
  FROM Customer

  
  ----------------------------------------------------------------------------------------------------------------

The SQL WHERE syntax

A WHERE clause with a SELECT statement: 
SELECT column-names
  FROM table-name
 WHERE condition

A WHERE clause with an UPDATE statement:
UPDATE table-name
   SET column-name = value
 WHERE condition

A WHERE clause with a DELETE statement:
DELETE table-name
 WHERE condition


CUSTOMER
Id
FirstName
LastName
City
Country
Phone
SQL WHERE Clause Examples


Problem: List the customers in Sweden 

SELECT Id, FirstName, LastName, City, Country, Phone
  FROM Customer
 WHERE Country = 'Sweden'


Results:  2 records 

Id	FirstName	LastName	City	Country	Phone
5	Christina	Berglund	Luleå	Sweden	0921-12 34 65
24	Maria	Larsson	Bräcke	Sweden	0695-34 67 21


SUPPLIER
Id
CompanyName
ContactName
City
Country
Phone
Fax

Problem: Update the city to Sydney for supplier Pavlova, Ltd. 
UPDATE Supplier
   SET City = 'Sydney'
 WHERE Name = 'Pavlova, Ltd.'


Results: 1 record updated. 



PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued

Problem: Delete all products with unit price higher than $50. 
DELETE FROM Product
 WHERE UnitPrice > 50


Results: 7 records deleted. 

Note: Referential integrity may prevent this deletion. 
A better approach may be to discontinue the product, that is, set IsDiscontinued to true.


---------------------------------------------------------------------------------------------------------------------
The SQL INSERT INTO syntax

The general syntax is: 
INSERT INTO table-name (column-names) 
VALUES (values) 


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

SQL INSERT INTO Examples



Problem: Add a record for a new customer
INSERT INTO Customer (FirstName, LastName, City, Country, Phone)
VALUES ('Craig', 'Smith', 'New York', 'USA', 1-01-993 2800)


Results: 1 new record inserted 


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

Problem: Add a new customer named Anita Coats to the database
INSERT INTO Customer (FirstName, LastName)
VALUES ('Anita', 'Coats')


Results: 1 new record inserted 




The SQL INSERT combined with a SELECT

The general syntax is: 
INSERT INTO table-name (column-names) 
SELECT column-names
  FROM table-name
 WHERE condition


SUPPLIER
Id
CompanyName
ContactName
City
Country
Phone
Fax
CUSTOMER
Id
FirstName
LastName
City
Country
Phone


SQL INSERT INTO with SELECT Example



Problem: The Bigfoot Brewery supplier is also a customer. 
Add a customer record with values from the supplier table.
INSERT INTO Customer (FirstName, LastName, City, Country, Phone)
SELECT LEFT(ContactName, CHARINDEX(' ',ContactName) - 1), 
       SUBSTRING(ContactName, CHARINDEX(' ',ContactName) + 1, 100), 
       City, Country, Phone
  FROM Supplier
 WHERE CompanyName = 'Bigfoot Breweries'

Note: ContactName is parsed into FirstName and LastName.
Parsing takes place with built-in functions: LEFT, SUBSTRING, and CHARINDEX.

Results: 1 new record inserted 

-------------------------------------------------------------------------------------------------------------

The SQL UPDATE syntax

The general syntax is: 
UPDATE table-name 
   SET column-name = value, column-name = value, ...

To limit the number of records to UPDATE append a WHERE clause:
UPDATE table-name 
   SET column-name = value, column-name = value, ...
 WHERE condition


PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued

SQL UPDATE Examples


Problem: discontinue all products in the database
UPDATE Product
   SET IsDiscontinued = 1

Note: the value 1 denotes true. 

Results: 77 records updated. 



PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued



Problem: Discontinue products over $50.
UPDATE Product
   SET IsDiscontinued = 1
 WHERE UnitPrice > 50

Note: the value 1 denotes true. 

Results: 7 records updated. 



PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued



Problem: Discontinue product with Id = 46.
UPDATE Product
   SET IsDiscontinued = 1
 WHERE Id = 46

This is a more common scenario in which a single record is updated.
Note: the value 1 denotes true. 

Results: 1 record updated. 

SUPPLIER
Id
CompanyName
ContactName
City
Country
Phone
Fax



Problem: Supplier Norske Meierier (Id = 15) has moved: update their city, phone and fax.
UPDATE Supplier
   SET City = 'Oslo', Phone = '(0)1-953530', Fax = '(0)1-953555'
 WHERE Id = 15

This is a common scenario in which a single record is updated.


Results: 1 record updated. 

------------------------------------------------------------------------------------------------------------------
The SQL DELETE syntax

The general syntax is: 
DELETE table-name 

To delete specific records append a WHERE clause:
DELETE table-name 
 WHERE condition


PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued

SQL DELETE Examples


Problem: Delete all products.
DELETE Product



Results: 77 records deleted. 



PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued



Problem: Delete products over $50.
DELETE Product
 WHERE UnitPrice > 50



Results: 7 records deleted. 



CUSTOMER
Id
FirstName
LastName
City
Country
Phone



Problem: Delete customer with Id = 21.
DELETE Customer
 WHERE Id = 21

This is a more common scenario in which a single record is deleted.


Results: 1 record deleted. 

--------------------------------------------------------------------------------------------------------------

The SQL ORDER BY syntax

The general syntax is: 
SELECT column-names
  FROM table-name
 WHERE condition
 ORDER BY column-names


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

SQL ORDER BY Examples


Problem: List all suppliers in alphabetical order
SELECT CompanyName, ContactName, City, Country
  FROM Supplier
 ORDER BY CompanyName

The default sort order is ascending, that is, low-high or a-z. 

Results: 29 records 

Id	CompanyName	ContactName	City	Country
18	Aux joyeux ecclésiastiques	Guylène Nodier	Paris	France
16	Bigfoot Breweries	Cheryl Saylor	Bend	USA
5	Cooperativa de Quesos 'Las Cabras'	Antonio del Valle Saavedra	Oviedo	Spain
27	Escargots Nouveaux	Marie Delamare	Montceau	France
1	Exotic Liquids	Charlotte Cooper	London	UK




CUSTOMER
Id
FirstName
LastName
City
Country
Phone



Problem: List all suppliers in reverse alphabetical order
SELECT CompanyName, ContactName, City, Country
  FROM Supplier
 ORDER BY CompanyName DESC

The keyword DESC denotes descending, i.e., reverse order. 

Results: 29 records 

Id	CompanyName	ContactName	City	Country
22	Zaanse Snoepfabriek	Dirk Luchte	Zaandam	Netherlands
4	Tokyo Traders	Yoshi Nagase	Tokyo	Japan
17	Svensk Sjöföda AB	Michael Björn	Stockholm	Sweden
8	Specialty Biscuits, Ltd.	Peter Wilson	Manchester	UK
10	Refrescos Americanas LTDA	Carlos Diaz	Sao Paulo	Brazil



CUSTOMER
Id
FirstName
LastName
City
Country
Phone



Problem: List all customers ordered by country, then by city within each country
Ordering by one or more columns is possible.
SELECT FirstName, LastName, City, Country
  FROM Customer
 ORDER BY Country, City


Results: 91 records 

Id	FirstName	LastName	City	Country
12	Patricio	Simpson	Buenos Aires	Argentina
54	Yvonne	Moncada	Buenos Aires	Argentina
64	Sergio	Gutiérrez	Buenos Aires	Argentina
20	Roland	Mendel	Graz	Austria
59	Georg	Pipps	Salzburg	Austria
50	Catherine	Dewey	Bruxelles	Belgium
76	Pascale	Cartrain	Charleroi	Belgium




SUPPLIER
Id
CompanyName
ContactName
City
Country
Phone
Fax



Problem: List all suppliers in the USA, Japan, and Germany, ordered by city, 
then by company name in reverse order
SELECT Id, CompanyName, City, Country
  FROM Supplier
 WHERE Country IN ('USA', 'Japan', 'Germany')
 ORDER BY Country ASC, CompanyName DESC


This shows that you can order by more than one column.
ASC denotes ascending, but is optional as it is the default sort order. 


Results: 9 records 

Id	CompanyName	City	Country
12	Plutzer Lebensmittelgroßmärkte AG	Frankfurt	Germany
13	Nord-Ost-Fisch Handelsgesellschaft mbH	Cuxhaven	Germany
11	Heli Süßwaren GmbH & Co. KG	Berlin	Germany
4	Tokyo Traders	Tokyo	Japan
6	Mayumi's	Osaka	Japan
2	New Orleans Cajun Delights	New Orleans	USA
19	New England Seafood Cannery	Boston	USA
3	Grandma Kelly's Homestead	Ann Arbor	USA
16	Bigfoot Breweries	Bend	USA



ORDER
Id
OrderDate
OrderNumber
CustomerId
TotalAmount



Problem: Show all orders, sorted by total amount, the largest first, within each year 
SELECT Id, OrderDate, CustomerId, TotalAmount
  FROM [Order]
 ORDER BY YEAR(OrderDate) ASC, TotalAmount DESC

Note: DESC means descending, but is optional as it is the default sort order.
[Order] must be bracketed because it also is a keywork in SQL. 
Results: 830 records. 

Id	OrderDate	CustomerId	TotalAmount
125	2012-12-04 00:00:00.000	62	12281.20
106	2012-11-13 00:00:00.000	59	10741.60
113	2012-11-22 00:00:00.000	7	7390.20

144	2012-12-23 00:00:00.000	17	86.40
24	2012-08-01 00:00:00.000	75	48.00
177	2013-01-23 00:00:00.000	51	11493.20
170	2013-01-16 00:00:00.000	73	11283.20

560	2013-12-31 00:00:00.000	27	18.40
535	2013-12-17 00:00:00.000	12	12.50
618	2014-02-02 00:00:00.000	63	17250.00
783	2014-04-17 00:00:00.000	71	16321.90


Notice the year breakpoints: 2012 - 2013 and 2013 - 2014. Each year starts with the highest TotalAmounts.
This shows that other data types, such as numbers, dates, and bits can also be sorted.
Note: YEAR is a built-in function which returns the year from a date.

---------------------------------------------------------------------------------------------

The SQL SELECT TOP syntax

The general syntax is: 
SELECT TOP n column-names
  FROM table-name


PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued

SQL SELECT TOP



Problem: List top 10 most expensive products
SELECT TOP 10 Id, ProductName, UnitPrice, Package
  FROM Product
 ORDER BY UnitPrice DESC


Results: 10 records. 

Id	ProductName	UnitPrice	Package
38	Côte de Blaye	263.50	12 - 75 cl bottles
29	Thüringer Rostbratwurst	123.79	50 bags x 30 sausgs.
9	Mishi Kobe Niku	97.00	18 - 500 g pkgs.
20	Sir Rodneys Marmalade	81.00	30 gift boxes
18	Carnarvon Tigers	62.50	16 kg pkg.
59	Raclette Courdavault	55.00	5 kg pkg.
51	Manjimup Dried Apples	53.00	50 - 300 g pkgs.
62	Tarte au sucre	49.30	48 pies
43	Ipoh Coffee	46.00	16 - 500 g tins
28	Rössle Sauerkraut	45.60	25 - 825 g cans


--------------------------------------------------------------------------------------------------

The SQL ORDER BY OFFSET syntax

The general syntax to exclude first n records is: 
SELECT column-names
  FROM table-name
 ORDER BY column-names
OFFSET n ROWS

To exclude first n records and return only the next m records:
SELECT column-names
  FROM table-name
 ORDER BY column-names
OFFSET n ROWS
 FETCH NEXT m ROWS ONLY

This will return only record (n + 1) to (n + 1 + m). See example below. 

PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued

SQL OFFSET-FETCH Examples



Problem: Get all but the 10 most expensive products sorted by price
SELECT Id, ProductName, UnitPrice, Package
  FROM Product
 ORDER BY UnitPrice DESC
OFFSET 10 ROWS


Results: 68 records. 

Id	ProductName	UnitPrice	Package
27	Schoggi Schokolade	43.90	100 - 100 g pieces
63	Vegie-spread	43.90	15 - 625 g jars
8	Northwoods Cranberry Sauce	40.00	12 - 12 oz jars
17	Alice Mutton	39.00	20 - 1 kg tins
12	Queso Manchego La Pastora	38.00	10 - 500 g pkgs.



PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued

Problem: Get the 10th to 15th most expensive products sorted by price
SELECT Id, ProductName, UnitPrice, Package
FROM Product
ORDER BY UnitPrice DESC
OFFSET 10 ROWS
FETCH NEXT 5 ROWS ONLY


Results: 5 records 

Id	ProductName	UnitPrice	Package
27	Schoggi Schokolade	43.90	100 - 100 g pieces
63	Vegie-spread	43.90	15 - 625 g jars
8	Northwoods Cranberry Sauce	40.00	12 - 12 oz jars
17	Alice Mutton	39.00	20 - 1 kg tins
12	Queso Manchego La Pastora	38.00	10 - 500 g pkgs.



-----------------------------------------------------------------------------------------------------------
The SQL SELECT DISTINCT syntax

The general syntax is: 
SELECT DISTINCT column-name
  FROM table-name

Can be used with COUNT and other aggregates
SELECT COUNT (DISTINCT column-name)
  FROM table-name


SUPPLIER
Id
CompanyName
ContactName
City
Country
Phone
Fax


SQL SELECT Examples



Problem: List all supplier countries in alphabetical order.
SELECT DISTINCT Country
  FROM Supplier
ORDER BY COUNTRY


Results: 16 rows 

Country
Australia
Brazil
Canada
Denmark



SUPPLIER
Id
CompanyName
ContactName
City
Country
Phone
Fax


Problem: List the number of supplier countries
SELECT COUNT (DISTINCT Country)
  FROM Supplier


Results: 

Count
16

-------------------------------------------------------------------------------------
The SQL SELECT MIN and MAX syntax

The general MIN syntax is:
SELECT MIN(column-name)
  FROM table-name

The general MAX syntax is: 
SELECT MAX(column-name)
  FROM table-name


PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued


Problem: Find the cheapest product
SELECT MIN(UnitPrice)
  FROM Product


Results: 

UnitPrice
2.50


ORDER
Id
OrderDate
OrderNumber
CustomerId
TotalAmount

SQL SELECT MAX and MIN Examples



Problem: Find the largest order placed in 2014
SELECT MAX(TotalAmount)
  FROM [Order]
 WHERE YEAR(OrderDate) = 2014


Results: 

TotalAmount
17250.00


ORDER
Id
OrderDate
OrderNumber
CustomerId
TotalAmount




Problem: Find the last order date in 2013
SELECT MAX(OrderDate)
  FROM [Order]
 WHERE YEAR(OrderDate) = 2013

MIN and MAX can also be used with numeric and date types. 
Results: 

OrderDate
2013-12-31 00:00:00.000

-----------------------------------------------------------------------------------------------------------------

The SQL SELECT COUNT, SUM, and AVG syntax

The general COUNT syntax is: 
SELECT COUNT(column-name)
  FROM table-name

The general SUM syntax is:
SELECT SUM(column-name)
  FROM table-name

The general AVG syntax is:
SELECT AVG(column-name)
  FROM table-name


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

SQL SELECT COUNT, SUM, and AVG Examples



Problem: Find the number of customers
SELECT COUNT(Id)
  FROM Customer


Results: 

Count
91


ORDER
Id
OrderDate
OrderNumber
CustomerId
TotalAmount


Problem: Compute the total amount sold in 2013
SELECT SUM(TotalAmount)
  FROM [Order]
 WHERE YEAR(OrderDate) = 2013


Results: 

Sum
658388.75


ORDER
Id
OrderDate
OrderNumber
CustomerId
TotalAmount


Problem: Compute the average size of all orders
SELECT AVG(TotalAmount)
  FROM [Order]


Results: 

Average
1631.877819

----------------------------------------------------------------------------------------------
The WHERE with AND, OR, NOT syntax

A WHERE clause with AND: 
SELECT column-names
  FROM table-name
 WHERE condition1 AND condition2

A WHERE clause with OR:
UPDATE table-name
   SET column-name = value
 WHERE condition1 OR condition2

A WHERE clause with NOT:
DELETE table-name
 WHERE NOT condition


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

SQL WHERE with AND, OR, and NOT Examples


Problem: Get customer named Thomas Hardy 

SELECT Id, FirstName, LastName, City, Country
  FROM Customer
 WHERE FirstName = 'Thomas' AND LastName = 'Hardy'


Results: 1 record. 

Id	FirstName	LastName	City	Country
4	Thomas	Hardy	London	UK


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

Problem: List all customers from Spain or France
SELECT Id, FirstName, LastName, City, Country
  FROM Customer
 WHERE Country = 'Spain' OR Country = 'France'


Results: 16 records. 

Id	FirstName	LastName	City	Country
7	Frédérique	Citeaux	Strasbourg	France
8	Martín	Sommer	Madrid	Spain
9	Laurence	Lebihan	Marseille	France
18	Janine	Labrune	Nantes	France
22	Diego	Roel	Madrid	Spain
23	Martine	Rancé	Lille	France


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

Problem: List all customers that are not from the USA
SELECT Id, FirstName, LastName, City, Country
  FROM Customer
 WHERE NOT Country = 'USA'


Results: 78 records. 

Id	FirstName	LastName	City	Country
1	Maria	Anders	Berlin	Germany
2	Ana	Trujillo	México D.F.	Mexico
3	Antonio	Moreno	México D.F.	Mexico
4	Thomas	Hardy	London	UK
5	Christina	Berglund	Luleå	Sweden
6	Hanna	Moos	Mannheim	Germany
7	Frédérique	Citeaux	Strasbourg	France



ORDER
Id
OrderDate
OrderNumber
CustomerId
TotalAmount

Problem: List all orders that not between $50 and $15000
SELECT Id, OrderDate, CustomerId, TotalAmount
  FROM [Order]
 WHERE NOT (TotalAmount >= 50 AND TotalAmount <= 15000)
 ORDER BY TotalAmount DESC


Results: 16 records. 

Id	OrderDate	CustomerId	TotalAmount
618	2/2/2014 12:00:00 AM	63	17250.00
783	4/17/2014 12:00:00 AM	71	16321.90
734	3/27/2014 12:00:00 AM	34	15810.00
175	1/22/2013 12:00:00 AM	27	49.80
24	8/1/2012 12:00:00 AM	75	48.00


----------------------------------------------------------------------------------------------

The WHERE with AND, OR, NOT syntax

A WHERE clause with AND: 
SELECT column-names
  FROM table-name
 WHERE condition1 AND condition2

A WHERE clause with OR:
UPDATE table-name
   SET column-name = value
 WHERE condition1 OR condition2

A WHERE clause with NOT:
DELETE table-name
 WHERE NOT condition


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

SQL WHERE with AND, OR, and NOT Examples


Problem: Get customer named Thomas Hardy 

SELECT Id, FirstName, LastName, City, Country
  FROM Customer
 WHERE FirstName = 'Thomas' AND LastName = 'Hardy'


Results: 1 record. 

Id	FirstName	LastName	City	Country
4	Thomas	Hardy	London	UK


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

Problem: List all customers from Spain or France
SELECT Id, FirstName, LastName, City, Country
  FROM Customer
 WHERE Country = 'Spain' OR Country = 'France'


Results: 16 records. 

Id	FirstName	LastName	City	Country
7	Frédérique	Citeaux	Strasbourg	France
8	Martín	Sommer	Madrid	Spain
9	Laurence	Lebihan	Marseille	France
18	Janine	Labrune	Nantes	France
22	Diego	Roel	Madrid	Spain
23	Martine	Rancé	Lille	France


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

Problem: List all customers that are not from the USA
SELECT Id, FirstName, LastName, City, Country
  FROM Customer
 WHERE NOT Country = 'USA'


Results: 78 records. 

Id	FirstName	LastName	City	Country
1	Maria	Anders	Berlin	Germany
2	Ana	Trujillo	México D.F.	Mexico
3	Antonio	Moreno	México D.F.	Mexico
4	Thomas	Hardy	London	UK
5	Christina	Berglund	Luleå	Sweden
6	Hanna	Moos	Mannheim	Germany
7	Frédérique	Citeaux	Strasbourg	France



ORDER
Id
OrderDate
OrderNumber
CustomerId
TotalAmount

Problem: List all orders that not between $50 and $15000
SELECT Id, OrderDate, CustomerId, TotalAmount
  FROM [Order]
 WHERE NOT (TotalAmount >= 50 AND TotalAmount <= 15000)
 ORDER BY TotalAmount DESC


Results: 16 records. 

Id	OrderDate	CustomerId	TotalAmount
618	2/2/2014 12:00:00 AM	63	17250.00
783	4/17/2014 12:00:00 AM	71	16321.90
734	3/27/2014 12:00:00 AM	34	15810.00
175	1/22/2013 12:00:00 AM	27	49.80
24	8/1/2012 12:00:00 AM	75	48.00

-------------------------------------------------------------------------------------------
The SQL WHERE BETWEEN syntax

The general syntax is: 
SELECT column-names
  FROM table-name
 WHERE column-name BETWEEN value1 AND value2


PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued

SQL WHERE BETWEEN Examples



Problem: List all products between $10 and $20
SELECT Id, ProductName, UnitPrice
  FROM Product
 WHERE UnitPrice BETWEEN 10 AND 20
 ORDER BY UnitPrice


Results: 29 records. 



Id	ProductName	UnitPrice
3	Aniseed Syrup	10.00
21	Sir Rodneys Scones	10.00
74	Longlife Tofu	10.00
46	Spegesild	12.00
31	Gorgonzola Telino	12.50


PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued


Problem: List all products not between $10 and $100 sorted by price.
SELECT Id, ProductName, UnitPrice
  FROM Product
 WHERE UnitPrice NOT BETWEEN 5 AND 100
 ORDER BY UnitPrice


Results: 4 records. 



Id	ProductName	UnitPrice
33	Geitost	2.50
24	Guaraná Fantástica	4.50
29	Thüringer Rostbratwurst	123.79
38	Côte de Blaye	263.50
PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued


Problem: Get the number of orders and amount sold between Jan 1, 2013 and Jan 31, 2013.
SELECT COUNT(Id), SUM(TotalAmount)
  FROM [Order]
 WHERE OrderDate BETWEEN '1/1/2013' AND '1/31/2013'


Results: 



Count	TotalAmount
33	66692.80

------------------------------------------------------------------------------------------------------

The SQL WHERE IN syntax

The general syntax is: 
SELECT column-names
  FROM table-name
 WHERE column-name IN (values) 


PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued

SQL WHERE IN Examples



Problem: List all suppliers from the USA, UK, OR Japan
SELECT Id, CompanyName, City, Country
  FROM Supplier
 WHERE Country IN ('USA', 'UK', 'Japan')


Results: 8 records. 



Id	CompanyName	City	Country
1	Exotic Liquids	London	UK
2	New Orleans Cajun Delights	New Orleans	USA
3	Grandma Kelly's Homestead	Ann Arbor	USA
4	Tokyo Traders	Tokyo	Japan
6	Mayumi's	Osaka	Japan
8	Specialty Biscuits, Ltd.	Manchester	UK
16	Bigfoot Breweries	Bend	USA
19	New England Seafood Cannery	Boston	USA

PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued


Problem: List all products that are not exactly $10, $20, $30, $40, or $50
SELECT Id, ProductName, UnitPrice
  FROM Product
 WHERE UnitPrice NOT IN (10,20,30,40,50)


Results: 72 records. 



Id	ProductName	UnitPrice
1	Chai	18.00
2	Chang	19.00
4	Chef Antons Cajun Seasoning	22.00
5	Chef Antons Gumbo Mix	21.35
6	Grandmas Boysenberry Spread	25.00

SUPPLIER
Id
CompanyName
ContactName
City
Country
Phone
Fax
CUSTOMER
Id
FirstName
LastName
City
Country
Phone


Problem: List all customers that are from 
the same countries as the suppliers.
SELECT Id, FirstName, LastName, Country
  FROM Customer
 WHERE Country IN 
       (SELECT Country 
          FROM Supplier) 


Results: 91 records. 



Id	FirstName	LastName	Country
1	Maria	Anders	Germany
4	Thomas	Hardy	UK
5	Christina	Berglund	Sweden
6	Hanna	Moos	Germany
7	Frédérique	Citeaux	France


-------------------------------------------------------------------------
The SQL WHERE LIKE syntax

The general syntax is: 
SELECT column-names
  FROM table-name
 WHERE column-name LIKE value 

Optional Wildcard characters allowed in 'value' are % (percent) and _ (underscore).
  A % matches any string with zero or more characters.
  An _ matches any single character.


PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued

SQL WHERE LIKE Examples



Problem: List all products with names that start with 'Ca'
SELECT Id, ProductName, UnitPrice, Package
  FROM Product
 WHERE ProductName LIKE 'Ca%'


Results: 2 records. 



Id	ProductName	UnitPrice	Package
18	Carnarvon Tigers	62.50	16 kg pkg.
60	Camembert Pierrot	34.00	15-300 g rounds


PRODUCT
Id
ProductName
SupplierId
UnitPrice
Package
IsDiscontinued


Problem: List all products that start with 'Cha' or 'Chan' and have one more character.
SELECT Id, ProductName, UnitPrice, Package
  FROM Product
 WHERE ProductName LIKE 'Cha_' OR ProductName LIKE 'Chan_'


Results: 2 records. 



Id	ProductName	UnitPrice	Package
1	Chai	18.00	10 boxes x 20 bags
2	Chang	19.00	24 - 12 oz bottles


--------------------------------------------------------------------------------------------------------
SQL WHERE IS NULL Examples



Problem: List all suppliers that have no fax number
SELECT Id, CompanyName, Phone, Fax 
  FROM Supplier
 WHERE Fax IS NULL


Results: 16 records 



Id	CompanyName	Phone	Fax
1	Exotic Liquids	(171) 555-2222	NULL
2	New Orleans Cajun Delights	(100) 555-4822	NULL
4	Tokyo Traders	(03) 3555-5011	NULL
5	Cooperativa de Quesos 'Las Cabras'	(98) 598 76 54	NULL
6	Mayumis	(06) 431-7877	NULL



SUPPLIER
Id
CompanyName
ContactName
City
Country
Phone
Fax


Problem: List all suppliers that do have a fax number
SELECT Id, CompanyName, Phone, Fax 
  FROM Supplier
 WHERE Fax IS NOT NULL


Results: 13 records 



Id	CompanyName	Phone	Fax
3	Grandma Kellys Homestead	(313) 555-5735	(313) 555-3349
7	Pavlova, Ltd.	(03) 444-2343	(03) 444-6588
9	PB Knäckebröd AB	031-987 65 43	031-987 65 91
13	Nord-Ost-Fisch Handelsgesellschaft mbH	(04721) 8713	(04721) 8714
14	Formaggi Fortini s.r.l.	(0544) 60323	(0544) 60603
18	Aux joyeux ecclésiastiques	(1) 03.83.00.68	(1) 03.83.00.62
19	New England Seafood Cannery	(617) 555-3267	(617) 555-3389
21	Lyngbysild	43844108	43844115
22	Zaanse Snoepfabriek	(12345) 1212	(12345) 1210
24	Gday, Mate	(02) 555-5914	(02) 555-4873
26	Pasta Buttini s.r.l.	(089) 6547665	(089) 6547667
28	Gai pâturage	38.76.98.06	38.76.98.58
29	Forêts dérables	(514) 555-2955	(514) 555-2921

----------------------------------------------------------------------------------------------


The SQL GROUP BY syntax

The general syntax is: 
SELECT column-names
  FROM table-name
 WHERE condition
 GROUP BY column-names

The general syntax with ORDER BY is:
SELECT column-names
  FROM table-name
 WHERE condition
 GROUP BY column-names
 ORDER BY column-names


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

SQL GROUP BY Examples


Problem: List the number of customers in each country 

SELECT COUNT(Id), Country 
  FROM Customer
 GROUP BY Country


Results: 21 records. 

Count	Country
3	Argentina
2	Austria
2	Belgium
9	Brazil
3	Canada


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

Problem: List the number of customers in each country sorted high to low 

SELECT COUNT(Id), Country 
  FROM Customer
 GROUP BY Country
 ORDER BY COUNT(Id) DESC


Results: 21 records. 

Count	Country
13	USA
11	France
11	Germany
9	Brazil
7	UK


CUSTOMER
Id
FirstName
LastName
City
Country
Phone
ORDER
Id
OrderDate
OrderNumber
CustomerId
TotalAmount

Problem: List the total amount ordered for each customer 

SELECT SUM(O.TotalPrice), C.FirstName, C.LastName
  FROM [Order] O JOIN Customer C 
    ON O.CustomerId = C.Id
 GROUP BY C.FirstName, C.LastName
 ORDER BY SUM(O.TotalPrice) DESC

This query uses a JOIN with Customer to obtain customer names 

Results: 89 records. 

Sum	FirstName	LastName
117483.39	Horst	Kloss
115673.39	Jose	Pavarotti
113236.68	Roland	Mendel
57317.39	Patricia	McKenna
52245.90	Paula	Wilson
34101.15	Mario	Pontes
32555.55

---------------------------------------------------------------------------------------------

The SQL HAVING syntax

The general syntax is: 
SELECT column-names
  FROM table-name
 WHERE condition
 GROUP BY column-names
HAVING condition

The general syntax with ORDER BY is:
SELECT column-names
  FROM table-name
 WHERE condition
 GROUP BY column-names
HAVING condition
 ORDER BY column-names


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

SQL GROUP BY Examples


Problem: List the number of customers in each country. Only include countries with more than 10 customers. 

SELECT COUNT(Id), Country 
  FROM Customer
 GROUP BY Country
HAVING COUNT(Id) > 10


Results: 3 records 

Count	Country
11	France
11	Germany
13	USA

CUSTOMER
Id
FirstName
LastName
City
Country
Phone

Problem: List the number of customers in each country, except the USA, sorted high to low. 
Only include countries with 9 or more customers. 

SELECT COUNT(Id), Country 
  FROM Customer
 WHERE Country <> 'USA'
 GROUP BY Country
HAVING COUNT(Id) >= 9
 ORDER BY COUNT(Id) DESC


Results: 3 records 

Count	Country
11	France
11	Germany
9	Brazil

ORDER
Id
OrderDate
OrderNumber
CustomerId
TotalAmount

Problem: List all customer with average orders between $1000 and $1200.


SELECT AVG(TotalAmount), FirstName, LastName
  FROM [Order] O JOIN Customer C ON O.CustomerId = C.Id
 GROUP BY FirstName, LastName
HAVING AVG(TotalAmount) BETWEEN 1000 AND 1200


Results: 10 records 

Average	FirstName	LastName
1081.215000	Miguel	Angel Paolino
1063.420000	Isabel	de Castro
1008.440000	Alexander	Feuer
1062.038461	Thomas	Hardy
1107.806666	Pirkko	Koskitalo
1174.945454	Janete	Limeira
1073.621428	Antonio	Moreno
1065.385000	Rita	Müller
1183.010000	José	Pedro Freyre
1057.386666	Carine	Schmitt

-----------------------------------------------------------------------------------------

The SQL Alias syntax

The general syntax is: 
SELECT column-name AS alias-name
  FROM table-name alias-name
 WHERE condition


CUSTOMER
Id
FirstName
LastName
City
Country
Phone

SQL Alias Examples


Problem: List total customers in each country. 
Display results with easy to understand column headers. 

SELECT COUNT(C.Id) AS TotalCustomers, C.Country AS Nation
  FROM Customer C
 GROUP BY C.Country

TotalCustomers and Nation are column aliases.
The table alias (C) in this example is not particularly useful.


Results: 21 records 

TotalCustomers	Nation
3	Argentina
2	Austria
2	Belgium
9	Brazil
3	Canada



CUSTOMER
Id
FirstName
LastName
City
Country
Phone
ORDER
Id
OrderDate
OrderNumber
CustomerId
TotalAmount




Problem: List the total amount ordered by customer
with easy to read column headers 


SELECT C.Id AS Identifier, C.LastName + ', ' + C.FirstName AS CustomerName, 
       SUM(O.TotalAmount) AS TotalSpent
  FROM [Order] O JOIN Customer C ON O.CustomerId = C.Id
 GROUP BY C.Id, C.LastName + ', ' + C.FirstName
 ORDER BY TotalSpent DESC

The aliases significantly simplify writing the JOIN and ORDER BY clauses.
The C alias in C.Id helps identify the Customer Id rather then the Order Id.


Results: 89 records 

Identifier	CustomerName	TotalSpent
63	Kloss, Horst	117483.39
71	Pavarotti, Jose	115673.39
20	Mendel, Roland	113236.68
37	McKenna, Patricia	57317.39
65	Wilson, Paula	52245.90

------------------------------------------------------------------------------------------------------

