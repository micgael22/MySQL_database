USE sql_query_tests;

-- 1.SQL Query for Retrieving Tables
SELECT * FROM ship_station.categories;

-- 2.Query for Selecting Columns from a Table
SELECT Emp_ID FROM employees;

-- 3.Query for Outputting Data Using a Constraint
SELECT Emp_ID, first_Name, Last_name
FROM employees 
WHERE EMP_ID = '104';

-- 4.Query for Outputting Sorted Data Using ‘Order By
SELECT Shipper_ID, Ship_name 
FROM orders
WHERE Ship_Region = 'East Asia' 
ORDER BY Shipper_ID desc;

SELECT Shipper_ID, Ship_name 
FROM orders
WHERE Ship_Region = 'West Asia' 
ORDER BY Shipper_ID asc;

-- 5.SQL Query for Outputting Sorted Data Using ‘Group By’
SELECT COUNT(Unit_Price), Unit_Price 
FROM order_details
WHERE Unit_Price < 100000 GROUP BY Unit_Price 
ORDER BY Unit_Price;

-- SQL Queries for Data Manipulation Using Math Functions

-- 6.Data Manipulation Using COUNT
SELECT COUNT(Customer_ID), Company_Name, Region, Country 
FROM Customers 
GROUP BY Region;

-- 7.Data Manipulation Using SUM
SELECT SUM(Unit_Price)
FROM products 
WHERE Units_in_Stock < 78;

-- 8.Data Manipulation Using AVG
SELECT AVG(Unit_Price)FROM order_Details;

-- 9.SQL Query for Listing all Views
SELECT * FROM sql_query_tests.product_list;

-- 10.Query for Creating a View
CREATE VIEW Cheaper_Products AS
SELECT Product_Name, Product_ID
FROM products
WHERE Unit_Price < 600;

-- 11.Query for Retrieving a View
SELECT * FROM cheaper_products;

-- 12.Query for Updating a View
CREATE OR REPLACE VIEW Products_List AS
SELECT Product_ID, Product_Name, Category_ID
FROM products
WHERE Discontinued = 'True';

SELECT * FROM products_list;

-- 13.Query for Dropping a View
DROP VIEW V1;

-- 14.Query to Display User Tables
SELECT * FROM customers WHERE Company_Name ='a';

-- ===============================
-- 15.Query to Display Primary Keys
SELECT * FROM sql_query_tests.employees WHERE Emp_ID='PK';

-- 16.Query for Displaying Unique Keys
SELECT * FROM sql_query_tests.employees WHERE Emp_ID='uq';

-- 18.Displaying Triggers
SELECT * FROM sql_query_tests.employees WHERE Emp_ID='tr';

-- 19.Displaying Internal Tables
SELECT * FROM sql_query_tests.employees WHERE Emp_ID='it';

-- 20.Displaying a List of Procedures
SELECT * FROM sql_query_tests.employees WHERE Emp_ID='p';

-- 21.Swapping the Values of Two Columns in a table
UPDATE Customers SET City=Region, Region=City;

-- ===============================

-- 22.Returning a Column of Unique Values
SELECT DISTINCT Customer_ID FROM Customers;

-- 23.Making a Top 20 with the SELECT TOP Clause
SELECT TOP '20' FROM Customers WHERE Customer_ID<>NULL;

-- 24.Searching for SQL Tables with Wildcards
SELECT * From Customers 
WHERE Company_Name 
LIKE 'The%';

-- 25.Born Between. Dates
SELECT Emp_ID, Last_name 
FROM employees 
WHERE Date_of_birth 
BETWEEN ‘1987-01-01’ AND ‘1996-01-07’;

-- 26.Finding the Intersection of Two Tables
SELECT Order_ID FROM orders 
INNER JOIN customers 
ON orders.order_ID = customers.customer_ID;

-- 27.Doubling the Power with UNION
SELECT Product_Name FROM products 
UNION SELECT Ship_Name FROM orders;

-- 28.Making Column Labels More Friendly
SELECT Phone_Number AS contact FROM shippers;

-- 29.Always and Everywhere!
SELECT Product_Name FROM products 
WHERE Product_ID = ALL
(SELECT Product_ID FROM products
WHERE Unit_price > 350);
-- ===============================================

-- 36.Conditional Subquery Results
SELECT Ship_Name FROM Orders WHERE EXISTS 
(SELECT Product_Name FROM Products 
WHERE Products_ID.Products_ID =order_ID.order_ID 
AND Units_in_Order < 80);

-- 37. Copying Selections from Table to Table
INSERT INTO order_details 
SELECT * FROM orders
WHERE Freight <= 80;

-- =================================================

-- 38. Catching NULL Results
SELECT Product_Name, Unit_Price * 
(Units_in_Stock + IFNULL(Units_in_Order, 0)) 
FROM Products;

-- 39. HAVING can be Relieving!
SELECT COUNT(Customer_ID), Region
FROM Customers
GROUP BY Region
HAVING COUNT(Customer_ID) > 0;

	
SELECT SUBSTRING_INDEX("www.bytescout.com", ".", 2);

-- 41. Use COALESCE to return the first non-null expression
SELECT COALESCE(NULL,NULL,'ByteScout',NULL,'Byte');

-- 42. Use Convert to transform any value into a particular datatype
-- SELECT CONVERT(INT, 27.64);

-- 43. DENSE_RANK()Analytical query
SELECT Product_ID, Category_ID, Reorder_Level, Unit_Price,
DENSE_RANK() OVER 
(PARTITION BY Reorder_Level ORDER BY Unit_Price)
 AS Ranking FROM Products;

-- 44. Query_partition_clause
SELECT Product_Name, Supplier_ID, Units_in_Stock,
AVG(Units_in_Stock) OVER () AS avg_stock
FROM products;

-- 45. Finding the last five records from the table
-- Select * from Employees AS emp where row_number =< 8
-- union
-- select * from 
-- (Select * from Employees order by Emp_ID desc) 
-- where row_number <=8;

-- 46. LAG
SELECT Product_ID, Product_Name, Discontinued, Unit_Price,
LAG(Unit_Price, 1, 0) OVER 
(PARTITION BY Discontinued ORDER BY Unit_Price)
AS prev_price
FROM products;

-- 47. LEAD
SELECT Product_ID, Product_Name, Discount, Unit_Price,
LEAD(Unit_Price, 1, 0) OVER (ORDER BY Unit_Price) 
AS price_next,
LEAD(Unit_Price, 1, 0) OVER (ORDER BY Unit_Price) 
- Unit_Price AS price_diff
FROM products;

-- 48. PERCENT_RANK
SELECT Product_ID, SUM(Unit_Price),
PERCENT_RANK() OVER (ORDER BY SUM(Unit_Price) DESC)
AS percent_Ranking FROM Products
GROUP BY Product_ID
ORDER BY Product_ID;

SELECT * FROM products;