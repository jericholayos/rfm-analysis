# RFM Customer Segmentation Analysis
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=flat&logo=postgresql&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-217346?style=flat&logo=microsoft-excel&logoColor=white)
### PostgreSQL + Excel | Online Retail Dataset

---

## Overview
This project performs a full RFM (Recency, Frequency, Monetary) analysis on the UCI Online Retail dataset. Customers are segmented into 8 behavioral groups using PostgreSQL for all data cleaning, calculation, and scoring, then visualized through an interactive Excel dashboard.

---

## Tools Used
- **PostgreSQL** — data cleaning, RFM calculation, NTILE scoring, segment labeling
- **Excel** — PivotTables, dashboard, charts

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

---

## Key Findings

- **Champions dominate revenue** — 1,056 customers (24% of base) generated £6.09M, accounting for 68.4% of total revenue
- **Cannot Lose Them is the most urgent segment** — only 344 customers but highest avg spend at £2,471 per customer, with an average of 142 days since last purchase
- **Most customers are one-time buyers** — avg frequency of 1.00 across all segments, likely due to the dataset's one-year time window
- **Lost segment is the largest by headcount** — 1,359 customers (31%) with the lowest avg revenue at £252, indicating minimal re-engagement value

---

## Files

| File | Description |
|------|-------------|
| `sql/01_clean_data.sql` | Filter and create clean working table |
| `sql/02_create_table_and_load.sql` | Create table and load CSV |
| `sql/03_rfm_calculation.sql` | Calculate recency, frequency, monetary per customer |
| `sql/04_rfm_segments.sql` | NTILE scoring and segment labeling |
| `sql/05_additional_insights.sql` | More detailed insights |
| `excel/rfm_analysis.xlsx` | Final dashboard with charts and slicer |

---

## Dashboard Preview
<img width="1345" height="741" alt="RFM_Dashboard" src="https://github.com/user-attachments/assets/3d33ab07-df26-4487-b1c4-1b3b4681df7d" />


---
