SET search_path TO public;

CREATE TABLE rfm_final AS
SELECT 
	*,
	CASE
		WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4
		THEN 'Champions'
		WHEN r_score >= 3 AND f_score >= 3 
		THEN 'Loyal Customers'
		WHEN r_score >= 4 AND f_score <= 2 
		THEN 'New Customers'
		WHEN r_score >= 3 AND m_score >= 3 
		THEN 'Potential Loyalists'
		WHEN r_score <= 2 AND f_score >= 4 
		THEN 'Cannot Lose Them'
		WHEN r_score <= 2 AND f_score >= 3 
		THEN 'At-Risk'
		WHEN r_score <= 2 AND m_score >= 3 
		THEN 'Hibernating'
		ELSE 'Lost'
	END AS segment
FROM rfm_scores;

SELECT
	segment,
	COUNT(*) AS customer_count,
	ROUND(AVG(recency_days::int), 2) AS avg_recency_days,
	ROUND(AVG(frequency), 2) AS avg_frequency,
	ROUND(AVG(monetary), 2) AS avg_revenue,
	ROUND(SUM(monetary), 2) AS total_revenue
FROM rfm_final
GROUP BY 1
ORDER BY total_revenue DESC;

-- see 06_rfm_insights for my insights...















