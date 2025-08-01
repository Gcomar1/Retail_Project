-- display sales of specfic date
SELECT * FROM retails_table
WHERE sale_date = '2022-11-05' --<< put data you need

--------------
--Write a SQL query to retrieve all transactions where the category is 'Clothing' 
--and the quantity sold is more than 4 in the month of Nov-2022:
SELECT*
FROM retails_table r 
WHERE 
  category = 'Clothing'
  AND EXTRACT(MONTH FROM sale_date::DATE) = 11
  AND EXTRACT(YEAR FROM sale_date::DATE) = 2022
  AND quantiy >= 4

  --------------------
  --Write a SQL query to calculate the total sales (total_sale) for each category.:
SELECT
  rt.category,
  SUM(rt.total_sale) AS category_sales
FROM retails_table rt
GROUP BY rt.category;

------------------
--Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
SELECT
    r.category,
    ROUND(AVG(age), 2) as avg_age
FROM retails_table r
WHERE category = 'Beauty'
GROUP BY r.category

------------------
--Write a SQL query to find all transactions where the total_sale is greater than 1000.:
SELECT * FROM retails_table r
WHERE r.total_sale > 1000

-----------------
--Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
SELECT 
    category,
    gender,
    COUNT(*) as total_trans
FROM retails_table 
GROUP 
    BY 
    category,
    gender
ORDER BY 1

----------------
--Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
SELECT
    EXTRACT(MONTH FROM sale_date) AS month_,
    EXTRACT(YEAR FROM sale_date) AS year_,
    AVG(total_sale) AS avg_sale
FROM retails_table
GROUP BY year_, month_
ORDER BY avg_sale DESC 
LIMIT 2; 


------------
--**Write a SQL query to find the top 5 customers based on the highest total sales **:
SELECT 
    r.transactions_id,
    sum(total_sale) as total_sale
from retails_table r 
GROUP BY r.transactions_id
ORDER BY total_sale DESC
LIMIT 5 ; 


------------
---Write a SQL query to find the number of unique customers who purchased items from each category.:
SELECT 
    category,    
    COUNT(DISTINCT customer_id) as cnt_unique_cs
FROM retails_table
GROUP BY category

---------
--Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
SELECT *,
  CASE 
    WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
    WHEN EXTRACT(HOUR FROM sale_time) >= 12 AND EXTRACT(HOUR FROM sale_time) < 17 THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM retails_table;
