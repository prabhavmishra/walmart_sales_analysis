select * from walmart;
select count(*) from walmart;

--Business Problems
--Q1.)What are the different payment methods, and how many transactions and items were sold with each method?

select 
	payment_method,
	count (*) as no_payments,
	SUM(quantity) as no_qty_sold
from walmart
group by payment_method

--Q2.)Which category received the highest average rating in each branch?
SELECT * 
FROM
( SELECT
	branch,
	category,
	AVG(rating) as avg_rating,
	rank() over(partition by branch order by avg(rating) desc) as rank
FROM walmart
GROUP by 1,2 
)
WHERE rank =1

--Q3.)What is the busiest day of the week for each branch based on transaction volume?
SELECT *
FROM 
   (SELECT
        branch,
        TO_CHAR(date, 'FMDay') AS day_name,
        COUNT(*) AS no_transactions,
        RANK() OVER(PARTITION BY branch ORDER BY COUNT(*) DESC) as rank
    FROM walmart
    GROUP BY 1,2
) 
WHERE rank = 1;

--Q4.) How many items were sold through each payment method?
select
	payment_method,
	sum(quantity) as no_qty_sold
from walmart
group by payment_method

--Q5.)What are the average, minimum, and maximum ratings for each category in each city?

select 
	city,
	category,
	min(rating) as min_rating,
	max(rating) as max_rating,
	avg(rating) as avg_rating
from walmart
group by 1,2

--Q6.)What is the total profit for each category, ranked from highest to lowest?

select
	category,
	sum(total) as total_revenue,
	sum(total * profit_margin) as profit
from walmart
group by 1

--Q7.)What is the most frequently used payment method in each branch?
with cte
as
(select
	branch,
	payment_method,
	count(*) as total_trans,
	rank() over(partition by branch order by count(*) desc) as rank
from walmart
group by 1,2
)
select *
from cte
where rank=1;

--Q8.)How many transactions occur in each shift (Morning, Afternoon, Evening) across branches?

select 
	branch,
	case 
		when extract(hour from(time)) <12 then 'Morning'
		when extract(hour from(time)) between 12 and 17 then 'Afternoon'
		else 'Evening'
	end day_time,
	count(*)
from walmart
group by 1,2
order by 1,3 desc

--Q9.)Which 5 branches experienced the largest decrease in revenue compared to the previous year?

-- rdr == last_rev-cr_rev/ls_rev*100


-- 2022 sales
WITH revenue_2022
AS
(
	SELECT 
		branch,
		SUM(total) as revenue
	FROM walmart
	WHERE EXTRACT(YEAR FROM date) = 2022 
	GROUP BY 1
),

revenue_2023
AS
(
	SELECT 
		branch,
		SUM(total) as revenue
	FROM walmart
	WHERE EXTRACT(YEAR FROM date) = 2023
	GROUP BY 1
)

SELECT 
	ls.branch,
	ls.revenue as last_year_revenue,
	cs.revenue as cr_year_revenue,
	ROUND(
		(ls.revenue - cs.revenue)::numeric/
		ls.revenue::numeric * 100, 
		2) as rev_dec_ratio
FROM revenue_2022 as ls
JOIN
revenue_2023 as cs
ON ls.branch = cs.branch
WHERE 
	ls.revenue > cs.revenue
ORDER BY 4 DESC
LIMIT 5