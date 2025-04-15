-- 1. Database Setup
-- Database Creation.
-- Table Creation.

CREATE DATABASE sql_project_1;
CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);

SELECT 
    *
FROM
    retail_sales;
SELECT 
    COUNT(*)
FROM
    retail_sales;

-- 2. Data Exploration & Cleaning
-- Customer Count: Find out how many unique customers are in the dataset.
SELECT 
    COUNT(DISTINCT (customer_id))
FROM
    retail_sales;

-- Category Count: Identify all unique product categories in the dataset.
SELECT DISTINCT
    (category)
FROM
    retail_sales;
 
-- Null Value Check: Check for any null values in the dataset and delete records with missing data
SELECT 
    *
FROM
    retail_sales
WHERE
    sale_date IS NULL OR sale_time IS NULL
        OR customer_id IS NULL
        OR gender IS NULL
        OR age IS NULL
        OR category IS NULL
        OR quantity IS NULL
        OR price_per_unit IS NULL
        OR cogs IS NULL;
    
DELETE FROM retail_sales 
WHERE
    sale_date IS NULL OR sale_time IS NULL
    OR customer_id IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL;
    
SELECT 
    COUNT(*)
FROM
    retail_sales;
    
-- 3. Data Analysis & Findings
-- Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT 
    *
FROM
    retail_sales
WHERE
    sale_date = '2022-11-05';

-- Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is equal / more than 4 in the month of Nov-2022:
SELECT 
    *
FROM
    retail_sales
WHERE
    category = 'Clothing' AND quantity >= 4
        AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11';

-- Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT 
    category, SUM(total_sale) AS net_sales
FROM
    retail_sales
GROUP BY category;

-- Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT 
    ROUND(AVG(age), 1) AS AVG_Age
FROM
    retail_sales
WHERE
    category = 'Beauty';

-- Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT 
    *
FROM
    retail_sales
WHERE
    total_sale > 1000
ORDER BY total_sale ASC;

-- Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT 
    category, gender, COUNT(*) AS t_transactions
FROM
    retail_sales
GROUP BY category , gender;

-- Write a SQL query to calculate the average sale for each month.
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sale
FROM
    retail_sales
GROUP BY year , month;

-- Write a SQL query to find the top 5 customers based on the highest total sales
SELECT 
    customer_id, SUM(total_sale) AS sales
FROM
    retail_sales
GROUP BY customer_id
ORDER BY sales DESC
LIMIT 5;

-- Write a SQL query to create each shift and find number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)

with hourly_sales as (select *, 
CASE 
When Hour(sale_time) < 12 then 'Morning'
When Hour(sale_time) between 12 And 17 then 'Afternoon'
else 'Eevening'
End as shift from retail_sales)
select shift, count(*) no_of_orders from hourly_sales group by shift;

-- Write a SQL query to find the number of unique customers who purchased items from each category
SELECT 
    category, COUNT(DISTINCT (customer_id)) AS unique_customers
FROM
    retail_sales
GROUP BY category