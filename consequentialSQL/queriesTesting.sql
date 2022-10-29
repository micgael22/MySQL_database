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

-- 30. Writing Developer Friendly SQL


