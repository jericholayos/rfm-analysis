# RFM Customer Segmentation Analysis
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=flat&logo=postgresql&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-217346?style=flat&logo=microsoft-excel&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=flat&logo=powerbi&logoColor=black)

### PostgreSQL + Excel + Power BI | Online Retail Dataset
---
## Overview
This project performs a full RFM (Recency, Frequency, Monetary) analysis on the UCI Online Retail dataset. Customers are segmented into behavioral groups using PostgreSQL for all data cleaning, calculation, and scoring, then visualized through an interactive Excel dashboard and a two-page Power BI report covering sales performance and customer segmentation.

---
## Tools Used
- **PostgreSQL** — data cleaning, RFM calculation, NTILE scoring, segment labeling
- **Excel** — PivotTables, dashboard, charts
- **Power BI** — two-page interactive report; Sales Overview and RFM segmentation dashboard

---
## Dataset
- **Source:** [UCI Online Retail Dataset](https://archive.ics.uci.edu/ml/datasets/online+retail)
- **Period:** December 2010 – December 2011
- **Raw rows:** 541,909 transactions
- **Customers after cleaning:** 4,338
- **Country:** UK-based online wholesale retailer

---
## Process
**1. Data Cleaning (PostgreSQL)**
Removed anonymous transactions (null CustomerID), returns, cancellations (C-prefix invoices), and zero-price rows. Cleaned dataset: ~397,880 rows.

**2. RFM Calculation (PostgreSQL)**
Computed Recency (days since last purchase), Frequency (distinct orders), and Monetary (total revenue) per customer using GROUP BY and date arithmetic.

**3. RFM Scoring (PostgreSQL)**
Scored each dimension 1–5 using NTILE window functions. Recency is inverted — fewer days = higher score.

**4. Segment Labeling (PostgreSQL)**
Assigned 8 segment labels using CASE logic: Champions, Loyal Customers, New Customers, Potential Loyalists, Cannot Lose Them, At-Risk, Hibernating, Lost.

**5. Dashboard (Excel)**
Built an interactive dashboard with 4 charts and a segment slicer.

**6. Power BI Report**
Built a two-page interactive report. Page 1 covers sales performance (monthly revenue and order trends, top 10 products, top 10 customers). Page 2 covers RFM segmentation with cross-filtering by segment.

---
## Key Findings

**Sales**
- **November had the highest revenue** — sales spiked toward the end of the year, likely due to holiday season bulk orders
- **One customer (14646) generated £280K** — the top customer alone made up 3.1% of total revenue
- **Paper Craft Little Birdie was the best-selling product** — £168K in revenue, well ahead of second place at £143K
- **Average order value was £480.87** — high per-order spend reflects bulk buying behavior typical of wholesale customers

**RFM Segmentation**
- **Champions drove most of the revenue** — 1,056 customers (24%) generated £6.09M, which is 68.4% of total revenue
- **Cannot Lose Them needs immediate attention** — only 344 customers but they spend an average of £2,471 each, and haven't purchased in 142 days on average
- **Most customers only bought once** — average order frequency is 1.00 across all segments, likely because the dataset only covers one year
- **Lost is the biggest segment by count** — 1,359 customers (31%) with the lowest avg spend at £252, making re-engagement unlikely

---
## Files
| File | Description |
|------|-------------|
| `sql/01_clean_data.sql` | Filter and create clean working table |
| `sql/02_create_table_and_load.sql` | Create table and load CSV |
| `sql/03_rfm_calculation.sql` | Calculate recency, frequency, monetary per customer |
| `sql/04_rfm_segments.sql` | NTILE scoring and segment labeling |
| `sql/05_additional_insights.sql` | More detailed insights |
| `excel/rfm_analysis.xlsx` | Excel dashboard with charts and slicer |
| `powerbi/rfm_report.pbix` | Power BI two-page interactive report |

---
## Dashboard Preview
<img width="1277" height="716" alt="image" src="https://github.com/user-attachments/assets/bd0a9956-2824-437b-9dcb-6e79cfb995af" />
<img width="1277" height="714" alt="image" src="https://github.com/user-attachments/assets/921ecf09-0648-41e5-a835-bc87c970a8f9" />
<img width="1345" height="741" alt="RFM_Dashboard" src="https://github.com/user-attachments/assets/6e8c7dc9-6770-4346-ab76-2f46dcea6e2b" />

---
