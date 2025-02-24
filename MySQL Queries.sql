show databases;
use walemart_proj;
select database();


show tables;

select count(*) from walemart;

select * from walemart limit 10;

-- -------------------------------------------------------------------

-- Business Problem

-- ---------------------------------------------------------------------

-- Q1 Find the different payment method and number of transaction , number of qty sold

select payment_method , count(*) as number_of_transaction , sum(quantity) from walemart group by payment_method;

-- -----------------------------------------------------------------------------------------

-- Q2 Identify the highest-rated category in each branch , 
-- displaying the branch , category Avg rating 

with cte as (
select branch ,category , avg(rating) as rating, dense_rank() OVER(partition by branch order by avg(rating) desc) as ranking  from  walemart group by branch ,category order by branch , rating desc 
) 
select * from cte where ranking = 1;

-- -----------------------------------------------------------------------------------------

-- Q3 Identify the business day for each branch based on the number of transaction

SELECT branch ,DATE_FORMAT(STR_TO_DATE(date, '%d/%m/%y'), '%W') AS day_name , count(*) as transaction FROM walemart 
group by branch ,day_name order by branch , FIELD(day_name, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- ---------------------------------------------------------------------------------------

-- Q4 Calculate the total quantity of items sold per payment method.
-- list payment _method and total_quantity.

select payment_method , count(quantity) as total_quantity from walemart group by payment_method;

-- ---------------------------------------------------------------------------------------

-- Q5 What are the average, minimum, and maximum ratings for each category in
 --   each city?
 
 select city,category,max(rating) max_rating ,min(rating) min_rating , avg(rating) avg_rating from walemart group by city,category order by city;
 
-- ---------------------------------------------------------------------------------------

-- Q6 What is the total profit for each category, ranked from highest to lowest?

select category , sum(total) total_revenue ,sum(total * profit_margin) total_profit , dense_rank() over(order by sum(total * profit_margin) desc) as ranking from walemart group by category order by total_profit desc;

-- ---------------------------------------------------------------------------------------

-- Q7  What is the most frequently used payment method in each branch
select branch , payment_method from (
select branch , payment_method , count(*) as freq , dense_rank() over(partition by branch order by count(*) desc )as dr from  walemart group by branch , payment_method 
) as ranked_data 
where dr = 1;
  
 -- ---------------------------------------------------------------------------------------
 
 
 -- Q8: Categorize sales into Morning, Afternoon, and Evening shifts

SELECT 
    branch,
    CASE 
        WHEN HOUR(time) < 12 THEN 'Morning'
        WHEN HOUR(time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(*) AS num_invoices
FROM walemart
GROUP BY branch, shift
ORDER BY branch, num_invoices DESC;



 -- ---------------------------------------------------------------------------------------

-- Q9: Identify the 5 branches with the highest revenue decrease ratio from last year to current year (e.g., 2022 to 2023)


WITH revenue_2022 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walemart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2022
    GROUP BY branch
),
revenue_2023 AS (
    SELECT 
        branch,
        SUM(total) AS revenue
    FROM walemart
    WHERE YEAR(STR_TO_DATE(date, '%d/%m/%Y')) = 2023
    GROUP BY branch
)
SELECT 
    r2022.branch,
    r2022.revenue AS last_year_revenue,
    r2023.revenue AS current_year_revenue,
    ROUND(((r2022.revenue - r2023.revenue) / r2022.revenue) * 100, 2) AS revenue_decrease_ratio
FROM revenue_2022 AS r2022
JOIN revenue_2023 AS r2023 ON r2022.branch = r2023.branch
WHERE r2022.revenue > r2023.revenue
ORDER BY revenue_decrease_ratio DESC
LIMIT 5;
 
 
 
 