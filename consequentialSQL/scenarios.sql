-- Real Time Scenarios in SQL Queries : {TRAINING}

-- Real Time Scenarios in SQL Queries : {TRAINING}
USE sql_query_tests;

SELECT * FROM sql_query_tests.employees;

SELECT Emp_ID, Last_name 
FROM employees WHERE Emp_ID = '109';

SELECT Supplier_ID, Contact_name FROM suppliers
WHERE CITY = 'Mumbai' ORDER BY Supplier_ID;

SELECT Shipper_ID, Ship_Name 
FROM orders
WHERE ship_Region = 'West Asia' 
ORDER BY Shipper_ID ASC;

SELECT Last_name, Salary_Rand FROM employees 
WHERE Salary_Rand > 25000
GROUP BY Last_name, Salary_Rand 
ORDER BY Last_name;

SELECT COUNT(Unit_Price), Unit_Price FROM products 
WHERE Unit_Price < 500 
GROUP BY Unit_Price 
ORDER BY Unit_Price;

SELECT COUNT(Customer_ID), city 
FROM customers GROUP BY city;

SELECT SUM(Units_in_Stock)
FROM products WHERE Units_in_Stock < 50;

SELECT AVG(Units_in_Stock)
FROM products;

SELECT * FROM sql_query_tests.order_shipsdetails;

CREATE VIEW Low_Stock_Units AS
SELECT Product_Name, Product_ID
FROM products
WHERE Units_in_Stock < 25;

SELECT * FROM Low_Stock_Units;
DROP VIEW Low_Stock_Units;

CREATE OR REPLACE VIEW Product_List AS
SELECT Product_ID, Product_Name, Category_ID
FROM products
WHERE Discontinued = 'true';

SELECT * FROM Product_List;

SELECT * FROM sql_query_tests.territories 
WHERE Last_name ='Williams';

SELECT * from sql_query_tests.region
WHERE Region_ID='1600';

UPDATE territories SET Last_name=region_ID, region_ID=Last_name;

SELECT DISTINCT Territory_ID FROM territories;

-- SELECT Customer_ID 5 FROM customers WHERE Customer_ID<>NULL;

SELECT * FROM customers;





