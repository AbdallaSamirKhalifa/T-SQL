use C21_DB1;
-- This script generates a monthly summary report.
-- It includes total sales, total number of transactions, and the average sale value fir a specified month and year


DECLARE @Year INT;
DECLARE @Month INT ;
DECLARE @TotalSales DECIMAL(10,2);
DECLARE @TotalTransactions INT;
DECLARE @AverageSale DECIMAL(10,2);

SET @Year = 2023;
SET @Month = 6;

-- Calculate total sales for the specified month
SELECT @TotalSales = SUM(SaleAmount) 
FROM Sales
WHERE YEAR(SaleDate) = @Year and MONTH(SaleDate) = @Month;

-- Calculate the total number of transactions
SELECT @TotalTransactions = COUNT(*)
FROM Sales
WHERE YEAR(SaleDate) = @Year and MONTH(SaleDate) = @Month;

-- Calculte the average sale value
SET @AverageSale = @TotalSales / @TotalTransactions;


PRINT 'Monthly sales summary report';
PRINT 'Year: ' + CAST(@Year AS VARCHAR) + ' Month: ' + CAST(@Month AS VARCHAR);
PRINT 'Total Sales: ' + CAST(@TotalSales AS VARCHAR);
PRINT 'Total Transactions: '+ CAST(@TotalTransactions AS VARCHAR);
PRINT 'Average Sales Value: '+ CAST(@AverageSale AS VARCHAR);

