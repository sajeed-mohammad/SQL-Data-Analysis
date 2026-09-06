# SQL Data Analysis Project

##  Project Overview

This project focuses on analyzing an e-commerce orders dataset using SQL to extract meaningful business insights.

The analysis uses SQL queries to filter, sort, group, aggregate, and compare order data. The objective is to transform raw order data into useful information that can support business decision-making.

---

##  Objectives

- Retrieve data using SQL SELECT queries
- Filter records using WHERE
- Sort data using ORDER BY
- Group records using GROUP BY
- Perform aggregations using COUNT, SUM, and AVG
- Filter grouped results using HAVING
- Use subqueries for advanced analysis
- Identify important business trends and patterns
- Generate actionable business insights

---

##  Dataset

The dataset contains 1,200 order records with 14 columns.

### Dataset Columns

| Column | Description |
|---|---|
| OrderID | Unique identifier for each order |
| Date | Order date |
| CustomerID | Unique customer identifier |
| Product | Product purchased |
| Quantity | Number of units purchased |
| UnitPrice | Price per unit |
| ShippingAddress | Customer shipping address |
| PaymentMethod | Payment method used |
| OrderStatus | Current status of the order |
| TrackingNumber | Shipment tracking number |
| ItemsInCart | Number of items in the cart |
| CouponCode | Coupon or discount code |
| ReferralSource | Source through which the customer arrived |
| TotalPrice | Total value of the order |

---

##  Tools & Technologies

- SQL
- SQLite
- CSV
- Microsoft Excel
- Git
- GitHub

---

##  SQL Analysis Performed

### 1. Basic SELECT Query

Retrieves records from the orders table.

### 2. WHERE Filtering

Identifies high-value orders based on order amount.

### 3. ORDER BY

Sorts orders based on total price to identify the highest-value transactions.

### 4. GROUP BY with Aggregations

Analyzes products using:

- COUNT()
- SUM()
- AVG()

### 5. Payment Method Analysis

Compares order count, sales, and average order value across different payment methods.

### 6. Order Status Analysis

Analyzes sales and order volume based on order status.

### 7. Referral Source Analysis

Measures sales performance from different customer acquisition sources.

### 8. Coupon Analysis

Compares orders and sales generated through different coupon codes.

### 9. High-Value Order Analysis

Identifies orders with higher transaction values.

### 10. Above-Average Order Analysis

Uses a SQL subquery to identify orders whose value is greater than the overall average order value.

### 11. Quantity Analysis

Analyzes the number of units sold for each product.

### 12. HAVING Clause

Filters grouped results based on aggregate conditions.

### 13. Sales Contribution Analysis

Calculates the sales contribution of individual products.

### 14. Overall Business Summary

Provides an overall summary of orders, customers, units sold, total sales, and average order value.

### 15. Product and Order Status Analysis

Examines the relationship between products and order statuses.

---

##  Key Results

### Overall Performance

| Metric | Result |
|---|---:|
| Total Orders | 1,200 |
| Unique Customers | 1,189 |
| Total Units Sold | 3,535 |
| Total Sales | 1,264,761.96 |
| Average Order Value | 1,053.97 |

### Product Performance

| Product | Orders | Units Sold | Sales |
|---|---:|---:|---:|
| Printer | 181 | 542 | 195,612.61 |
| Tablet | 179 | 497 | 186,568.95 |
| Chair | 178 | 562 | 195,620.11 |
| Laptop | 173 | 535 | 192,126.56 |
| Monitor | 163 | 480 | 175,651.41 |

**Key Observation:** Chair generated the highest sales among the products, while Printer recorded the highest number of orders.

---

##  Payment Method Insights

The analysis compares the following payment methods:

- Credit Card
- Online
- Cash
- Gift Card
- Debit Card

Credit Card transactions generated the highest total sales among the payment methods analyzed.

---

##  Referral Source Insights

The dataset contains customers acquired through:

- Instagram
- Email
- Google
- Facebook
- Referral

Instagram generated the highest total sales among the referral sources.

---

##  Coupon Analysis

The available coupon categories include:

- FREESHIP
- SAVE10
- WINTER15
- No Coupon

FREESHIP generated the highest total sales among the coupon categories.

---

##  Business Insights

Based on the SQL analysis:

1. Product performance varies in terms of order volume, quantity sold, and revenue.
2. Different payment methods contribute differently to overall sales.
3. Social media and digital referral sources can generate significant sales.
4. Coupon campaigns can influence order volume and revenue.
5. High-value orders can be identified using SQL filtering and subqueries.
6. Grouped analysis provides useful comparisons across products, payment methods, and order statuses.

---

##  Project Structure

```text
SQL-Data-Analysis/
│
├── Individual query results/
│   ├── above average.csv
│   ├── basic select.csv
│   ├── coupon summary.csv
│   ├── having.csv
│   ├── order by.csv
│   ├── overall summary.csv
│   ├── payment summary.csv
│   ├── product status.csv
│   ├── product summary.csv
│   ├── quantity by product.csv
│   ├── referral summary.csv
│   ├── sales contribution.csv
│   ├── status summary.csv
│   └── where high value.csv
│
├── cleaned data set.csv
├── quries.sql
|
└── README.md
