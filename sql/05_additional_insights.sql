SET search_path TO public;

-- Revenue concentration by segment:
-- champions covers 68.38 percent of revenue which is exactly $6.1 Million
-- while lost has the highest pct of customers at 31.33% which is 1,359
SELECT
	segment,
	SUM(monetary) AS total_revenue,
	ROUND(SUM(monetary) * 100.0 / SUM(SUM(monetary)) OVER(), 2) AS pct_of_revenue,
	COUNT(*) AS customers,
	ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS pct_of_customers
FROM rfm_final
GROUP BY 1
ORDER BY total_revenue DESC;



-- top 10 customers by lifetime value
SELECT
	customer_id,
	segment,
	frequency,
	monetary,
	recency_days
FROM rfm_final
ORDER BY monetary DESC
LIMIT 10;


-- country breakdown of champions
SELECT
	c.country,
	COUNT(*) AS champion_count
FROM rfm_final r
INNER JOIN clean_online_retail c
	ON c.customer_id = r.customer_id
WHERE r.segment = 'Champions'
GROUP BY 1
ORDER BY 2 DESC;










