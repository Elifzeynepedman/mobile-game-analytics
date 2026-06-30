SELECT * FROM game_purchases;

-- Check total rows
SELECT COUNT(*) AS TotalRows
FROM game_purchases;

-- Check duplicate UserIDs
SELECT UserID, COUNT(*) AS Row_count
FROM game_purchases
GROUP BY UserID
HAVING COUNT(*)>1;

-- Check Missing Values
SELECT 
	SUM(CASE WHEN UserID IS NULL THEN 1 ELSE 0 END) AS MissingUserID,
	SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS MissingAge,
	SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS MissingGender,
	SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS MissingCountry,
	SUM(CASE WHEN PaymentMethod IS NULL THEN 1 ELSE 0 END) AS MissingPaymentMethod
FROM game_purchases;

