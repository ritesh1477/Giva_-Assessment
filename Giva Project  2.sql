WITH SKU_Counts AS (
    SELECT SKUsBought, COUNT(*) AS PurchaseCount
    FROM givadb.sales
    GROUP BY SKUsBought
)
SELECT SKUsBought
FROM SKU_Counts
ORDER BY PurchaseCount DESC
LIMIT 1;

SELECT CustomerName, COUNT(*) AS PurchaseCount
FROM givadb.sales
GROUP BY CustomerName
HAVING COUNT(*) > 1;

WITH MonthlyPurchases AS (
    SELECT CustomerName, MONTH(PurchaseDate) AS PurchaseMonth, COUNT(*) AS PurchasesPerMonth
    FROM givadb.sales
    GROUP BY CustomerName, PurchaseMonth
)
SELECT CustomerName, AVG(PurchasesPerMonth) AS AvgMonthlyPurchases
FROM MonthlyPurchases
GROUP BY CustomerName;

SELECT CustomerName
FROM givadb.sales
GROUP BY CustomerName
HAVING SUM(TotalPrice) > 1000;

