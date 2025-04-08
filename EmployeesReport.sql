-- Example: Employee report generation in T-SQL 
-- This script demonstrates the declaration, initialization and use of variables in T-SQL
-- It generates a report for a specific department, including the department name, reporting period and total employees hired within that period.
-- This comprehinsive script gives a practical insight into how variables can be effectvely used in T-SQL to create dynamic and flexible SQL script.
use C21_DB1;

-- Step 1: Declare variables
DECLARE @DepartmentID INT;
DECLARE @StartDate DATE;
DECLARE @EndDate DATE;
DECLARE @TotalEmployees INT;
DECLARE @DepartmentName VARCHAR(50);

-- Step 2: Initialize variables
SET @DepartmentID=3;
SET @StartDate='2023-01-01';
SET @EndDate='2023-12-31';

-- Step 3: Retrieve department name based on department ID
SELECT @DepartmentName = Name FROM Departments WHERE DepartmentID = @DepartmentID;

-- Step 4: Calculate the total numner of employees in the specefied department
SELECT @TotalEmployees = COUNT(*)
FROM Employees
WHERE DepartmentID =@DepartmentID
AND HireDate BETWEEN @StartDate AND @EndDate;


-- Step 5: print the report 
PRINT 'Department Report';
PRINT 'Departmetn Name: ' + @DepartmentName;
PRINT 'Reporting Period ' + CAST(@startDate AS VARCHAR) + ' To ' + CAST(@EndDate AS VARCHAR);
PRINT 'Total emoployees hired in ' + CAST(YEAR(@StartDate) AS VARCHAR) +': '+ CAST(@TotalEmployees AS VARCHAR);
