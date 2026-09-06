-- DecodeLabs Data Analytics Project 3
-- Project: SQL Data Analysis
-- Dataset: Cleaned Data Analytics Dataset
-- SQL dialect: SQLite

-- =========================================================
-- 1. CREATE TABLE
-- =========================================================
DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    OrderID TEXT PRIMARY KEY,
    Date TEXT,
    CustomerID TEXT,
    Product TEXT,
    Quantity INTEGER,
    UnitPrice REAL,
    ShippingAddress TEXT,
    PaymentMethod TEXT,
    OrderStatus TEXT,
    TrackingNumber TEXT,
    ItemsInCart INTEGER,
    CouponCode TEXT,
    ReferralSource TEXT,
    TotalPrice REAL
);

-- Import cleaned_data.csv using your SQL tool's CSV import option.
-- Example for SQLite CLI:
-- .mode csv
-- .headers on
-- .import cleaned_data.csv orders

-- =========================================================
-- 2. BASIC SELECT
-- Requirement: SELECT
-- =========================================================
SELECT OrderID, CustomerID, Product, Quantity, TotalPrice
FROM orders
LIMIT 10;

-- =========================================================
-- 3. FILTER ORDERS
-- Requirement: WHERE
-- =========================================================
SELECT OrderID, Product, Quantity, TotalPrice
FROM orders
WHERE TotalPrice > 2000
ORDER BY TotalPrice DESC;

-- =========================================================
-- 4. SORT ORDERS BY PRICE
-- Requirement: ORDER BY
-- =========================================================
SELECT OrderID, Product, UnitPrice, TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 10;

-- =========================================================
-- 5. GROUP BY PRODUCT
-- Requirement: GROUP BY + COUNT + SUM + AVG
-- =========================================================
SELECT
    Product,
    COUNT(*) AS OrderCount,
    SUM(Quantity) AS UnitsSold,
    ROUND(SUM(TotalPrice), 2) AS TotalSales,
    ROUND(AVG(TotalPrice), 2) AS AverageOrderValue
FROM orders
GROUP BY Product
ORDER BY TotalSales DESC;

-- =========================================================
-- 6. GROUP BY PAYMENT METHOD
-- =========================================================
SELECT
    PaymentMethod,
    COUNT(*) AS OrderCount,
    ROUND(SUM(TotalPrice), 2) AS TotalSales,
    ROUND(AVG(TotalPrice), 2) AS AverageOrderValue
FROM orders
GROUP BY PaymentMethod
ORDER BY TotalSales DESC;

-- =========================================================
-- 7. ORDER STATUS ANALYSIS
-- =========================================================
SELECT
    OrderStatus,
    COUNT(*) AS OrderCount,
    ROUND(SUM(TotalPrice), 2) AS TotalValue,
    ROUND(AVG(TotalPrice), 2) AS AverageOrderValue
FROM orders
GROUP BY OrderStatus
ORDER BY OrderCount DESC;

-- =========================================================
-- 8. REFERRAL SOURCE ANALYSIS
-- =========================================================
SELECT
    ReferralSource,
    COUNT(*) AS OrderCount,
    ROUND(SUM(TotalPrice), 2) AS TotalSales,
    ROUND(AVG(TotalPrice), 2) AS AverageOrderValue
FROM orders
GROUP BY ReferralSource
ORDER BY TotalSales DESC;

-- =========================================================
-- 9. COUPON PERFORMANCE
-- =========================================================
SELECT
    CouponCode,
    COUNT(*) AS OrderCount,
    ROUND(SUM(TotalPrice), 2) AS TotalSales,
    ROUND(AVG(TotalPrice), 2) AS AverageOrderValue
FROM orders
GROUP BY CouponCode
ORDER BY TotalSales DESC;

-- =========================================================
-- 10. HIGH-VALUE ORDERS
-- Requirement: WHERE + ORDER BY
-- =========================================================
SELECT
    OrderID,
    Product,
    Quantity,
    UnitPrice,
    TotalPrice
FROM orders
WHERE TotalPrice >= 2000
ORDER BY TotalPrice DESC;

-- =========================================================
-- 11. PRODUCT ORDERS ABOVE AVERAGE VALUE
-- Uses a subquery
-- =========================================================
SELECT
    OrderID,
    Product,
    TotalPrice
FROM orders
WHERE TotalPrice > (SELECT AVG(TotalPrice) FROM orders)
ORDER BY TotalPrice DESC;

-- =========================================================
-- 12. QUANTITY ANALYSIS BY PRODUCT
-- =========================================================
SELECT
    Product,
    COUNT(*) AS OrderCount,
    SUM(Quantity) AS TotalQuantity,
    ROUND(AVG(Quantity), 2) AS AverageQuantity
FROM orders
GROUP BY Product
ORDER BY TotalQuantity DESC;

-- =========================================================
-- 13. GROUPED FILTERING WITH HAVING
-- Advanced practice suggested in the project PDF
-- =========================================================
SELECT
    Product,
    COUNT(*) AS OrderCount,
    ROUND(SUM(TotalPrice), 2) AS TotalSales
FROM orders
GROUP BY Product
HAVING SUM(TotalPrice) > 180000
ORDER BY TotalSales DESC;

-- =========================================================
-- 14. SALES CONTRIBUTION BY PRODUCT
-- =========================================================
SELECT
    Product,
    ROUND(SUM(TotalPrice), 2) AS ProductSales,
    ROUND(
        100.0 * SUM(TotalPrice) / (SELECT SUM(TotalPrice) FROM orders),
        2
    ) AS SalesContributionPercent
FROM orders
GROUP BY Product
ORDER BY SalesContributionPercent DESC;

-- =========================================================
-- 15. OVERALL BUSINESS SUMMARY
-- =========================================================
SELECT
    COUNT(*) AS TotalOrders,
    COUNT(DISTINCT CustomerID) AS UniqueCustomers,
    SUM(Quantity) AS TotalUnitsSold,
    ROUND(SUM(TotalPrice), 2) AS TotalSales,
    ROUND(AVG(TotalPrice), 2) AS AverageOrderValue
FROM orders;

-- =========================================================
-- 16. STATUS + PRODUCT BREAKDOWN
-- =========================================================
SELECT
    Product,
    OrderStatus,
    COUNT(*) AS OrderCount,
    ROUND(SUM(TotalPrice), 2) AS TotalValue
FROM orders
GROUP BY Product, OrderStatus
ORDER BY Product, OrderCount DESC;
