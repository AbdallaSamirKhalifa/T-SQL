
/*
In this scenario, we will use T-SQL variables to calculae and update loyalty points for customers based on their purchases history.
The calculation will be based on the total amount spent by the customer in a given year
with a simple point sytem where 1 point is awarded for every 10$ spent

This example demonstrates how T-SQL variable can be used for more complex calculations
involving data from multiple tables, and how these results can be used to update records in a database,
showcasing the power and versatility of SQL in handling real-world buisness scenarios.
*/


DECLARE @CustomerID INT;
DECLARE @TotalSpent DECIMAL(10,2);
DECLARE @PointsEarned INT;
DECLARE @CurrentYear INT =2023;--or year(dateadd(year,-(numberofyear),getdate()))


SET @CustomerID=2;



SELECT @TotalSpent = SUM(Amount)
FROM Purchases
WHERE CustomerID = @CustomerID AND YEAR (PurchaseDate) =@CurrentYear;

-- Calculate loyalty point (1 point for every 10$ spent)
SET @PointsEarned = CAST(@TotalSpent / 10 AS INT);

UPDATE Customers
SET LoyaltyPoints = LoyaltyPoints + @PointsEarned
WHERE CustomerID = @CustomerID;

PRINT 'Loyalty points update for Customer ID: ' + CAST(@CustomerID AS VARCHAR);
PRINT 'Total amount spent in '+ CAST (@CurrentYear AS VARCHAR) + ' :$' + CAST (@TotalSpent AS VARCHAR);
PRINT 'Loyalty points Earned: '+ CAST(@PointsEarned AS VARCHAR)



