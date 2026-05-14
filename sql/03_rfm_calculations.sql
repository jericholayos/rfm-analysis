SET search_path TO public;


-- 2011-12-09 is the max date
-- so use 2011-12-10 as the snapshot date
SELECT 
	MAX(invoice_date) AS snapshot_date
FROM clean_online_retail;

-- 03_rfm calculations
CREATE TABLE rfm_raw AS
SELECT
	customer_id,
	MAX(invoice_date) AS last_purchase_date,
	DATE_PART('day', DATE '2011-12-10' - MAX(invoice_date)) AS recency_days,
	COUNT(DISTINCT customer_id) AS frequency,
	ROUND(SUM(revenue), 2) AS monetary
FROM clean_online_retail
GROUP BY 1;

-- quick sanity check
SELECT
	ROUND(AVG(recency_days::INT), 1) AS avg_recency,
	ROUND(AVG(frequency), 2) AS avg_frequency,
	ROUND(AVG(monetary), 2) AS avg_monetary,
	MIN(recency_days) AS min_recency,
	MAX(recency_days) AS max_recency
FROM rfm_raw;


CREATE TABLE rfm_scores AS
SELECT
	customer_id,
	last_purchase_date,
	recency_days,
	frequency,
	monetary,
	-- recency: fewer days = score 5 (ORDER BY desc)
	NTILE(5) OVER(ORDER BY recency_days DESC) AS r_score,
	-- frequency: more orders = score 5
	NTILE(5) OVER(ORDER BY frequency ASC) AS f_score,
	NTILE(5) OVER(ORDER BY monetary ASC) AS m_score
FROM rfm_raw;

ALTER TABLE rfm_scores ADD COLUMN rfm_string VARCHAR(3);
ALTER TABLE rfm_scores ADD COLUMN rfm_total INT;
UPDATE rfm_scores
SET
rfm_string = CONCAT(r_score, f_score, m_score),
rfm_total = r_score + f_score + m_score;

SELECT *
FROM rfm_scores
ORDER BY rfm_total DESC
LIMIT 10;





















































