SELECT *
FROM   game_purchases; -- Total Revenue

SELECT SUM(InAppPurchaseAmount) AS TotalRevenue
FROM   game_purchases; -- Total Users

SELECT COUNT(DISTINCT UserID) AS TotalUsers
FROM   game_purchases; -- Total Spenders

SELECT COUNT(DISTINCT UserID) AS Spenders
FROM   game_purchases
WHERE  InAppPurchaseAmount > 0; -- Average Revenue per User

SELECT SUM(InAppPurchaseAmount) / COUNT(DISTINCT UserID) AS ARPU
FROM   game_purchases; -- Average Session Length

SELECT AVG(AverageSessionLength) AS AvgSessionLength
FROM   game_purchases;