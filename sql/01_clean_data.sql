-- its  a shortcut
SET search_path TO public;

-- analyzing the first 20 rows
SELECT *
FROM online_retail
LIMIT 20;

-- cleaning the dataset into a new table
CREATE TABLE clean_online_retail AS 
SELECT
	invoice_no,
	stock_code,
	description,
	quantity,
	invoice_date,
	unit_price,
	customer_id,
	country,
	(quantity * unit_price) AS revenue
FROM online_retail
WHERE 
	customer_id IS NOT NULL
	AND quantity > 0
	AND unit_price > 0
	AND invoice_no NOT LIKE 'C%';

-- 397,880 total rows 
SELECT COUNT(*)
FROM clean_online_retail;


-- 4,338 unique customers
SELECT
	COUNT(DISTINCT customer_id) AS unique_customers
FROM clean_online_retail;

	
	