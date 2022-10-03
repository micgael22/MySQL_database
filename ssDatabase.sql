CREATE DATABASE sql_query_tests;
USE sql_query_tests;

/*Tables Section-------------------------------------------------------------------*/
CREATE TABLE employees (
	Emp_ID INT (11),
	Last_name VARCHAR(20),
	First_name VARCHAR(20),
	Title VARCHAR(20),
    Sex VARCHAR(10),
	Date_of_birth DATE,
	Hire_date DATE,
	Address VARCHAR(30),
	City VARCHAR(30),
	Region VARCHAR(30),
	Postal_code INT(10),
	Country VARCHAR(30),
	Phone_number VARCHAR(30),
    Email VARCHAR(30),
    Reports_to INT(10),
	Salary_Rand FLOAT,
    PRIMARY KEY (Emp_ID)
);

CREATE TABLE region (
	Region_ID INT(11),
    Region_Description VARCHAR (40),
    PRIMARY KEY (Region_ID)
);

CREATE TABLE territories (
	Territory_ID VARCHAR(20),
    Last_name VARCHAR(30),
	Region_ID INT(11),
	PRIMARY KEY (Territory_ID),
    FOREIGN KEY (Region_ID)  REFERENCES region (Region_ID)
);

CREATE TABLE employees_territory (
	Emp_ID INT(11),
    Territory_ID VARCHAR(20),
    FOREIGN KEY (Emp_ID)  REFERENCES  employees (Emp_ID),
    FOREIGN KEY (Territory_ID)  REFERENCES  territories (Territory_ID)
);

CREATE TABLE shippers (
	Shipper_ID INT(11),
	Company_Name VARCHAR(40),
	Phone_Number VARCHAR(24),
	PRIMARY KEY (Shipper_ID)
);

CREATE TABLE orders (
	Order_ID INT(10),
	Customer_ID INT(10),
	Emp_ID INT(10),
	Order_Date DATE,
	Required_Date DATE,
	Shipped_Date DATE,
    Shipper_ID INT(11),
	Ship_Via INT(11),
	Freight DECIMAL (8,4),
	Ship_Name VARCHAR(30),
	Ship_Adress VARCHAR(30),
	Ship_City VARCHAR(30),
	Ship_Region VARCHAR(30),
	Ship_PostalCode VARCHAR(15),
	Ship_Country VARCHAR(30),
	PRIMARY KEY (Order_ID),
	FOREIGN KEY (Emp_ID)  REFERENCES  employees (Emp_ID),
    FOREIGN KEY (Shipper_ID) REFERENCES shippers (Shipper_ID)
);
ALTER TABLE orders
ADD FOREIGN KEY (Customer_ID)  
REFERENCES customers (Customer_ID);
    


CREATE TABLE customers (
	Customer_ID INT(5),
    Company_Name VARCHAR(40),
    Contact_Name VARCHAR(30),
    Contact_Title VARCHAR(30),
    Address VARCHAR(60),
    City VARCHAR(20),
    Region VARCHAR(15),
    Postal_Code INT(15),
    Country VARCHAR(30),
    Phone_number VARCHAR(24),
    Email VARCHAR(24),
    PRIMARY KEY (Customer_ID)
);

CREATE TABLE customer_demographics (
	Customer_Type_ID INT(15),
    Customer_Desc VARCHAR(50),
    PRIMARY KEY (Customer_Type_ID)
);

CREATE TABLE customer_Demo (
	Customer_ID INT(15),
	Customer_Type_ID INT(15),
    FOREIGN KEY (Customer_ID)  REFERENCES customers (Customer_ID),
    FOREIGN KEY (Customer_Type_ID)  REFERENCES customer_demographics (Customer_Type_ID)
);

CREATE TABLE products (
	Product_ID INT(10),
    Product_Name VARCHAR(40),
    Supplier_ID INT(10),
    Category_ID INT(10),
    Qauntity_Per_Unit VARCHAR(40),
    Unit_Price INT(10),
    Units_in_Stock INT(10),
    Units_in_Order INT(10),
    Reorder_Level INT(10),
    Discount VARCHAR(20),
    Discontinued VARCHAR(10),
    PRIMARY KEY(Product_ID)
);
ALTER TABLE products
ADD FOREIGN KEY (Supplier_ID)  
REFERENCES suppliers (Supplier_ID);
    
ALTER TABLE products
ADD FOREIGN KEY (Category_ID)  
REFERENCES categories (Category_ID);

CREATE TABLE order_details (
	Order_ID INT(11),
	Product_ID INT(11),
	Unit_Price INT(10),
	Quantity INT(3),
	Discount VARCHAR(20),
	FOREIGN KEY (Product_ID)  REFERENCES products (Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES orders (order_ID)
);

CREATE TABLE suppliers (
	Supplier_ID INT(11),
	Company_Name VARCHAR(30),
	Contact_Name VARCHAR(30),
	Contact_Title VARCHAR(30),
	Address VARCHAR(30),
	City VARCHAR(20),
	Region VARCHAR(15),
	Postal_Code VARCHAR(20),
	Country VARCHAR(30),
	Phone_Number VARCHAR (24),
	Email VARCHAR(30),
	PRIMARY KEY (Supplier_ID)
);

CREATE TABLE categories (
	Category_ID INT(11),
    Category_Name VARCHAR(30),
    PRIMARY KEY (Category_ID)
);

/*Data Insert Section--------------------------------------------------------------------------------------*/

/*Employees data table------------------------------------------------------------*/
INSERT INTO employees (Emp_ID, Last_name, First_name, Title, Sex, Date_of_birth, Hire_date, Address,
			Region, City, Postal_code, Country, Phone_Number, Email, Reports_to, Salary_Rand) 
VALUES  (100, 'Van WyK', 'Emily', 'Mrs', 'Female', '1984-02-09', '2007-01-17','7th Avenue',
		'Western Cape', 'West Coast', 7300, 'South-Africa', '062 342 9234', 'emilyVK@gmail.com', null, 32000.00),
		(101, 'Cooper', 'Jason', 'Mr','Male', '1986-04-06', '2009-01-23', '34 Dime St', 
		'Western Cape', 'Cape Town', 7700, 'South-Africa', '068 348 9784', 'coopjs@gmail.com', 100, 27000.00),
		(102, 'Banner', 'Sheldon', 'Mr','Male', '1980-05-14', '2008-09-11', '2 Lavendale St',
		'Western Cape', 'Cape Town', 7700, 'South-Africa', '075 348 3845', 'banners@gmail.com', 100, 27000.00),
		(103, 'River', 'Bernadette', 'Mrs','Female', '1983-06-05', '2007-01-17', '94 Paper St',
		'Northern Cape', 'Eastern Part', 8300, 'South-Africa', '079 954 4334', 'riverb@gmail.com', 100, 27000.00),
		(104, 'Webber', 'Kaleb', 'Mr','Male', '1989-07-28', '2010-06-13', '49 Gold St',
		'Northern Cape', 'Gordonia region', 8800, 'South-Africa', '062 435 9345', 'Kaleb49@gmail.com', 100, 27000.00),

		(105, 'Louw', 'Jennifer', 'Mrs', 'Female', '1989-08-01', '2009-04-21', '34 Minty St ',
		'Western Cape', 'West Coast', 7300, 'South-Africa', '062 583 9753', 'jenny20@gmail.com', 100, 30000.00),
		(106, 'Qukubana', 'Ayabonga', 'Mr', 'Male', '1990-09-09', '2010-11-13', '86 Gasoline St',
		'Western Cape', 'West Coast', 7300, 'South-Africa', '072 854 2864', 'ayaku90@gmail.com', 105, 25000.00),
		(107, 'Mandrin', 'Jenny', 'Mrs', 'Female', '1992-05-24', '2010-02-02', '45 Hope St',
		'Limpopo', 'South West', 0500, 'South-Africa', '071 963 4754', 'mandyjj@gmail.com', 105, 25000.00),
		(108, 'Sonday', 'Riaad', 'Mr', 'Male', '1990-07-10', '2011-08-02', '191 Row St',
		'Gauteng', 'East Rand', 1400, 'South-Africa', '067 456 4647', 'riaadson@gmail.com', 105, 25000.00),
		(109, 'Summer', 'Mac', 'Mr', 'Male', '1991-09-10', '2011-10-17', '200 Flower St',
		'Gauteng', 'East Rand', 1400, 'South-Africa', '081 786 5346', 'mackle@gmail.com', 105, 25000.00),
    
		(110, 'Plaaitjies', 'Malcom', 'Mr', 'Male', '1990-03-16', '2013-10-25', '23 Dawn St',
		'Northern Cape', 'Northern Cape', 8800, 'South-Africa', '067 583 9753', 'ply349@gmail.com', 100, 29000.00),
		(111, 'Van Zyl', 'Shannon', 'Mrs', 'Female', '1993-04-15', '2014-03-11', '25 Sheets St',
		'Northern Cape', 'Northern Cape', 8800, 'South-Africa', '065 854 2864', 'shannon400@gmail.com', 110, 24000.00),
		(112, 'Bosch', 'Gabrielle', 'Mrs', 'Female', '1994-08-24', '2014-05-16', '92 Winter St',
		'Free State', 'Eastern Cape', 9900, 'South-Africa', '062 963 4754', 'gabbyboss@gmail.com',110, 24000.00),
		(113, 'Choi', 'Mindy', 'Mrs', 'Female', '1993-01-19', '2013-05-01', '119 Lions St',
		'Free State', 'Bloemfontein', 9300, 'South-Africa', '073 456 4647', 'minnie382@gmail.com',110, 24000.00),
		(114, 'Nokhemani', 'Nkosi', 'Mr', 'Male', '1992-06-14', '2015-03-24', '23 Mountain St',
		'Free State', 'Northern Free State', 7300, 'South-Africa', '061 787 6546', 'nkoisnok@gmail.com', 110, 24000.00),
    
		(115, 'Mandel', 'Precious', 'Mrs', 'Female', '1994-08-12', '2015-01-05', '53 Pass St',
		'Free State', 'Southern Free State', 9700, 'South-Africa', '062 754 2751', 'press99@gmail.com', 100, 27000.00),
		(116, 'Van Schalk', 'Amy', 'Mrs', 'Female', '1997-04-15', '2016-07-17', '49 Believe St',
		'Western Cape', 'Garden Route', 6500, 'South-Africa', '071 835 7234', 'amyVS@gmail.com', 115, 23000.00),
		(117, 'Alter', 'Louis', 'Mrs', 'Female', '1996-12-24', '2019-05-20', ' 81 Pillow St',
		'Western Cape', 'Klein Karoo', 6700, 'South-Africa', '069 489 6512', 'alterL500@gmail.com', 115, 23000.00),
		(118, 'Field', 'Mandel', 'Mr', 'Male', '1998-11-19', '2018-05-01', '11 Olive St',
		'Western Cape', 'West Coast', 7300, 'South-Africa', '071 815 4567', 'field21@gmail.com', 115, 23000.00),
		(119, 'Straus', 'Howard', 'Mr', 'Male', '1996-06-24', '2020-07-20', '33 Closet St',
		'Western Cape', 'Stellenbosch', 7600, 'South-Africa', '062 875 8952', 'howard133@gmail.com', 115, 23000.00),
    
		(120, 'Williams', 'Miles', 'Mr', 'Male', '1997-01-19', '2021-08-14', '28 Rand St',
		'Western Cape', 'Stellenbosch', 7600, 'South-Africa', '081 864 8822', 'milly80@gmail.com', 100, 23000.00),
		(121, 'Moerat', 'Fatima', 'Mrs', 'Female', '1997-07-04', '2021-02-27', '55 Rock St',
		'Western Cape', 'Cape Peninsula', 7700, 'South-Africa', '072 465 8135', 'moerat211@gmail.com', 120, 23000.00)
;

/*Region data table------------------------------------------------------------*/
INSERT INTO region (Region_ID, Region_Description)
VALUES  (1500, 'Main shipping ID code'),
		(1600, 'Main shipping ID code'),
		(1700, 'Main shipping ID code'),
		(1800, 'Main shipping ID code'),
		(1900, 'Main shipping ID code')
;

/*Territories data table--------------------------------------------------------*/
INSERT INTO territories (Territory_ID, Last_name, Region_ID)
VALUES  ('Mgr-991', 'Van Wyk', 1500),
		('Mgr-992', 'Louw', 1600),
		('Mgr-993', 'Plaaitjies', 1700),
		('Mgr-994', 'Mandel',1800),
		('Mgr-995', 'Williams',1900)
;

/*Employee Territories data table-------------------------------------------------------*/
INSERT INTO employees_territory (Emp_ID, Territory_ID)
VALUES  (100, 'Mgr-991'),
		(105, 'Mgr-992'),
		(110, 'Mgr-993'),
		(115, 'Mgr-994'),
		(120, 'Mgr-995')
;

/*Shippers data table-------------------------------------------------------*/
INSERT INTO shippers (Shipper_ID, Company_Name, Phone_Number)
VALUES  (001, 'Speed Packaging', '(402) 999-8482'),
		(002, 'United Shipping', '(305) 249-5738'),
		(003, 'Package Prime', '(501) 390-2390'),
		(004, 'The Productive', '(344) 537-2300'),
		(005, 'Brainstorm', '(234) 295-9504'""),
		(006, 'The Lightning', '(985) 048-4987'),
		(007, 'Bazinga Zoom', '(444) 359-4359'),
		(008, 'Perfect Structure', '(004) 888-9494'),
		(009, 'Global Shipping', '(359) 218-1193'),
		(010, 'Buzz Quick', '(777) 288-4919'),
		(011, 'TMZK', '(111) 738-1990'),
		(012, 'In a Flash', '(484) 002-8883'),
		(013, 'EXIST', '(923) 238-2829'),
		(014, 'SMOOTH', '(495) 924-2032'),
		(015, 'Character', '(049) 921-3450'),
		(016, 'Guidance', '(038) 193-3945'),
		(017, 'Water level', '(348) 294-1395'),
		(018, 'Ship Folder', '(938) 284-2029'),
		(019, 'Enterprise', '(329) 182-2922'),
		(020, 'The Ship Empire', '(289) 234-1293'),
		(021, 'SPARK', '(208) 249-1032'),
        (022, 'Din-Fast', '(222) 587-7854')
;

/*Suppliers data table----------------------------------------------------------------*/
INSERT INTO suppliers (Supplier_ID, Company_Name, Contact_Name, Contact_Title, Address, City, Region,
 Postal_Code,Country, Phone_Number, Email)
VALUES  (11005, 'Jamba Factory', 'Bloom', 'Mr', 'Jebel Ali', 'Yangtze Delta', 'West Asia',
		'555-029', 'United Arab Emirates', '(000) 458 483', 'jambafactory@gmail.com'),
		(11006, 'Spark-Trick', 'Adams', 'Mrs', 'Singapore Strait', 'Singapore', 'Southeast Asia',
		'383-843', 'Singapore', '(700) 567 353', 'sparktrick10@gmail.com'),
		(11007, 'The Globe', 'Hoffstader', 'Mr', 'Busan', 'East Asia', 'Korean Strait',
		'582-758', 'South Korea', '(600) 563 754', 'theglobe05@gmail.com'),
		(11008, 'Mountain Height', 'Blue', 'Mr', 'Hong Kong', 'Pearl River Delta', 'East Asia',
		'349-393', 'Hong Kong', '(001) 467 876', 'mountainheight@gmail.com'),
		(11009, 'DMVS', 'Winkle', 'Mrs', 'Rotterdam', 'Rhine Delta', 'Europe',
		'438-893', 'Netherlands', '(055) 986 333', 'dmvs991@gmail.com'),
    
		(11010, 'The Color', 'Muller', 'Mr', 'Elbe River', 'Hamburg', 'Europe',
		'922-902', 'Germany', '(433) 453 7165', 'thecolor39@gmail.com'),
		(11011, 'Spackkles', 'Elanga', 'Mrs', 'Malacca Strait', 'Tanjung Pelepas', 'Southeast Asia',
		'349-382', 'Malaysia', '(252) 567 8366', 'spackkles01@gmail.com'),
		(11012, 'SOUP', 'Pogba', 'Mrs', 'Gulf of Thailand', 'Laem Chabang', 'Southeast Asia',
		'020-439', 'Thailand', '(111) 776 7274', 'rsoo11@gmail.com'),
		(11013, 'Parbles', 'Lee', 'Mr', 'Tokyo Bay', 'Heijin Yokohama', 'East Asia',
		'030-042', 'Japan', '(345) 456 5614', 'parbles@gmail.com'),
		(11014, 'Hi-Level', 'Collins', 'Mrs', 'West Coast', 'Long Beach', 'North America',
		'902-949', 'United States', '(554) 642 2222', 'hilevel22@gmail.com'),
    
		(11015, 'Crates', 'Son', 'Mr', 'Java Sea', 'Tanjung Priok', 'Southeast Asia',
		'438-838', 'Indonesia', '(778) 851 5554', 'crates@gmail.com'),
		(11016, 'Ice Blue', 'Duval', 'Mrs', 'Sri Lanka', 'Colombo', 'Southeast Asia',
		'822-558', 'Sri Lanka', '(833) 843 2253', 'iceblue@gmail.com'),
		(11017, 'Intelligence', 'Alonso', 'Mr', 'East Vietnam Sea', 'Saigon', 'Southeast Asia',
		'004-899', 'Vietnam', '(965) 290 3333', 'intelligence@gmail.com'),
		(11018, 'The Junction', 'Georgina', 'Mrs', 'Western Mediterranean', 'Tanger-Med', 'North Africa',
		'805-222', 'Morocco', '(100) 329 2042', 'thejunction@gmail.com'),
		(11019, 'VLCS', 'Mangera', 'Mr', 'Eastern Mediterranean', 'Piraeus', 'Europe',
		'111-842', 'Greece', '(452) 534 4442', 'vlcs33@gmail.com'),
		
		(11020, 'Patek', 'Singh', 'Mr', 'Arabian Sea', 'Mumbai', 'Asia', 
		'700-541', 'India', '(875) 874 7777', 'patek88@gmail.com'),
		(11021, 'Offset', 'Blow', 'Mrs', 'Red Sea', 'Jeddah', 'West Asia',
		'158-582', 'Saudi Arabia', '(466) 575 5757', 'offset03@gmail.com'),
		(11022, 'Avalance', 'Crane', 'Mrs', 'Caribean Coast', 'Colon', 'Central America', 
		'102-201', 'Panama', '(544) 100 0047', 'avalanche@gmail.com'),
		(11023, 'Take-Off', 'Lingard', 'Mr', 'South Atlantic Ocean', 'Santos', 'South America', 
		'928-552', 'Brazil', '(411) 556 6666', 'takeoff90@gmail.com'),
		(11024, 'Doolio', 'Thomsan', 'Mr', 'Arabian Sea', 'Salalah', 'West Asia', 
		'805-518', 'Oman', '(888) 875 5324', 'doolio@gmail.com'),
    
		(11025, 'Strubb', 'Piers', 'Mr', 'Pearl River Delta', 'Dongguan', 'East Asia',
		'353-266','China',  '(381) 757 5771', 'strubb03@gmail.com'),
		(11026, 'Balencies', 'Grealish', 'Mr', 'Rhine Delta', 'Rotterdam', 'Europe', 
		'438-893', 'Netherlands', '(200) 552 9999', 'balencies@gmail.com')
;

/*Categories data table--------------------------------------------------------------*/
INSERT INTO categories (Category_ID, Category_Name)
VALUES 	(66005, 'Frozen Goods'),
		(66006, 'Computers and parts'),
		(66007, 'Car Parts'),
		(66008, 'Clothing Materials'),
		(66009, 'Metals'),
    
		(66010, 'Plastic Containers'),
		(66011, 'Phones'),
		(66012, 'Car Parts'),
		(66013, 'Hardware Materials'),
		(66014, 'Compressors'),
    
		(66015, 'Refridgerators'),
		(66016, 'Accessories'),
		(66017, 'Private Product Items'),
		(66018, 'Sport Equipment'),
		(66019, 'Farmers Equipment'),
    
		(66020, 'Alcoholic Beverages'),
		(66021, 'Plant Based Food Products'),
		(66022, 'Ciggarettes'),
		(66023, 'Scientific Equipment'),
		(66024, 'Kitchen Equipment'),
    
		(66025, 'Medicine'),
		(66026, 'Hospital Machinery')
;

/*Products data table------------------------------------------------------------------*/
INSERT INTO products (Product_ID, Product_Name, Supplier_ID, Category_ID, Qauntity_Per_Unit, 
Unit_Price, Units_in_Stock, Units_in_Order, Reorder_Level, Discount, Discontinued)
VALUES  (77701, 'Scholtz', 11005, 66005, '1 box', 700, 10, 90, 250, '0.01%', 'false'),
		(77702, 'Vacants', 11006, 66006, '2 boxes', 500, 15, 75, 200, '0.01%', 'false'),
		(77703, 'Eighty-Five', 11007, 66007, '2 boxes', 44, 74, 100, 350, '0.01%', 'false'),
		(77704, 'Bandos', 11008, 66008, '1 box', 400, 40, 80, 300, '0.01%', 'false'),
		(77705, 'Monsieur', 11009, 66009, '2 boxes', 550, 25, 60, 410, '10%', 'true'),
    
		(77706, 'Grand Tour', 11010, 66010, '3 boxes', 900, 15, 100, 440, '10%', 'true'),
		(77707, 'Russ',11011, 66011, '2 boxes', 450, 17, 60, 250, '0.01%', 'false'),
		(77708, 'Scouts', 11012, 66012, '2 boxes', 320, 20, 93, 100, '0.01%', 'false'),
		(77709, 'Red Bat', 11013, 66013, '3 boxes', 920, 10, 65, 350, '0.01%', 'false'),
		(77710, 'Drew', 11014, 66014, '1 box', 620, 15, 140, 81, '20%', 'true'),
    
		(77711, 'Cattle Racks', 11015, 66015, '2 boxes', 430, 80, 20, 140, '0.01%', 'false'),
		(77712, 'Hawking', 11016, 66016, '3 boxes', 800, 17, 70, 150, '0.01%', 'false'),
		(77713, 'Thrones', 11017, 66017, '3 boxes', 700, 20, 69, 170, '10%','true'),
		(77714, 'Hard Homes', 11018, 66018, '4 boxes', 500, 18, 67, 120, '0.01%','false'),
		(77715, 'Golazos', 11019, 66019, '2 boxes', 250, 11, 65, 150, '15%','true'),
   
		(77716, 'Cuts & Crafts', 11020, 66020, '3 boxes', 800, 2, 83, 220, '10%', 'true'),
		(77717, 'Perfect kast', 11021, 66021, '4 boxes', 1005, 10, 60, 180, '0.01%', 'false'),
		(77718, 'Bagged', 11022, 66022, '4 boxes', 900, 6, 68, 170, '0.01%', 'false'),
		(77719, 'Sun Blossoms', 11023, '66023', '5 boxes', 1200, 2, 76, 300, '20%', 'true'),
		(77720, 'Bulls', 11024, 66024, '2 boxes', 300, 3, 97, 250, '10%', 'true'),
    
		(77721, 'The Doleac', 11025, 66025, '6 boxes', 1600, 1, 91, 250, '15%', 'true'),
		(77722, 'Pyra-mid', 11026, 66026, '5 boxes', 1300, 15, 67, 200, '12%', 'true')
;

/*Orders data table-------------------------------------------------------*/
INSERT INTO orders (Order_ID, Customer_ID, Emp_ID, Order_Date, Required_Date, Shipped_Date, Shipper_ID, Ship_Via, Freight, 
			Ship_Name, Ship_Adress, Ship_City, Ship_Region, Ship_PostalCode, Ship_Country)
 VALUES (0050, 4401, 100, '2022-01-05', '2022-04-04', '2022-02-10', 001, 2200, 3.5, 'SS Persic',
		'Jebel Ali', 'Yangtze Delta', 'West Asia', '555-029', 'United Arab Emirates'),
		(0051, 4402, 101, '2022-01-06', '2022-04-02', '2022-02-11', 002, 3300, 4.2, 'RJ Hacket',
		'Singapore', 'Singapore Strait', 'Southeast Asia', '383-843', 'Singapore'),
		(0052, 4403, 102, '2022-01-06', '2022-04-03', '2022-02-14', 003, 4400, 2.2, 'MV Robert S Pierson',
		'Busan', 'Korean Strait', 'East Asia', '582-758', 'South Korea'),
		(0053, 4404, 103, '2022-01-04', '2022-04-06', '2022-02-15', 004, 5500, 6, 'SS Naronic',
		'Hong Kong', 'Pearl River Delta', 'East Asia', '349-393', 'Hong Kong'),
		(0054, 4405, 104, '2022-01-03', '2022-04-05', '2022-02-16', 005, 6600, 3, 'SS Ohio',
		'Rotterdam', 'Rhine delta', 'Europe', '438-893', 'Netherlands'),
    
		(0055, 4406, 105, '2022-01-06', '2022-04-03', '2022-01-19', 006, 0012, 5.1, 'MV Harpa', 
		'Hamburg', 'Elbe River', 'Europe', '922-902', 'Germany'),
		(0056, 4407, 106, '2022-01-08', '2022-04-05', '2022-01-18', 007, 0043, 5.3, 'Gurdrun Maersk',
		'Tanjung Pelepas', 'Malacca Strait', 'Southeast Asia', '349-382', 'Malaysia'),
		(0057, 4408, 107, '2022-01-07', '2022-04-04', '2022-01-13', 008, 0074, 4, 'SS Emperor',
		'Tanjung Priok', 'Gulf of Thailand', 'Southeast Asia', '020-439', 'Thailand'),
		(0058, 4409, 108, '2022-01-06', '2022-04-07', '2022-01-20', 009, 0083, 2, 'MOL Enterprise',
		'Heijin Yokohama', 'Tokyo Bay', 'East Asia', '030-042', 'Japan'),
		(0059, 4410, 109, '2022-01-09', '2022-04-06', '2022-01-17', 010, 0080, 3.6, 'MV Calumet',
		'Long Beach', 'East Coast', 'North America', '902-949', 'United States'),
    
		(0060, 4411, 110, '2022-01-06', '2022-04-11', '2022-01-21', 011, 0250, 6.5, 'Algoma Sault', 
		'Tanjung Priok', 'Java sea', 'Southeast Asia', '438-838', 'Indonesia'),
		(0061, 4412, 111, '2022-01-08', '2022-04-14', '2022-01-23', 012, 0460, 4, 'SS Bardic', 
		'Colombo', 'Sri Lanka', 'South Asia', '822-558', 'Sri Lanka'),
		(0062, 4413, 112, '2022-01-09', '2022-04-12', '2022-01-25', 013, 0290, 5, 'MS Augustus',
		'Saigon', 'East Vietnam Sea', 'Southeast Asia', '004-899', 'Vietnam'),
		(0063, 4414, 113, '2022-01-07', '2022-04-13', '2022-01-22', 014, 0940, 4, 'USS Azimech (AK-124)',
		'Tanger-Med', 'Wester Mediterranean', 'North Africa', '805-222', 'Morocco'),
		(0064, 4415, 114, '2022-01-10', '2022-04-16', '2022-01-24', 015, 0470, 3, 'SS Bovic',
		'Piraeus', 'Eastern Mediterranean', 'Europe', '111-842', 'Greece'),
    
		(0065, 4416, 115, '2022-01-11', '2022-04-18', '2022-01-25', 016, 0077, 2, 'SS Asiatic',
		'Mumbai', 'Arabian Asia', 'Asia', '700-541', 'India'),
		(0066, 4417, 116, '2022-01-13', '2022-04-16', '2022-01-27', 017, 0099, 1.5, 'MS Augustus',
		'Jeddah', 'Red Sea', 'West Asia', '158-582', 'Saudi Arabia'),
		(0067, 4418, 117, '2022-01-15', '2022-04-20', '2022-01-26', 018, 0066, 2, 'MV Sea Star',
		'Colon', 'Caribbean Coast', 'Central America', '102-201', 'Panama'),
		(0068, 4419, 118, '2022-01-17', '2022-04-19', '2022-01-28', 019, 0088, 3, 'Savannah Express',
		'Santos', 'South Atlantic Ocean', 'South America', '928-552', 'Brazil'),
		(0069, 4420, 119, '2022-01-12', '2022-04-17', '2022-01-29', 020, 0011, 2, 'SS Argus',
		'Salalah', 'Arabian Sea', 'West Asia', '805-518', 'Oman'),
    
		(0070, 4421, 120, '2022-01-14', '2022-04-21', '2022-01-30', 021, 0054, 3, 'MT Stolt Surf',
		'Dongguan', 'Beibu Gulf', 'East Asia', '353-266', 'China'),
		(0071, 4422, 121, '2022-01-16', '2022-04-15', '2022-01-24', 022, 0097, 3.5, 'SS Suevic', 
		'Rotterdam','Rhine delta', 'Europe', '438-893', 'Netherlands')
;

/*Order details data table ------------------------------------------------------*/
INSERT INTO order_details (Order_ID, Product_ID, Unit_Price, Quantity, Discount)
VALUES  (0050, 77701, 150000, 90, '10%'),
		(0051, 77702, 69000, 75, '2%'),
		(0052, 77703, 70000, 74, '5%'),
		(0053, 77704, 58000, 80, '0.06%'),
		(0054, 77705, 100000, 60, '0.02%'),
    
		(0055, 77706, 130000, 100, '0.03%'),
		(0056, 77707, 70000, 60, '0.02%'),
		(0057, 77708, 85000, 93, '0.04%'),
		(0058, 77709, 91000, 65, '10%'),
		(0059, 77710, 50000, 81, '12%'),
    
		(0060, 77711, 140000, 80, '0.1%'),
		(0061, 77712, 70000, 70, '0.9%'),
		(0062, 77713, 94000, 69, '0.5%'),
		(0063, 77714, 80000, 67, '0.0%'),
		(0064, 77715, 60000, 65, '0.0%'),
    
		(0065, 77716, 160000, 83, '5%'),
		(0066, 77717, 70000, 60, '10%'),
		(0067, 77718, 100000, 68, '10%'),
		(0068, 77719, 97000, 76, '5%'),
		(0069, 77720, 85000, 97, '0.1%'),
    
		(0070, 77721, 105000, 91, '5%'),
		(0071, 77722, 80000, 67, '7%')
;

/*Products data table------------------------------------------------------------------*/
INSERT INTO products (Product_ID, Product_Name, Supplier_ID, Category_ID, Qauntity_Per_Unit, 
Unit_Price, Units_in_Stock, Units_in_Order, Reorder_Level, Discount, Discontinued)
VALUES  (77701, 'Scholtz', 11005, 66005, '1 box', 700, 10, 90, 250, '0.01%', 'false'),
		(77702, 'Vacants', 11006, 66006, '2 boxes', 500, 15, 75, 200, '0.01%', 'false'),
		(77703, 'Eighty-Five', 11007, 66007, '2 boxes', 44, 74, 100, 350, '0.01%', 'false'),
		(77704, 'Bandos', 11008, 66008, '1 box', 400, 40, 80, 300, '0.01%', 'false'),
		(77705, 'Monsieur', 11009, 66009, '2 boxes', 550, 25, 60, 410, '10%', 'true'),
    
		(77706, 'Grand Tour', 11010, 66010, '3 boxes', 900, 15, 100, 440, '10%', 'true'),
		(77707, 'Russ',11011, 66011, '2 boxes', 450, 17, 60, 250, '0.01%', 'false'),
		(77708, 'Scouts', 11012, 66012, '2 boxes', 320, 20, 93, 100, '0.01%', 'false'),
		(77709, 'Red Bat', 11013, 66013, '3 boxes', 920, 10, 65, 350, '0.01%', 'false'),
		(77710, 'Drew', 11014, 66014, '1 box', 620, 15, 140, 81, '20%', 'true'),
    
		(77711, 'Cattle Racks', 11015, 66015, '2 boxes', 430, 80, 20, 140, '0.01%', 'false'),
		(77712, 'Hawking', 11016, 66016, '3 boxes', 800, 17, 70, 150, '0.01%', 'false'),
		(77713, 'Thrones', 11017, 66017, '3 boxes', 700, 20, 69, 170, '10%','true'),
		(77714, 'Hard Homes', 11018, 66018, '4 boxes', 500, 18, 67, 120, '0.01%','false'),
		(77715, 'Golazos', 11019, 66019, '2 boxes', 250, 11, 65, 150, '15%','true'),
   
		(77716, 'Cuts & Crafts', 11020, 66020, '3 boxes', 800, 2, 83, 220, '10%', 'true'),
		(77717, 'Perfect kast', 11021, 66021, '4 boxes', 1005, 10, 60, 180, '0.01%', 'false'),
		(77718, 'Bagged', 11022, 66022, '4 boxes', 900, 6, 68, 170, '0.01%', 'false'),
		(77719, 'Sun Blossoms', 11023, '66023', '5 boxes', 1200, 2, 76, 300, '20%', 'true'),
		(77720, 'Bulls', 11024, 66024, '2 boxes', 300, 3, 97, 250, '10%', 'true'),
    
		(77721, 'The Doleac', 11025, 66025, '6 boxes', 1600, 1, 91, 250, '15%', 'true'),
		(77722, 'Pyra-mid', 11026, 66026, '5 boxes', 1300, 15, 67, 200, '12%', 'true')
;

/*Customers data table-------------------------------------------------------------------*/
INSERT INTO customers (Customer_ID, Company_Name, Contact_name, Contact_Title, Address, City, Region, Postal_Code,
			Country, Phone_Number, Email)
VALUES  (4401, 'Berry blur', 'James', 'Mr', 'Eppin str 92', 'Pretoria', 'Gauteng', 2007,
		'South-Africa', '(021) 350 3022', 'berryblur@gmail.com'),
		(4402, 'Footprint', 'Maguire', 'Mr', 'Wood str 21', 'Durban', 'KwaZulu-Natal', 3609,
		'South-Africa', '(021) 348 9471', 'footprint@gmail.com'),
		(4403, 'The Brew', 'Sterling', 'Mr', 'Glen str 200', 'Bon Accord', 'Gauteng', 1009,
		'South-Africa', '(021) 294 2392', 'thebrew10@gmail.com'),
		(4404, 'Clipping', 'West', 'Mrs', 'Pinetree str 239', 'Durban', 'KwaZulu-Natal', 4004,
		'South-Africa', '(021) 402 4850', 'clipping95@gmail.com'),
		(4405, 'New Mars', 'Patrice', 'Mrs', 'Vasco str 38', 'Soweto', 'Gauteng', 1804,
		'South-Africa', '(021) 319 2841', 'marsnew90@gmail.com'),
    
		(4406, 'The Levels', 'Miller', 'Mr', 'Viking str 39', 'East London', 'Eastern Cape', 5200,
		'South-Africa', '(021) 888 3832', 'thelevels22@gmail.com'),
		(4407, 'FUGU', 'Post', 'Mrs', 'Down str 181', 'Port Elizabeth', 'Eastern Cape', 6006,
		'South-Africa', '(021) 616 8534', 'fugu01@gmail.com'),
		(4408, 'Set Factory', 'Gross', 'Mrs', 'Blomvlei str 235', 'Port Elizabeth', 'Eastern Cape', 6045,
		'South-Africa', '(021) 232 7284', 'setfactory@gmail.com'),
		(4409, 'The Country', 'Ronaldo', 'Mr', 'Ascot str 230', 'East London', 'Eastern Cape', 5214,
		'South-Africa', '(021) 863 2763', 'thecountry00@gmail.com'),
		(4410, 'BLACK', 'Bean', 'Mrs', 'Amendelrug str 348', 'Cape Town', 'Western Cape', 7460,
		'South-Africa', '(021) 238 2742', 'bean11@gmail.com'),
    
		(4411, 'Space Track', 'May', 'Mr', 'Annandale str 254', 'Cape Town', 'Western Cape', 7764,
		'South-Africa', '(021) 192 2838', 'spacetrack@gmail.com'),
		(4412, 'Tee Cup', 'Hammond', 'Mr', 'Tygerdal str 238', 'Cape Town', 'Western Cape', 7460,
		'South-Africa', '(021) 929 0382', 'teecup@gmail.com'),
		(4413, 'Shots Fire', 'Collins', 'Mrs', 'Athlone str 237', 'Cape Town', 'Western Cape', 7764,
		'South-Africa', '(021) 332 0938', 'shotsfire@gmail.com'),
		(4414, 'Limitless', 'Jackson', 'Mrs', 'Thornton str 324', 'Cape Town', 'Western Cape', 7764,
		'South-Africa', '(021) 111 3848', 'limitless19@gmail.com'),
		(4415, 'Magic World', 'Smith', 'Mrs', 'Goodness str 232', 'Cape Town', 'Western Cape', 7580,
		'South-Africa', '(021) 199 3399', 'magicworld02@gmail.com'),
    
		(4416, 'Kling-On', 'Stones', 'Mr', 'Belthome str 10', 'East London', 'Eastern Cape', 5214,
		'South-Africa', '(021) 239 3953', 'klingon22@gmail.com'),
		(4417, 'Big Bang', 'Raddock', 'Mrs', 'Blomvlei str 231', 'Port Elizabeth', 'Eastern Cape', 6014,
		'South-Africa', '(021) 040 0399', 'bigbang10@gmail.com'),
		(4418, 'Dry Wall', 'Jones', 'Mrs', 'Rothmanpark str 210', 'Cape Town', 'Western Cape', 7580,
		'South-Africa', '(021) 439 2938', 'drywall02@gmail.com'),
		(4419, 'GLOSS', 'Myburgh', 'Mrs', 'Area str 49', 'Durban', 'KwaZulu-Natal', 4000,
		'South-Africa', '(021) 294 2022', 'gloss@gmail.com'),
		(4420, 'Fire Room', 'Banda', 'Mr', 'Ekuphumleni str 102', 'Durban', 'KwaZulu-Natal', 3609,
		'South-Africa', '(021) 402 2942', 'fireroom@gmail.com'),
    
		(4421, 'Bounded', 'Rickets', 'Mr', 'Bongweni str 21', 'Soweto', 'Gauteng', 1723,
		'South-Africa', '(021) 294 2945', 'bounded@gmail.com'),
		(4422, 'Scraper', 'Adonis', 'Mrs', 'Space str 199', 'East London', 'Eastern cape', 5241,
		'South-Africa', '(021) 002 204', 'scraper@gmail.com')
;

/*Customer Demographics data table---------------------------------------------------------*/
INSERT INTO customer_demographics (Customer_Type_ID, Customer_Desc)
VALUES  (8801, 'Purchase of frozen goods'),
		(8802, 'Purchase of computers'),
		(8803, 'Purchase of car Parts'),
		(8804, 'Purchase of clothing Materials'),
		(8805, 'Purchase of metals'),   

		(8806, 'Purchase of plastic containers'),
		(8807, 'Purchase of phones'),
		(8808, 'Purchase of car parts'),
		(8809, 'Purchase of hardware materials'),
		(8810, 'Purchase of compressors'),
    
		(8811, 'Purchase of refridgerators'),
		(8812, 'Purchase of accessories'),
		(8813, 'Purchase of private product items'),
		(8814, 'Purchase of sport equipment'),
		(8815, 'Purchase of farmers equipment'),
    
		(8816, 'Purchase of Alcoholic Beverages'),
		(8817, 'Purchase of plant based food products'),
		(8818, 'Purchase of ciggarettes'),
		(8819, 'Purchase of scientific equipment'),
		(8820, 'Purchase of kitchen equipment'),
    
		(8821, 'Purchase of medicine'),
		(8822, 'Purchase of hospital machinery')
;

/*Customer demo data table------------------------------------------------------------------*/
INSERT INTO customer_demo (Customer_ID, Customer_Type_ID)
VALUES  (4401, 8801),
		(4402, 8802),
		(4403, 8803),
		(4404, 8804),
		(4405, 8805),
    
		(4406, 8806),
		(4407, 8807),
		(4408, 8808),
		(4409, 8809),
		(4410, 8810),
    
		(4411, 8811),
		(4412, 8812),
		(4413, 8813),
		(4414, 8814),
		(4415, 8815),
    
		(4416, 8816),
		(4417, 8817),
		(4418, 8818),
		(4419, 8819),
		(4420, 8820),
    
		(4421, 8821),
		(4422, 8822)
;