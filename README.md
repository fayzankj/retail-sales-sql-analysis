# Retail Sales Analysis SQL Project

## Project Overview

This project showcases my ability to design, build, and analyze a retail sales database using MySQL. From setting up the database to performing complex business-driven queries, I independently executed each stage of the project to extract meaningful insights and demonstrate core SQL and data analysis capabilities. It is an evolving part of my portfolio aimed at highlighting practical, hands-on experience with real-world data scenarios.

## Objectives

1. **Database Initialization**: Design and populate a structured retail sales database.
2. **Data Cleaning**: Identify and eliminate records with missing or null values to ensure data integrity.
3. **Exploratory Data Analysis (EDA)**: Uncover patterns and characteristics within the dataset.
4. **Business Insight Generation**: Develop SQL queries to answer real-world business questions, providing actionable insights.

## Project Structure

### 1. Database Setup

- **Database Creation**: A database named sql_project_1 was created to house the retail sales data.
- **Table Creation**:The retail_sales table includes attributes such as transaction ID, sale date and time, customer demographics, product details, and financial metrics like quantity, unit price, COGS, and total sale amount.

```sql
CCREATE DATABASE sql_project_1;

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
```

### 2. Data Exploration & Cleaning

- **Record Count**: Total transaction records and unique customers identified.
- **Category Count**: Extracted distinct product categories.
- **Null Value Check**: Ensured data completeness by detecting and removing rows with null values.

```sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

### 3. Business Analysis Queries

A series of SQL queries were crafted to respond to targeted business questions and support strategic decision-making:

1. **Write a SQL query to retrieve all columns for sales made on '2022-11-05**:
```sql
SELECT * 
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

2. **Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022**:
```sql
SELECT 
  *
SELECT * 
FROM retail_sales
WHERE category = 'Clothing' 
  AND quantity >= 4 
  AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11';
```

3. **Write a SQL query to calculate the total sales (total_sale) for each category.**:
```sql
SELECT category, SUM(total_sale) AS net_sales 
FROM retail_sales 
GROUP BY category;
```

4. **Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.**:
```sql
SELECT ROUND(AVG(age), 1) AS AVG_Age 
FROM retail_sales 
WHERE category = 'Beauty';
```

5. **Write a SQL query to find all transactions where the total_sale is greater than 1000.**:
```sql
SELECT * 
FROM retail_sales 
WHERE total_sale > 1000 
ORDER BY total_sale ASC;
```

6. **Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.**:
```sql
SELECT category, gender, COUNT(*) AS t_transactions 
FROM retail_sales 
GROUP BY category, gender;
```

7. **Write a SQL query to calculate the average sale for each month **:
```sql
SELECT 
    YEAR(sale_date) AS year,
    MONTH(sale_date) AS month,
    AVG(total_sale) AS avg_sale
FROM retail_sales
GROUP BY year, month;
```

8. **Write a SQL query to find the top 5 customers based on the highest total sales **:
```sql
SELECT customer_id, SUM(total_sale) AS sales 
FROM retail_sales 
GROUP BY customer_id 
ORDER BY sales DESC 
LIMIT 5;
```

9. **Write a SQL query to find the number of unique customers who purchased items from each category.**:
```sql
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers 
FROM retail_sales 
GROUP BY category;
```

10. **Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)**:
```sql
WITH hourly_sales AS (
    SELECT *, 
        CASE 
            WHEN HOUR(sale_time) < 12 THEN 'Morning'
            WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
            ELSE 'Evening'
        END AS shift 
    FROM retail_sales
)
SELECT shift, COUNT(*) AS no_of_orders 
FROM hourly_sales 
GROUP BY shift;
```

## Insights & Findings

- **Customer Profile Analysis**: Sales span across multiple demographics, offering insights into age-related purchasing behavior.
- **Premium Transactions**: A significant number of sales exceed 1000 in value, indicating high-margin opportunities.
- **Category Performance**: Categories like Clothing and Beauty exhibit strong engagement, both in volume and customer count.
- **Temporal Sales Patterns**: Analysis across months and daily shifts highlights peak selling periods.
- **Loyalty Insights**: Identified repeat high-value customers and their purchasing tendencies.

## Reports

- **Sales Summary**: A detailed report summarizing total sales, customer demographics, and category performance.
- **Trend Analysis**: Insights into sales trends across different months and shifts.
- **Customer Insights**: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a foundational exercise in applying SQL to real-world business problems. It spans essential data analysis practices—from data cleansing to insightful querying—making it an ideal showcase of my capabilities in database handling, business logic implementation, and insight extraction for data-driven decisions.

## Getting Started

1. **Clone the Repository**
2. **Set Up the Database**
3. **Run the Queries**
4. **Explore and Modify**

### Connect with Me

- **LinkedIn**: [Faizan Ahmed Khan](https://www.linkedin.com/in/fayzankj)

If you found this useful or have feedback, feel free to connect or contribute!
