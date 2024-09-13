/*
Summary:        Exercises on String Patterns, Sorting, and Grouping Built-in Database Functions
Description:    This script demonstrates the usage of various string pattern functions, 
                sorting mechanisms,and grouping functions available in the database.
Author:         Regenald
Date:           Sept 13,2024
*/

USE Npower
--1. Write SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru”
SELECT 
    SUM([Amount_in_USD]) AS TotalFunding
FROM [dbo].[indian_startup_funding]
WHERE City_Location ='Bengaluru'

--2. Write SQL query to sort the table by startup name DESC
SELECT
    *
FROM dbo.indian_startup_funding
ORDER BY Startup_Name DESC

--3. Write SQL query to sum all the funding AmountinUSD, where City location equals “Bengaluru”
--and AmountinUSD>380000
SELECT 
    SUM([Amount_in_USD]) AS TotalFunding
FROM [dbo].[indian_startup_funding]
WHERE City_Location ='Bengaluru' 
AND Amount_in_USD > 380000

--4. Write SQL query to get all CityLocations that has an AmountinUSD >380000
SELECT
    City_Location    
FROM [dbo].[indian_startup_funding]
WHERE Amount_in_USD > 380000

--5. Write SQL query to get only unique CityLocations that has an AmountinUSD >380000
SELECT DISTINCT
    City_Location    
FROM [dbo].[indian_startup_funding]
WHERE Amount_in_USD > 380000

--6. Write SQL query to get all StartupNames where AmountinUSD<380000
SELECT
    Startup_Name    
FROM [dbo].[indian_startup_funding]
WHERE Amount_in_USD < 380000

--7. Write SQL query to sort the output from the previous question DESC
SELECT
    Startup_Name    
FROM [dbo].[indian_startup_funding]
WHERE Amount_in_USD < 380000
ORDER BY Startup_Name DESC

--8. Write SQL query to get the City location that has the maximum funding amount “Note that is the
--data is not cleaned properly you will get non logical result”
SELECT TOP 1
    City_Location,
    Amount_in_USD
FROM dbo.indian_startup_funding
WHERE Amount_in_USD IS NOT NULL 
    OR Amount_in_USD > 0
ORDER BY Amount_in_USD DESC

--9. Write SQL query to get the total funding AmountinUSD for each IndustryVertical
SELECT
    Industry_Vertical,
    SUM(Amount_in_USD) AS TotalFunding
FROM dbo.indian_startup_funding
WHERE Amount_in_USD IS NOT NULL
GROUP BY Industry_Vertical

--10. Write SQL query to get the total funding AmountinUSD for each IndustryVertical that starts with 
--letter “A”
SELECT
    Industry_Vertical,
    SUM(Amount_in_USD) AS TotalFunding
FROM dbo.indian_startup_funding
WHERE Amount_in_USD IS NOT NULL 
    AND Industry_Vertical LIKE 'A%'
GROUP BY Industry_Vertical

--11. Write SQL query to get the total funding AmountinUSD for each IndustryVertical that starts with 
--letter “A” and sort the output DESC by the total AmountinUSD
SELECT
    Industry_Vertical,
    SUM(Amount_in_USD) AS TotalFunding
FROM dbo.indian_startup_funding
WHERE Amount_in_USD IS NOT NULL 
    AND Industry_Vertical LIKE 'A%'
GROUP BY Industry_Vertical
ORDER BY SUM(Amount_in_USD) DESC

--12. Write SQL query to count all the start_ups in the Education field
SELECT
    COUNT(*) AS StartUpsEdu
FROM dbo.indian_startup_funding
WHERE Industry_Vertical = 'Education'

--13. Write SQL query to count all the start_Ups in the E-Commerce field
SELECT
    COUNT(*) AS StartUpsEdu
FROM dbo.indian_startup_funding
WHERE Industry_Vertical = 'E-Commerce'

--14. Write SQL query to count all the start_Ups in the E-Commerce field, where city location equals
--“Bengaluru”
SELECT
    COUNT(*) AS StartUpsEdu
FROM dbo.indian_startup_funding
WHERE Industry_Vertical = 'E-Commerce'
    AND City_Location = 'Bengaluru'

--15. For each Industry Vertical find the total funding amount
SELECT
    Industry_Vertical,
    SUM(Amount_in_USD) AS TotalFunding
FROM dbo.indian_startup_funding
WHERE Amount_in_USD IS NOT NULL
GROUP BY Industry_Vertical
    
--16. For each Industry Vertical find the total funding amount as “Total_fund” and the average
--funding amount as “Avg_Fund”. In this question provide two answer 1- using group by Industry 
--Vertical, 2- using sub_queries
SELECT 
    Industry_Vertical,
    SUM(Amount_in_USD) AS Total_fund,
    AVG(Amount_in_USD) AS Avg_fund
FROM dbo.indian_startup_funding
WHERE Amount_in_USD IS NOT NULL
GROUP BY Industry_Vertical

SELECT
    Industry_Vertical,
    Total_Fund = (SELECT SUM(f1.Amount_in_USD) 
                  FROM dbo.indian_startup_funding f1 
                  WHERE f1.Industry_Vertical = f2.Industry_Vertical),
    Avg_Fund = (SELECT AVG(f1.Amount_in_USD) 
                FROM dbo.indian_startup_funding f1 
                WHERE f1.Industry_Vertical = f2.Industry_Vertical)
FROM dbo.indian_startup_funding f2
WHERE f2.Amount_in_USD IS NOT NULL
GROUP BY Industry_Vertical

--17. Write SQL query to get the minimum value of funding for the “Uniphore” start_up
SELECT
    MIN(Amount_in_USD) AS MinFunding
FROM indian_startup_funding
WHERE Startup_Name ='Uniphore'
    AND Amount_in_USD IS NOT NULL

--18. Write SQL query to get the length of the city location names 
SELECT
    City_Location,
    LEN(City_Location) AS CityNameLength
FROM indian_startup_funding

--19. Write SQL query to convert start_ups names into uppercase if the funding amount is >380,000
SELECT
    UPPER(Startup_Name) AS Startup_Name
FROM indian_startup_funding
WHERE Amount_in_USD > 380000

--20. Write SQL query to select distinct industry vertical names, knowing that names are mix of 
--lowercase and uppercase values
SELECT DISTINCT
    UPPER(Industry_Vertical) AS Industry_Vertical
FROM indian_startup_funding




