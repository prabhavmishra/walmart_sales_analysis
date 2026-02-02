# Walmart Sales Performance Analysis 📊

An end-to-end data analytics project analyzing Walmart’s sales data to uncover revenue trends, customer behavior, branch performance, and operational insights using **Python, SQL, and Tableau**.

---

## 🔍 Project Overview

This project focuses on transforming raw transactional sales data into meaningful business insights. It follows the complete analytics lifecycle — from data acquisition and cleaning to SQL-based analysis and interactive dashboarding.

**Key objectives:**
- Understand revenue and transaction trends over time  
- Identify high- and low-performing branches  
- Analyze customer purchasing behavior by time and day  
- Evaluate payment method preferences  
- Present insights through an executive-ready Tableau dashboard  

---

## 🗂️ Dataset

- **Source:** Kaggle (Walmart Sales Dataset)
- **Time Period:** 2019–2023
- **Records:** 9,969 transactions
- **Key Fields:** Branch, City, Category, Date, Time, Quantity, Revenue, Payment Method, Customer Rating

---

## ⚙️ Tools & Technologies

- **Python:** Pandas (data cleaning & preprocessing)
- **SQL:** PostgreSQL (analysis, aggregations, window functions)
- **Visualization:** Tableau
- **Environment:** VS Code, Jupyter Notebook

---

## 🧹 Data Cleaning & Preparation (Python)

Data preprocessing was performed using Pandas and included:
- Correcting and standardizing date formats
- Splitting date and time into analytical components (year, month, day, hour)
- Ensuring numeric consistency for revenue, quantity, and ratings
- Creating derived metrics such as **Average Basket Value**
- Preparing a clean, analysis-ready dataset for SQL and Tableau

---

## 🗄️ SQL Analysis

The cleaned data was loaded into PostgreSQL for structured analysis.  
SQL queries were written to answer business questions such as:
- Branch-wise revenue performance
- Year-over-year revenue comparison and decline analysis
- Busiest day of the week per branch
- Peak sales hours and time-of-day patterns
- Payment method usage
- Category-wise revenue and profitability
- Customer rating trends by city and category

Advanced SQL concepts used:
- Aggregations (`SUM`, `COUNT`, `AVG`)
- Window functions (`RANK`)
- Common Table Expressions (CTEs)
- Date and time extraction

---

## 📈 Tableau Dashboard

An interactive Tableau dashboard was built to present insights clearly and concisely.

### **Key KPIs**
- **Total Transactions:** 9,969  
- **Total Revenue:** $1.21M  
- **Average Rating:** 5.83 / 10  
- **Average Basket Value:** $121.35  

### **Dashboard Features**
- Revenue by Branch (interactive filter)
- Revenue Trend over Time (2019–2023)
- Busiest Day of the Week
- Peak Sales Hours
- Clean layout designed for executive decision-making  
- No global slicers to avoid KPI distortion

---

## 💡 Key Business Insights

- **65% of transactions occur during afternoon and evening hours**
- **3 PM–7 PM contributes over 40% of daily sales**
- **Credit cards (42.7%) and e-wallets (38.9%) dominate payment methods**
- Revenue is concentrated among a small set of high-performing branches
- Noticeable seasonal revenue spikes occur toward year-end

---

## 📌 Business Recommendations

- Optimize staffing during peak hours (3–7 PM) to improve service efficiency  
- Focus improvement strategies on underperforming branches generating 15–20% lower revenue  
- Promote digital payments, which already account for over 80% of transactions  
- Use customer rating insights to improve service quality and repeat purchases  

---

## 🚀 Conclusion

This project demonstrates a complete, real-world data analytics workflow — from raw data ingestion and cleaning to SQL-driven analysis and interactive dashboarding. The insights derived can support data-driven decisions related to operations, customer experience, and revenue optimization.

---

## 📎 Files in This Repository

- `project.ipynb` – Data cleaning and preprocessing (Python)
- `walmart_sales_analysis.sql` – SQL queries for business analysis
- Tableau dashboard screenshots / workbook
- Business problem statements

---

⭐ If you found this project useful, feel free to star the repository!
