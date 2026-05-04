# Retail Sales Analysis SQL Project

## Project Overview

**Project Title**: Retail Sales Analysis  
**Level**: Beginner  
**Database**: USE DATABASE SQL\_PROJECT

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze retail sales data. The project involves setting up a retail sales database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. This project is ideal for those who are starting their journey in data analysis and want to build a solid foundation in SQL.

## Objectives

1. **Set up a retail sales database**: Create and populate a retail sales database with the provided sales data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1\. Database Setup

* **Database Creation**: The project starts by creating a database named .DATABASE SQL\_PROJECT
* **Table Creation**: A table named 'RETAILS' is created to store the sales data. The table structure includes columns for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, price per unit, cost of goods sold (COGS), and total sale amount.



CREATE DATABASE SQL\_PROJECT;



CREATE TABLE retailS

(

&#x20;   transactions\_id INT PRIMARY KEY,

&#x20;   sale\_date DATE,	

&#x20;   sale\_time TIME,

&#x20;   customer\_id INT,	

&#x20;   gender VARCHAR(10),

&#x20;   age INT,

&#x20;   category VARCHAR(35),

&#x20;   quantity INT,

&#x20;   price\_per\_unit FLOAT,	

&#x20;   cogs FLOAT,

&#x20;   total\_sale FLOAT

);



#### **2. Data Exploration \& Cleaning**



Record Count: Determine the total number of records in the dataset.

Customer Count: Find out how many unique customers are in the dataset.

Category Count: Identify all unique product categories in the dataset.

Null Value Check: Check for any null values in the dataset and delete records with missing data.









SELECT COUNT(\*) FROM retails;

SELECT COUNT(DISTINCT customer\_id) FROM retails;

SELECT DISTINCT category FROM retails;



SELECT \* FROM retails

WHERE 

&#x20;   sale\_date IS NULL OR sale\_time IS NULL OR customer\_id IS NULL OR 

&#x20;   gender IS NULL OR age IS NULL OR category IS NULL OR 

&#x20;   quantity IS NULL OR price\_per\_unit IS NULL OR cogs IS NULL;



DELETE FROM retails

WHERE 

&#x20;   sale\_date IS NULL OR sale\_time IS NULL OR customer\_id IS NULL OR 

&#x20;   gender IS NULL OR age IS NULL OR category IS NULL OR 

&#x20;   quantity IS NULL OR price\_per\_unit IS NULL OR cogs IS NULL;





### 3\. Data Analysis \& Findings



The following SQL queries were developed to answer specific business questions:



&#x20;1.Write a SQL query to retrieve all columns for sales made on '2022-11-05:



&#x20;    SELECT \*

FROM retails

WHERE sale\_date = '2022-11-05';



2.Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:



SELECT 

&#x20; CATEGORY,COUNT(\*) AS TOTAL\_SALES

FROM retails

WHERE 

&#x20;   category = 'Clothing'

&#x20;   AND 

&#x20;   date format(sale\_date, 'YYYY-MM') = '2022-11'

&#x20;   AND

&#x20;   quantity >= 4

&#x20;   GROUP BY CATEGORY;



3.Write a SQL query to calculate the total sales (total\_sale) for each category.:



SELECT 

&#x20;   category,

&#x20;   SUM(total\_sale) as TOTAL,

FROM retails

GROUP BY 1



4.Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:





SELECT

&#x20;   CATEGORY,ROUND(AVG(age), 2) as avg\_S

FROM retails

WHERE category = 'Beauty'

GROUP 1



5.Write a SQL query to find all transactions where the total\_sale is greater than 1000.:





SELECT \* FROM retails

WHERE total\_sale > 1000



6.Write a SQL query to find the total number of transactions (transaction\_id) made by each gender in each category.:





SELECT 

&#x20;   category,

&#x20;   gender,

&#x20;   COUNT(\*)

FROM retails

GROUP 

&#x20;   BY 

&#x20;   category,

&#x20;   gender

ORDER BY 1



7.Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:





SELECT 

&#x20;      year\_1,

&#x20;      month\_1,

&#x20;   avg\_saleS

FROM 

(    

SELECT 

&#x20;   EXTRACT(YEAR FROM sale\_date) as year\_1,

&#x20;   EXTRACT(MONTH FROM sale\_date) as month\_,

&#x20;   AVG(total\_sale) as avg\_saleS,

&#x20;   RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale\_date) ORDER BY AVG(total\_sale) DESC) as rank\_1

FROM retails

GROUP BY 1, 2

) as RANK11

WHERE rank\_1 = 1



8.\*\*Write a SQL query to find the top 5 customers based on the highest total sales \*\*:





SELECT 

&#x20;   customer\_id,

&#x20;   SUM(total\_sale) as total

FROM retails

GROUP BY 1

ORDER BY 2 DESC

LIMIT 5



9.Write a SQL query to find the number of unique customers who purchased items from each category.:





SELECT 

&#x20;   category,    

&#x20;   COUNT(DISTINCT customer\_id)

FROM retails

GROUP BY category



10.Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 \& 17, Evening >17):





WITH SALES\_COUNT

AS

(

SELECT SALE\_TIME,COUNT(TRANSACTION\_ID) AS COUNT,

&#x20;   CASE

&#x20;       WHEN EXTRACT(HOUR FROM sale\_time) < 12 THEN 'EARLY ORDERS'

&#x20;       WHEN EXTRACT(HOUR FROM sale\_time) BETWEEN 12 AND 17 THEN 'AFTERNOON ORDERS'

&#x20;       ELSE 'EVENING ORDERS'

&#x20;   END as shift

FROM retails

GROUP BY SALE\_TIME

)

SELECT 

&#x20;   shift,

&#x20;   COUNT(\*) as counts   

FROM sales\_count

GROUP BY shift





# Findings

Customer Demographics: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.

High-Value Transactions: Several transactions had a total sale amount greater than 1000, indicating premium purchases.

Sales Trends: Monthly analysis shows variations in sales, helping identify peak seasons.

Customer Insights: The analysis identifies the top-spending customers and the most popular product categories.

# Reports

Sales Summary: A detailed report summarizing total sales, customer demographics, and category performance.

Trend Analysis: Insights into sales trends across different months and shifts.

Customer Insights: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.



### How to Use

Clone the Repository: Clone this project repository from GitHub.

Set Up the Database: Run the SQL scripts provided in the database\_setup.sql file to create and populate the database.

Run the Queries: Use the SQL queries provided in the analysis\_queries.sql file to perform your analysis.

Explore and Modify: Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.





