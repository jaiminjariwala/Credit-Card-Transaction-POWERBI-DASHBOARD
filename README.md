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
1. Created `AgeGroup` column in `cust_detail` table
   ```
   AgeGroup = SWITCH(
    TRUE(),
    'credit_card_db cust_detail'[Customer_Age] < 30, "20-30",
    'credit_card_db cust_detail'[Customer_Age] >= 30 && 'credit_card_db cust_detail'[Customer_Age] < 40, "30-40",
    'credit_card_db cust_detail'[Customer_Age] >= 40 && 'credit_card_db cust_detail'[Customer_Age] < 50, "40-50",
    'credit_card_db cust_detail'[Customer_Age] >= 50 && 'credit_card_db cust_detail'[Customer_Age] < 60, "50-60",
    'credit_card_db cust_detail'[Customer_Age] >= 60, "60+",
    "unknown"
)```

2. Created `IncomeGroup` column in `cust_detail` table
   ```
   IncomeGroup = SWITCH(
    TRUE(),
    'credit_card_db cust_detail'[Income] < 35000, "Low",
    'credit_card_db cust_detail'[Income] >= 35000 && 'credit_card_db cust_detail'[Income] < 70000, "Med",
    'credit_card_db cust_detail'[Income] >= 70000, "High",
    "unknown"
)```

