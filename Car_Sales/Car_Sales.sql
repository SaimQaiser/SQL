SELECT *
FROM [Car Sales]..CarSales
Order by 1


--Let check how many percent of Men and FEMALE have buyed Cars
SELECT
    Gender,
    COUNT(*) AS Total_Count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS Percentage_Ratio
FROM
    CarSales
GROUP BY
    Gender;

--Average income of customer
Select AVG(Annual_Income) AS avg_income
FROM CarSales

-- Lets check the count of people above and below the average
SELECT
    SUM(CASE WHEN Annual_Income > avg_income THEN 1 ELSE 0 END) AS above_average_count,
    SUM(CASE WHEN Annual_Income < avg_income THEN 1 ELSE 0 END) AS below_average_count
FROM CarSales
CROSS JOIN (SELECT AVG(Annual_Income) AS avg_income FROM CarSales) AS avg_annual_income;

-- Lets Check which Company sold the most cars--
SELECT Company, COUNT(*) AS cars_sold
FROM CarSales
GROUP BY company
ORDER BY cars_sold DESC

--Total earnings for each company ith Highest to lowest
SELECT Company, SUM(Price) AS total_earnings
FROM CarSales
GROUP BY Company
ORDER BY total_earnings DESC;

--Favourite color
SELECT
    Color,
    COUNT(*) AS Total_Count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS Percentage_Ratio
FROM
    CarSales
GROUP BY
    Color;

--Which Color made the most business
SELECT Color, SUM(Price) AS total_earnings
FROM CarSales
GROUP BY Color
ORDER BY total_earnings DESC;

--Model most sold
SELECT
    Model,
    COUNT(*) AS Total_Count
FROM
    CarSales
GROUP BY
    Model;

--Model most sold with best earnings
SELECT Model, SUM(Price) AS total_earnings
FROM CarSales
GROUP BY Model
ORDER BY total_earnings DESC;

-- Sales over time
SELECT 
    YEAR(Date) AS sales_year,
    MONTH(Date) AS sales_month,
    COUNT(*) AS total_sales
FROM 
    CarSales
GROUP BY 
    YEAR(Date), MONTH(Date)
ORDER BY 
    sales_year, sales_month;

--Most sales 
SELECT 
    YEAR(Date) AS sales_year,
    MONTH(Date) AS sales_month,
    COUNT(*) AS total_sales
FROM 
    CarSales
GROUP BY 
    YEAR(Date), MONTH(Date)
ORDER BY 
    COUNT(*) DESC;






