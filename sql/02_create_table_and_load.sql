-- i am using pgadmin4
-- you can create a database yourself just by querying it
-- or clicking the databases icon on the left and create it without querying:D

CREATE TABLE online_retail (
	invoice_no VARCHAR(20), 
	stock_code VARCHAR(20),
	description TEXT,
	quantity INT,
	invoice_date TIMESTAMP,
	unit_price NUMERIC(10,2),
	customer_id INT,
	country VARCHAR(20)
);
