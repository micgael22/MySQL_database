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

-- 15.Query to Display Primary Keys
SELECT * FROM sql_query_tests.employees WHERE Emp_ID='PK';

SELECT * FROM customers;
