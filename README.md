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

```sql
CREATE DATABASE SQL\_PROJECTS;

CREATE TABLE retails (

transactions\\\_id	int primary key,
sale\\\_date date,

sale\\\_time time,

customer\\\_id	int,
 gender varchar(20),

age int,

category varchar(20),

quantiy	int,

 price\\\_per\\\_unit float,

cogs float,	
 total\\\_sale int

)

2\\. Data Exploration \\\& Cleaning

\* \*\*Record Count\*\*: Determine the total number of records in the dataset.
\* \*\*Customer Count\*\*: Find out how many unique customers are in the dataset.
\* \*\*Category Count\*\*: Identify all unique product categories in the dataset.
\* \*\*Null Value Check\*\*: Check for any null values in the dataset and delete records with missing data.

```sql
select \\\* from retails;



SELECT \\\* FROM RETAILS

ORDER BY transactions\\\_id ASC LIMIT 100;



SELECT count(\\\*) FROM RETAILS;


to remove the null values, WE HAVE TO CHECK EACH CATEGORY -



3.\\-- data cleaning -- if there is null then delete --query--delete from --->

SELECT \\\* FROM retails where 

transactions\\\_id	is null

   or

sale\\\_date	is null

  or

sale\\\_time is null
or

customer\\\_id is null

   or

gender is null

  or

age is null
   or

category is null

  or

quantiy is null

  or

price\\\_per\\\_unit is null

  or

cogs is null

  or

total\\\_sale is null

 ;



\\-- data exploration



\\-- how many sales we have total 



select count(\\\*) as total\\\_sales from retails  ;```

### 3\\. Data Analysis \\\& Findings

The following SQL queries were developed to answer specific business questions:

1. \*\*Write a SQL query to retrieve all columns for sales made on '2022-11-05\*\*:

```sql


select \\\* from retails where sale\\\_date ="2022-11-05";



2. \*\*Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022\*\*:

```sql
SELECT CATEGORY, COUNT(\\\*) AS total\\\_sales

FROM retails

WHERE category = 'Clothing'

AND DATE\\\_FORMAT(sale\\\_date, '%Y-%m') = '2022-11'

AND

QUANTIY>=4

GROUP BY category;```



3. \*\*Write a SQL query to calculate the total sales (total\\\_sale) for each category.\*\*:

```sql


SELECT CATEGORY,sum(total\\\_sales) AS TOTAL

FROM RETAILS 

GROUP BY 1;```





4. \*\*Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.\*\*:

```sql
select category,round(avg(age)) as avg\\\_s

from retails

where category='Beauty'

group by 1;

```



5. **Write a SQL query to find all transactions where the total\_sale is greater than 1000.**:

```sql


select \\\* from retails

where total\\\_sale>1000;

```

6. **Write a SQL query to find the total number of transactions (transaction\_id) made by each gender in each category.**:

```sql
 select gender,category,count(\\\*)

select gender,category,count(\*)
from retails
group by 1,2
order by 2;

8. **Write a SQL query to calculate the average sale for each month. Find out best selling month in each year**:

```sql
select year\\\_1,month\\\_1,avg\\\_sales

from

(

select 

extract(year from sale\\\_date) as year\\\_1,

extract(month from sale\\\_date) as month\\\_1 ,

avg(total\\\_sale) as avg\\\_sales,

Rank() OVER(PARTITION BY extract(year from sale\\\_date) ORDER BY avg(total\\\_sale) desc) as rank\\\_1

from retails

group by 1,2

) as rank\\\_11

where rank\\\_1=1

order by 3 desc;

```

8.\*\*Write a SQL query to find the top 5 customers based on the highest total sales \*\*:

```sql
SELECT sum(total\\\_sale) as total, customer\\\_id

FROM retails

group by 2

ORDER BY 1 desc

limit 5;

```

**9.Write a SQL query to find the number of unique customers who purchased items from each category.**:

```sql
select count(distinct customer\\\_id),category

from retails

group by category;```

11.Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 \\\& 17, Evening >17)\*\*:

```sql
WITH SALES\\\_COUNT AS 

(

select SALE\\\_TIME,count(transactions\\\_id) AS COUNT,

CASE

WHEN sale\\\_time <='12:00:00' THEN 'EARLY ORDERS'

WHEN

  sale\\\_time between '12:00:00' and '17:00:00' THEN 'AFTERNOON ORDERS'

   WHEN SALE\\\_TIME >= '17:00:00' THEN 'EVENING ORDERS'

END AS 'SHIFT'

FROM RETAILS

GROUP BY SALE\\\_TIME

)

SELECT SHIFT,COUNT(\\\*) AS COUNTS

FROM SALES\\\_COUNT

GROUP BY SHIFT;```



\\--END OF PROJECT--

## Findings

\* \*\*Customer Demographics\*\*: The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
\* \*\*High-Value Transactions\*\*: Several transactions had a total sale amount greater than 1000, indicating premium purchases.
\* \*\*Sales Trends\*\*: Monthly analysis shows variations in sales, helping identify peak seasons.
\* \*\*Customer Insights\*\*: The analysis identifies the top-spending customers and the most popular product categories.

## Reports

\* \*\*Sales Summary\*\*: A detailed report summarizing total sales, customer demographics, and category performance.
\* \*\*Trend Analysis\*\*: Insights into sales trends across different months and shifts.
\* \*\*Customer Insights\*\*: Reports on top customers and unique customer counts per category.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding sales patterns, customer behavior, and product performance.

## How to Use

1. \*\*Clone the Repository\*\*: Clone this project repository from GitHub.
2. \*\*Set Up the Database\*\*: Run the SQL scripts provided in the `database\\\\\\\_setup.sql` file to create and populate the database.
3. \*\*Run the Queries\*\*: Use the SQL queries provided in the `analysis\\\\\\\_queries.sql` file to perform your analysis.
4. \*\*Explore and Modify\*\*: Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.

## 


