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

3. Created (week_num2) column in (cc_detail) table, for to get sorted whole number for original (week_num) column <br>
   ```week_num2 = WEEKNUM('credit_card_db cc_detail'[Week_Start_Date])```

4. Created (Revenue) column in (cc_detail) table <br>
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

# `TOP 10 Project Insights:`
1. Revenue Increased by around 28.8% ($55M to $57M) in last 53th week (clearly visible from below chart
   <img width="394" alt="image" src="https://github.com/jaiminjariwala/Credit-Card-Transaction-POWERBI-DASHBOARD/assets/157014747/59c730c4-d70f-4d95-95c1-c1acec5a8446">
   <img width="543" alt="image" src="https://github.com/jaiminjariwala/Credit-Card-Transaction-POWERBI-DASHBOARD/assets/157014747/821041ec-efce-4b21-81fa-95a60f3c01fe">
   
2. Total Transaction Amount Increased from $45M -> $46M
3. Total Interest Earned Increased from $7.8M -> $8.0M

4. Male Customers are contributing more in Revenue in comparision to Female customers <br>
   <img width="284" alt="image" src="https://github.com/jaiminjariwala/Credit-Card-Transaction-POWERBI-DASHBOARD/assets/157014747/71f9af8a-0286-4573-8e7f-5f1aeece346e">
   <img width="282" alt="image" src="https://github.com/jaiminjariwala/Credit-Card-Transaction-POWERBI-DASHBOARD/assets/157014747/159c666e-cc95-4737-addf-978c609adeba">
   
5. Blue and Silver Card Holder Customers Contributing to `93%` of overall transactions <br>
   <img width="174" alt="image" src="https://github.com/jaiminjariwala/Credit-Card-Transaction-POWERBI-DASHBOARD/assets/157014747/20e62103-95ce-46da-9b34-2af4f17562d8">

6. TX(Texas), NY(New York) and CA(California) states are contributing `72%` of overall transactions <br>
   <img width="262" alt="image" src="https://github.com/jaiminjariwala/Credit-Card-Transaction-POWERBI-DASHBOARD/assets/157014747/deb8e52c-8116-45a1-8bb0-aa33cba2658b">

7. Overall Activation Rate is `57.5%`
8. Overall Delinquent Rate(the amount of debt/loan that is past due, i.e customers who are unable to pay their loan) is `6.06%`

9. Customers who are graduated have contributed $22M / $55M = `40%` of overall transactions <br>
   <img width="231" alt="image" src="https://github.com/jaiminjariwala/Credit-Card-Transaction-POWERBI-DASHBOARD/assets/157014747/81a6ef77-91a4-4df0-b888-d0ec750af587">

10. Similary customers who are businessman have contributed $17.4M / $55M = `31.6%` of overall transactions <br>
    <img width="215" alt="image" src="https://github.com/jaiminjariwala/Credit-Card-Transaction-POWERBI-DASHBOARD/assets/157014747/89eae9d7-4347-4256-8f18-65bebc74ab2d">
