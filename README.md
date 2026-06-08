# RFM Customer Segmentation Analysis  
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=flat&logo=postgresql&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-217346?style=flat&logo=microsoft-excel&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat&logo=powerbi&logoColor=black)

## Overview
This project performs a RFM (Recency, Frequency, Monetary) analysis on the UCI Online Retail dataset. Customers are segmented into behavioral groups using PostgreSQL for all data cleaning, calculation, and scoring, then visualized through an interactive Excel dashboard and a two-page Power BI report covering sales performance and customer segmentation.

## Dashboard Preview
<img width="1117" height="753" alt="image" src="https://github.com/user-attachments/assets/ff3fba7f-dc32-4802-896e-747b0f80da07" />
<img width="1115" height="752" alt="image" src="https://github.com/user-attachments/assets/a0891f87-73ac-458b-8ccb-624bee3a713f" />

## Key Findings

**Sales**
- **November had the highest revenue** as sales spiked toward the end of the year, likely due to holiday season bulk orders
- **One customer (14646) generated £280K**, making up 3.1% of total revenue
- **Paper Craft Little Birdie was the best-selling product** at £168K in revenue, well ahead of second place at £143K
- **Average order value was £480.87**, reflecting bulk buying behavior typical of wholesale customers

**RFM Segmentation**
- **Champions drove most of the revenue** with 1,056 customers (24%) generating £6.09M, which is 68.4% of total revenue
- **Cannot Lose Them needs immediate attention** as only 344 customers each spend an average of £2,471 and have not purchased in 142 days on average
- **Most customers only bought once** as the average order frequency is 1.00 across all segments, likely because the dataset covers only one year
- **Lost is the biggest segment by count** with 1,359 customers (31%) and the lowest average spend at £252, making re-engagement unlikely

## Excel Pivot Chart
<img width="1345" height="741" alt="RFM_Dashboard" src="https://github.com/user-attachments/assets/6e8c7dc9-6770-4346-ab76-2f46dcea6e2b" />
