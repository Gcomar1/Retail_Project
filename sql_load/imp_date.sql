COPY Retails_Table(transactions_id, sale_date, sale_time, customer_id, gender, age, category, quantiy, price_per_unit, cogs, total_sale)
FROM 'C:/Program Files/PostgreSQL/17/data/retail.csv'
DELIMITER ','
CSV HEADER;
