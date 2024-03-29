######Advance Queries Study

# Subqueries
SELECT * FROM employees;

#####Employees Salaries who's greater than the avarage salary

SELECT Emp_ID, Last_name, Salary_Rand
FROM employees WHERE Salary_Rand > (SELECT AVG(Salary_Rand)
FROM employees);

/*Employees Salaries who's greater than Mr.Sonday's salary*/
SELECT Title, Last_name, Email, Salary_Rand
FROM employees WHERE Salary_Rand > (SELECT Salary_Rand 
FROM employees WHERE Last_name = 'Sonday');

/*Collect data from two different tables*/
SELECT * FROM products;
SELECT * FROM order_Details;

SELECT Product_ID, Product_Name, Unit_Price FROM products
WHERE Product_ID IN (SELECT Product_ID FROM order_Details
WHERE Unit_Price < 60000);

##### Stored Procedure = A querie that you can use over & over
SELECT * FROM orders; 

#### shippers Procedure with Freight greater > 2.0000 
DELIMITER &&
CREATE PROCEDURE top_Shippers()
BEGIN
SELECT Ship_Name, Ship_Country, Freight
FROM orders WHERE Freight > 2.0000;
END &&
DELIMITER ;

CALL top_Shippers();
DROP PROCEDURE top_Shippers;

#SP using IN 
DELIMITER //
CREATE PROCEDURE emp_highestPaid(IN VAR INT)
BEGIN
SELECT Title, Last_name, Date_of_birth, Salary_Rand
FROM employees
ORDER BY Salary_Rand DESC LIMIT VAR;
END //
DELIMITER ;
CALL emp_highestPaid(3);


SELECT * FROM employees;*
DELIMITER //
CREATE PROCEDURE update_salary(IN temp_name VARCHAR(30), 
IN new_salary FLOAT)
BEGIN
UPDATE employees 
SET Salary_Rand = new_salary WHERE First_name = temp_name;
END ; //

call update_salary('Sheldon', 28500);

DROP PROCEDURE update_salary;

/*==============================*/

#SP using OUT
DELIMITER //
CREATE PROCEDURE sp_CountEmployees(OUT Total_Emps INT)
BEGIN
SELECT COUNT(First_name) INTO Total_Emps FROM employees
WHERE sex = 'Female';
END //
DELIMITER ;

CALL sp_CountEmployees(@F_emp);
SELECT @F_emp as Female_emps;

SELECT * FROM employees;
DROP PROCEDURE sp_CountEmployees;

/*TRIGGER in SQL = type of stored procedure that runs automatically*/
#DATA MANIPULATION TRIGGER
#DATA DEFINITION TRIGGER
#LOGIN TRIGGER

CREATE TABLE student 
	(st_roll INT, st_age INT, st_name VARCHAR(30), mark FLOAT);
    
    DELIMITER //
    CREATE TRIGGER marks_verify_st
    BEFORE INSERT ON student
    FOR EACH ROW
    IF NEW.mark <= 0 THEN SET NEW.mark = 50;
    END IF; //
    
    INSERT INTO student 
    VALUES	(501, 21, 'Ronald', 75.0),
			(502, 25, 'Jess', -20.0),
			(503, 20, 'Cindy', 25.0),
			(504, 24, 'Nick', -12.5),
			(505, 17, 'Pearl', 62.0);
	
SELECT * FROM student;
DROP TRIGGER marks_verify_st;
/*-------------------------*/

#Views in SQL =Virtual Tables That Doesn't Store any Data
#But Display in other Tables 
#View are created by joining one or more Tables
SELECT * FROM orders;

CREATE VIEW order_Ships
AS
SELECT Ship_Name, Ship_Adress, Ship_Via
FROM orders;

SELECT * FROM order_Ships;

################### FIX BETWEEN
SELECT * FROM customers;
SELECT * FROM customer_Demographics; 

CREATE VIEW customer_Description
AS
SELECT Company_Name, Contact_Name, Address, Customer_Desc  
FROM customers AS cust INNER JOIN customer_demographics AS cd
ON c.customer_demo = cd.customer_demographics;

SELECT * FROM customer_Decription;
##################### FIX BETWEEN

/*Rename Decription*/
RENAME TABLE order_ships
TO order_shipsDetails;

/*Display Views*/
SHOW FULL TABLES
WHERE table_type = 'VIEW';

/*Delete View*/
DROP VIEW customer_demo;


######### WINDOWS FUNCTION
SELECT * FROM employees;

SELECT Title, Last_Name, Email, Sex,
SUM(Salary_Rand) OVER (PARTITION BY Sex) AS total_salary
FROM employees;

########## ROW NUMBER FUNCTION
SELECT ROW_NUMBER() OVER(ORDER BY Salary_Rand) AS row_num,
Last_Name, Salary_Rand FROM employees ORDER BY Salary_Rand; 

#== Can be used to find duplicate values in a table
CREATE TABLE demo 
	(work_id INT, work_name VARCHAR(30));
 
    INSERT INTO demo 
    VALUES	(501,'Massimo'),
			(502,'Sky'),
            (502,'Sky'),
			(503,'Ivory'),
            (504,'Mark'),
			(504,'Mark'),
            (505,'Ramson'),
            (506,'Max'),
			(506,'Max');
            
SELECT work_id, work_name, ROW_NUMBER() OVER
(PARTITION BY work_id, work_name ORDER BY work_id) as row_num
FROM demo;

######## Rank Function
CREATE TABLE demo1(var_a INT);

INSERT INTO demo1
VALUES (101),(102),(102),(102),(103),(104),(105),(106),(106),
        (107),(107),(108),(108),(108),(109),(109);

SELECT var_a,
RANK() OVER (ORDER BY var_a) AS test_rank
FROM demo1;

########## First Value Function
SELECT First_Name,  

SELECT First_Name, Sex, Salary_Rand,
FIRST_VALUE(First_Name)
OVER (PARTITION BY sex ORDER BY Salary_Rand DESC) AS highest_salary 
FROM employees;

SELECT * FROM employees;

/*Some basic Queries ==============================================*/
SELECT * FROM territories;

ALTER TABLE territories ADD points DECIMAL(3, 2);
ALTER TABLE territories DROP COLUMN points;

######### Using AUTO_INCREMENT
CREATE TABLE employeesTests (
	emp_id INT AUTO_INCREMENT,
    emp_name VARCHAR(30),
    emp_marks INT(20),
    PRIMARY KEY(emp_id)
);
INSERT INTO employeesTests (emp_name, emp_marks)
VALUE ('Malcom', 50), 
		('Frank', 80),
        ('Trevor', 30),
        ('Cannon', 60)
;
SELECT * FROM employeesTests;
######### Using AUTO_INCREMENT

UPDATE employeesTests
SET emp_name = 'Roy', emp_marks = '10'
WHERE emp_id = 4;

SELECT * FROM employeesTests
ORDER BY emp_marks, emp_name;

SELECT * FROM employeesTests
ORDER BY emp_id DESC LIMIT 2;

SELECT * FROM products
WHERE Units_in_Stock <= 13;

SELECT Company_Name AS name, Contact_title AS title
FROM customers;

SELECT DISTINCT Ship_Country 
FROM orders;

SELECT COUNT(Reports_to) 
FROM employees;

SELECT * FROM employees;
SELECT COUNT(emp_id) 
FROM employees
WHERE sex = 'Female' AND Date_of_birth > 1990-01-01;

SELECT SUM(Salary_Rand) FROM employees;

SELECT COUNT(Sex), sex
FROM employees
GROUP BY Sex;

###WILD CARD
SELECT * FROM orders
WHERE Ship_Adress LIKE '%am';

SELECT * FROM employees
WHERE Date_of_birth
LIKE '____-04%';

SELECT  Ship_Name, Customer_ID
FROM orders
UNION
SELECT Company_Name, Customer_ID
FROM customers;

SELECT Salary_Rand
FROM employees
UNION
SELECT Territory_ID
FROM employees_territory;

SELECT MAX(Unit_Price) AS product_Max
FROM products; 

SELECT MIN(Unit_Price) AS Cheapest_product  
FROM products;

SELECT emp_id, Last_name FROM employees
WHERE City = 'West Coast' ORDER BY emp_id ASC;

SELECT Last_name, Date_of_birth FROM employees 
WHERE Date_of_birth >= 1995-01-01
GROUP BY Last_name, Date_of_birth ORDER BY Last_name;

SELECT COUNT(Salary_Rand), Salary_Rand FROM employees  
WHERE Salary_Rand < 25000 GROUP BY Salary_Rand ORDER BY Salary_Rand

SELECT COUNT(Supplier_ID), Country 
FROM suppliers GROUP BY Country;

SELECT SUM(Order_ID)
FROM orders WHERE Freight > 2.1000;

CREATE VIEW ordersfreight_High AS
SELECT Ship_Name, Order_ID
FROM orders
WHERE Freight > 2.1000;

CREATE VIEW ordersfreight_low AS
SELECT Ship_Name, Order_ID
FROM orders
WHERE Freight < 2.1000;

CREATE VIEW  Product_List AS
SELECT Product_ID, Product_Name, Category_ID
FROM products
WHERE Discontinued = False;

SELECT Customer_ID FROM customers INNER
JOIN orders ON customers.orders_ID = orders.customer_ID;

SELECT Product_Name, Unit_Price * 
(Units_in_Stock + IFNULL(Units_in_Order, 0)) 
FROM products;

SELECT Product_ID, Reorder_Level, Unit_Price,
DENSE_RANK() OVER (PARTITION BY Reorder_Level ORDER BY Unit_Price) AS ranking
FROM products;

SELECT Emp_ID, Email, Salary_Rand,
AVG(Salary_Rand) OVER () AS avg_sal
FROM employees;

SELECT Product_ID, Product_Name, Units_in_Stock, Unit_Price,
       MIN(Unit_Price) OVER (PARTITION BY Units_in_Stock) AS min_result
FROM products;

SELECT Product_ID, Product_Name, Units_in_Stock, Unit_Price,
       MAX(Unit_Price) OVER () AS max_result
FROM   products;
