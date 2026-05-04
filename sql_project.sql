
-- sql sales analysiss project-

create database sql_project;

use sql_project;

-- DROP TABLE IF exists RETAILS-;
CREATE TABLE retails (
    transactions_id	int primary key,
    sale_date date,
	sale_time time,
    customer_id	int,
    gender varchar(20),
	age int,
	category varchar(20),
	quantiy	int,
    price_per_unit float,
	cogs float,	
    total_sale int
);

select * from retails;

SELECT * FROM RETAILS
ORDER BY transactions_id ASC LIMIT 100;

SELECT count(*) FROM RETAILS;

-- to remove the null values, WE HAVE TO CHECK EACH CATEGORY -

-- data cleaning -- if there is null then delete --query--delete from --->
SELECT * FROM retails where 
	transactions_id	is null
    or
	sale_date	is null
    or
	sale_time is null
	or
	customer_id is null
    or
	gender is null
    or
	age is null
    or
	category is null
    or
	quantiy is null
    or
	price_per_unit is null
    or
	cogs is null
    or
	total_sale is null
    ;

-- data exploration

-- how many sales we have total 

select count(*) as total_sales from retails  ;

-- how many unique customers weh have

select count(distinct customer_id) as customers from retails;
-- category
select count(distinct category) as category from retails;

select distinct category as category from retails;

-- data analysis and questions

-- q1.2022-11-05 sales made on this date all columns

select * from retails where sale_date ="2022-11-05"; 

-- q2.all transactions where category is clothing and quantity sold is more than 10 in the month of nov -2022

SELECT CATEGORY, COUNT(*) AS total_sales
FROM retails
WHERE category = 'Clothing'
AND DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
AND
QUANTIY>=4
GROUP BY category;

-- TOTAL_SALES FOR EACH CATEGORY

SELECT CATEGORY,sum(total_sales) AS TOTAL
FROM RETAILS 
GROUP BY 1;

-- select avg age of customers purchased items from beauty category

select category,round(avg(age)) as avg_s
from retails
where category='Beauty'
group by 1;

-- sql query where all transactions total sales > 100

select * from retails
where total_sale>1000;

-- total no of transaction (id) made by each gender in each category

select gender,category,count(*)
from retails
group by 1,2
order by 2;

-- avereage sales for each month , best selling month in each year
-- window means ranking for each department but group by is rank fully 
select year_1,month_1,avg_sales
from
(
select 
extract(year from sale_date) as year_1,
extract(month from sale_date) as month_1 ,
avg(total_sale) as avg_sales,
Rank() OVER(PARTITION BY extract(year from sale_date) ORDER BY avg(total_sale) desc) as rank_1
from retails
group by 1,2
) as rank_11
where rank_1=1
order by 3 desc;

-- top 5 customers based on higheset total sales

SELECT sum(total_sale) as total, customer_id
FROM retails
group by 2
ORDER BY 1 desc
limit 5;

-- number of unique customers who purchased items from each category

select count(distinct customer_id),category
from retails
group by category;

-- sql query for each shifts and number of orders (early morning, 12 and 5;00, night after 5pm)

WITH SALES_COUNT AS 
(
select SALE_TIME,count(transactions_id) AS COUNT,
CASE
	WHEN sale_time <='12:00:00' THEN 'EARLY ORDERS'
	WHEN
    sale_time between '12:00:00' and '17:00:00' THEN 'AFTERNOON ORDERS'
    WHEN SALE_TIME >= '17:00:00' THEN 'EVENING ORDERS'
END AS 'SHIFT'
FROM RETAILS
GROUP BY SALE_TIME
)
SELECT SHIFT,COUNT(*) AS COUNTS
 FROM SALES_COUNT
GROUP BY SHIFT;

-- END OF PROJECT--	
