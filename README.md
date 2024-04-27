# Credit Card Transaction Weekly PowerBI Dashboard

# `Project Objective:`
## To develop a comprehensive credit card weekly PowerBI dashboard that provides real time insights into key-performance-metrics and trends, enabling stakeholders to monitor and analyze credit card operations iffectively.

# `Preparing Data:`
1. Prepare/Download the given CSV files
2. CREATE TABLES in SQL (MySQL / PostgreSQL)
3. IMPORT CSV File into SQL.

# `Loading/Importing data from (CSV)/(Excel) to MySQL`:
<img width="1280" alt="Loading_csv_data_into_MySQL" src="https://github.com/jaiminjariwala/Credit-Card-Transaction-POWERBI-DASHBOARD/assets/157014747/2370db43-dd65-4ea5-908f-7cfe13a14dd2">


# `Loading/Importing data from (CSV)/(Excel) to PostgreSQL`:
<img width="1280" alt="Loading_csv_data_into_postgresql" src="https://github.com/jaiminjariwala/Credit-Card-Transaction-POWERBI-DASHBOARD/assets/157014747/23916091-f6f9-4389-9cc1-ff21722f1061">

# `DAX Queries Written:`
1. Created (AgeGroup) column in (cust_detail) table
   ```
   AgeGroup = SWITCH(
    TRUE(),
    'credit_card_db cust_detail'[Customer_Age] < 30, "20-30",
    'credit_card_db cust_detail'[Customer_Age] >= 30 && 'credit_card_db cust_detail'[Customer_Age] < 40, "30-40",
    'credit_card_db cust_detail'[Customer_Age] >= 40 && 'credit_card_db cust_detail'[Customer_Age] < 50, "40-50",
    'credit_card_db cust_detail'[Customer_Age] >= 50 && 'credit_card_db cust_detail'[Customer_Age] < 60, "50-60",
    'credit_card_db cust_detail'[Customer_Age] >= 60, "60+",
    "unknown"
   )
   ```
   
2. Created (IncomeGroup) column in (cust_detail) table
   ```
   IncomeGroup = SWITCH(
    TRUE(),
    'credit_card_db cust_detail'[Income] < 35000, "Low",
    'credit_card_db cust_detail'[Income] >= 35000 && 'credit_card_db cust_detail'[Income] < 70000, "Med",
    'credit_card_db cust_detail'[Income] >= 70000, "High",
    "unknown"
   )
   ```

3. Created (week_num2) column in (cc_detail) table, for to get sorted whole number for original (week_num) column
   ```week_num2 = WEEKNUM('credit_card_db cc_detail'[Week_Start_Date])```

4. Created (Revenue) column in (cc_detail) table
   ```Revenue = 'credit_card_db cc_detail'[Annual_Fees] + 'credit_card_db cc_detail'[Total_Trans_Amt] + 'credit_card_db cc_detail'[Interest_Earned]```

5. Created (Current_Week_Revenue) and (Previous_Week_Revenue) MEASURE in (cc_detail) table
   ```
   Current_Week_Revenue = CALCULATE(
    SUM('credit_card_db cc_detail'[Revenue]),
    FILTER(
        ALL('credit_card_db cc_detail'),
        'credit_card_db cc_detail'[week_num2] = MAX('credit_card_db cc_detail'[week_num2])))
   ```
   ```
   Previous_Week_Revenue = CALCULATE(
    SUM('credit_card_db cc_detail'[Revenue]),
    FILTER(
        ALL('credit_card_db cc_detail'),
        'credit_card_db cc_detail'[week_num2] = MAX('credit_card_db cc_detail'[week_num2])-1))
   ```

# `Project Insights:`

