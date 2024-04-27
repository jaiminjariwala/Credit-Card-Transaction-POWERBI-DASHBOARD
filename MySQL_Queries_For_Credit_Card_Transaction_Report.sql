-- SQL Query to create and import data from csv files:

-- 0. Create a database 
CREATE DATABASE credit_card_db;

USE credit_card_db; 

-- 1. Create cc_detail table
CREATE TABLE cc_detail(
	Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10, 2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Vol INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

-- 2. Create cust_detail table
CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_level VARCHAR(50),
    Marital_Status VARCHAR(20),
    state_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_loan VARCHAR(5),
    contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

-- 3. Loading the csv file data into cc_detail table
-- REFERENCE TO LOAD CSV INTO MYSQL TABLE: (https://www.youtube.com/watch?v=C_K6w9c7Fqc&t=414s&ab_channel=REGexSoftware)
LOAD DATA INFILE 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/credit_card_modified.csv'  -- change (\) to (/)
INTO TABLE cc_detail
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

-- 4. Loading the csv file data into cust_detail table
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customer (1).csv'  -- change (\) to (/)
INTO TABLE cust_detail
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

-- 5. Viewing the data
SELECT * from cc_detail;
SELECT * from cust_detail;

-- 6. Insert new additional data into SQL, using same COPY function

-- copy additional data (week-53) in cc_detail table
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cc_add_modified.csv'
INTO TABLE cc_detail
FIELDS TERMINATED BY ','
IGNORE 1 LINES;

-- copy additional data (week-53) in cust_detail table
LOAD DATA INFILE
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cust_add.csv'  -- change (\) to (/)
INTO TABLE cust_detail
FIELDS TERMINATED BY ','
IGNORE 1 LINES;