CREATE TABLE retails_table (
    transactions_id INT,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(15),
    quantiy INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

ALTER TABLE retails_table
ADD COLUMN profit FLOAT;

UPDATE retails_table
SET profit = total_sale - cogs;
