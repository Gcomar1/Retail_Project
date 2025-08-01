/*
Record Count: Determine the total number of records in the dataset.
Customer Count: Find out how many unique customers are in the dataset.
Category Count: Identify all unique product categories in the dataset.
Null Value Check: Check for any null values in the dataset and delete records with missing data.
*/

SELECT
    COUNT(*) as transaction_count, --count total records
    COUNT(DISTINCT r.customer_id) as unique_customer -- how many unique customer
from retails_table r
    --Display DISTINCT category 
SELECT DISTINCT r.category
FROM retails_table r; 
-- check null 
SELECT *
FROM retails_table
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL
   OR profit IS NULL;
-- delete any row have null value 
DELETE FROM retails_table
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL
   OR profit IS NULL;

SELECT * FROM retails_table