CREATE DATABASE giraffe_academy;
USE giraffe_academy;

CREATE TABLE employee (
emp_id INT PRIMARY KEY,
first_name VARCHAR(40),
last_name VARCHAR(40),
birth_day DATE,
sex VARCHAR(1),
salary INT,
super_id INT,
branch_id INT
);

CREATE TABLE branch (
branch_id INT PRIMARY KEY,
branch_name VARCHAR(40),
mgr_id INT,
mgr_start_date DATE,
FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE SET NULL;

CREATE TABLE clients (
client_id INT PRIMARY KEY,
client_name VARCHAR(40),
branch_id INT,
FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
emp_id INT,
client_id INT,
total_sales INT,
PRIMARY KEY (emp_id, client_id),
FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
FOREIGN KEY (client_id) REFERENCES clients(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
branch_id INT,
supplier_name VARCHAR(40),
supply_type VARCHAR(40),
PRIMARY KEY (branch_id, supplier_name),
FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);
DELETE FROM branch
WHERE branch_id = 2;

SELECT * FROM branch_supplier;

 INSERT INTO employee VALUES (100, 'David', 'Wallace', '1967-11-17', 'M',250000, NULL, NULL);
 INSERT INTO branch VALUES (1, 'Corporate', 100, '2006-02-09');
 UPDATE employee
 SET branch_id =1
 WHERE emp_id = 100;
 
 INSERT INTO employee VALUES (101, 'Jan', 'Levinston', '1961-05-11','F', '110000', 100, 1);

INSERT INTO employee VALUES (102, 'Michael', 'Scott', '1964-03-15', 'M', '75000', 100, NUll);
INSERT INTO branch VALUES (2, 'Scranton', 102, '1992-04-06');
UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;
INSERT INTO employee VALUES (103, 'Agela','Martin', '1971-06-25','F',63000, 102, 2);
INSERT INTO employee VALUES (104, 'Kelly','Kapoor', '1980-06-05','F',55000, 102, 2);
INSERT INTO employee VALUES (105, 'Stanley','Hudson', '1958-02-19','M',69000, 102, 2);


INSERT INTO employee VALUES (106, 'Josh','Porter', '1969-09-05','M',78000, 100, NULL);
INSERT INTO branch VALUES (3, 'Stamford', 106, '1998-02-13');
UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;
INSERT INTO employee VALUES (107, 'Andy','Bernard', '1980-06-05','M',65000, 106, 3);
INSERT INTO employee VALUES (108, 'Jim','Halpret', '1958-02-19','M',71000, 106, 3);


INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Labels', 'Custom Forms');

INSERT INTO clients VALUES(400, 'Dumore Highschool', '2');
INSERT INTO clients VALUES(401, 'Lackwana Country', '2');
INSERT INTO clients VALUES(402, 'FedEX', '3');
INSERT INTO clients VALUES(403, 'John Daily Law, LLC', '3');
INSERT INTO clients VALUES(404, 'Scranton Whitepages', '2');
INSERT INTO clients VALUES(405, 'Times Newspaper', '3');
INSERT INTO clients VALUES(406, 'FedX', '2');

INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 225000);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

SELECT * FROM employee;

/* order all employers ordered by salary*/
SELECT * FROM employee ORDER BY salary;
SELECT * FROM employee ORDER BY salary DESC;
SELECT * FROM employee ORDER BY salary ASC;

/* find all employees oredered by sex then name */
SELECT * FROM employee ORDER BY sex, first_name, last_name;

/* find the first 5 employees in the table */
SELECT * FROM employee LIMIT 5;

/* find the first and last_name of all employees */
SELECT first_name AS forename, last_name AS surname FROM employee;

/* find out all the different */
SELECT DISTINCT sex FROM employee;
SELECT DISTINCT branch_id FROM employee;


/*------------------------------------------------------------------*/
/*FUNCTIONS*/
/*------------------------------------------------------------------*/

/*find the number of employees*/
SELECT count(emp_id) FROM employee;
SELECT count(super_id) FROM employee;

/*find the number of employees born after 1970*/
SELECT count(emp_id) 
FROM employee
WHERE sex = 'F' AND birth_day > '1971-01-01';

/*find the average of all employee's salaries*/
SELECT avg(salary)FROM employee
WHERE sex = 'M';

/*find the sum of all employee's salaries*/
SELECT sum(salary) FROM employee;

/*find out many males and females there are */
SELECT count(sex), sex 
FROM employee
GROUP BY sex;

/*find the total sales of each salesman */
SELECT sum(total_sales), emp_id 
FROM works_with
GROUP BY emp_id;

/*how much each client spend */
SELECT sum(total_sales), client_id
FROM works_with
GROUP BY client_id;

/*_______________________________________________________________________________*/
/*wildcards*/			/* % = any #number of characters,	_ = one character*/
/*_______________________________________________________________________________*/

/*Find any client's who are an LLC*/
SELECT * FROM clients
WHERE client_name LIKE '%LLC';

/*find any branch suppliers who are in the label business*/
SELECT * FROM branch_supplier
WHERE supplier_name LIKE '%Label%';

/*find any employees born in October*/
SELECT * FROM employee
WHERE birth_day LIKE '____-06%';

/*find any clients who are school*/
SELECT * FROM clients
WHERE client_name LIKE '%school%';

/*-------------------------------------------UNION--------------------------------------------*/
/*find  a list of employees and branch names*/
SELECT first_name AS company_names
FROM employee
UNION
SELECT branch_name
FROM branch;

/*find  a list of all clients and branch suppliers names*/
SELECT client_name, clients.branch_id
FROM clients
UNION
SELECT supplier_name, branch_supplier.branch_id
FROM branch_supplier;

/*find a list of all money spent or earned by the company*/
SELECT salary
FROM employee
UNION
SELECT total_sales
FROM works_with;

INSERT INTO branch VALUES (4, 'Buffalo', NULL, NULL);

SELECT * FROM branch;


/*__________________________JOINS___________________________*/
/*find all branches and the names of their managers*/
SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch
ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;

/*___________________________NESTED_QUERIES___________________________*/
 /*find names of all employees who have sold over 30,000 to a single client*/
 SELECT employee.first_name, employee.last_name
 FROM employee
 WHERE employee.emp_id 
 IN (
	SELECT works_with.emp_id
    FROM works_with
    WHERE works_with.total_sales > 30000
);

/*find all clients who are handled by the branch that Michael Scott manages*/
SELECT clients.client_name
FROM clients
WHERE clients.branch_id = (
	SELECT branch.branch_id
	FROM branch
	WHERE branch.mgr_id = 102
    LIMIT 1
    );

/*-----------------------ON DELETE-------------------*/
DELETE FROM employee
WHERE emp_id = 102;

SELECT * FROM employee;


/*-----------------------TRIGGERS-----------------------*/
CREATE TABLE trigger_test (
	message VARCHAR(100)
);


DELIMITER $$
CREATE 
	TRIGGER my_trigger BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
    INSERT INTO trigger_test VALUES ('added new employee');
    END$$
DELIMITER ;

INSERT INTO employee
VALUES (109, 'Oscar', 'Martinez', '1968-02-19', 'M', 69000, 106, 3);



DELIMITER $$
CREATE 
	TRIGGER my_trigger1 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN
    INSERT INTO trigger_test VALUES (NEW.first_name);
    END$$
DELIMITER ;

INSERT INTO employee
VALUES (110, 'Kevin', 'Malone', '1978-02-19', 'M', 69000, 106, 3);

DELIMITER $$
CREATE 
	TRIGGER my_trigger3 BEFORE INSERT
    ON employee
    FOR EACH ROW BEGIN 
	IF NEW.sex = 'M' THEN 
		INSERT INTO trigger_test VALUES ('added male employee');
    ELSEIF NEW.sex = 'F' THEN 
		INSERT INTO trigger_test VALUES ('added female');
	ELSE 
		INSERT INTO trigger_test VALUES ('added other employee');
	END IF;
    END$$ 
DELIMITER ;

INSERT INTO employee
VALUES (115, 'Nicky', 'Besley', '1988-02-19', 'F', 32900, 105, 1);
INSERT INTO employee
VALUES (116, 'Kev', 'Malone', '1920-02-19', 'M', 69000, 106, 3);


SELECT * FROM trigger_test; 


