SELECT * FROM game_purchases;

-- Revenue By Game Genre
SELECT GameGenre, SUM(InAppPurchaseAmount) AS Revenue
FROM game_purchases
GROUP BY GameGenre
ORDER BY Revenue DESC;

-- Top Countries by Revenue
SELECT TOP 10
	Country,SUM(InAppPurchaseAmount) AS Revenue
FROM game_purchases
GROUP BY Country
ORDER BY Revenue DESC;

-- Revenue By Device
SELECT Device,SUM(InAppPurchaseAmount) AS Revenue
FROM game_purchases
GROUP BY Device
ORDER BY Revenue DESC;


-- Revenue By Spending Segment
SELECT SpendingSegment,SUM(InAppPurchaseAmount) AS Revenue
FROM game_purchases
GROUP BY SpendingSegment
ORDER BY Revenue DESC;

-- Avg Revenue by age group
SELECT 
CASE 
	WHEN Age BETWEEN 13 AND 17 THEN '13-17'
	WHEN Age BETWEEN 18 AND 24 THEN '18-24'
	WHEN Age BETWEEN 25 AND 34 THEN '25-34'
	WHEN Age >= 35 THEN '35+'
	ELSE 'Unkown'
END AS AgeGroup, AVG(InAppPurchaseAmount) AS avgRevenue
FROM game_purchases
GROUP BY 
CASE
	WHEN Age BETWEEN 13 AND 17 THEN '13-17'
	WHEN Age BETWEEN 18 AND 24 THEN '18-24'
	WHEN Age BETWEEN 25 AND 34 THEN '25-34'
	WHEN Age >= 35 THEN '35+'
	ELSE 'Unkown'
	END
ORDER BY avgRevenue DESC;

-- Payment method distribution

SELECT 
 COALESCE(PaymentMethod, 'Unkown') AS PaymentMethod,
 COUNT(*) AS PurchaseCount, 
 COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS Percentage
 FROM game_purchases
 GROUP BY COALESCE(PaymentMethod, 'Unkown')
 ORDER BY PurchaseCount DESC;

 -- Revenue by Gender

SELECT Gender, SUM(InAppPurchaseAmount) AS Revenue
FROM game_purchases
GROUP BY Gender
ORDER BY Revenue DESC;

-- Engagement by spending segment
SELECT SpendingSegment, AVG(SessionCount) AS  AvgSessionCount, AVG(AverageSessionLength) AS AvgSessionLength, AVG(InAppPurchaseAmount) AS AvgRevenue
FROM game_purchases
GROUP BY SpendingSegment
ORDER BY AvgRevenue DESC;

-- Revenue by device and Segment

SELECT Device, SpendingSegment, SUM(InAppPurchaseAmount) AS Revenue
FROM game_purchases
GROUP BY Device, SpendingSegment
ORDER BY Device, Revenue DESC;

-- Top 10 users by spend
SELECT TOP 10 UserID, Country, Device, GameGenre, SpendingSegment, InAppPurchaseAmount
FROM game_purchases
ORDER BY InAppPurchaseAmount DESC;