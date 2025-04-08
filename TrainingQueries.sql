


SELECT department AS DepartmentName, MAX(Salary) AS MaxSalary FROM Employees2 
GROUP BY Department


select Name, Salary, Department from Employees2 e1
where Salary > 
(
Select AVG(Salary) from Employees2 e2
 where e2.Department = e1.Department
)

SELECT Name, Salary
FROM Employees2 e1
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees2 e2
    WHERE e2.Department = e1.Department
);





SELECT Department, AVG(PerformanceRating) AS AverageRating
FROM Employees2
WHERE Salary > 60000
GROUP BY Department;

SELECT e1.*
FROM Employees2 e1
JOIN (
    SELECT Department, MAX(PerformanceRating) AS MaxRating
    FROM Employees2
    GROUP BY Department
) Temp ON e1.Department = Temp.Department AND e1.PerformanceRating = Temp.MaxRating;



SELECT TOP 3 * FROM Employees2
WHERE Salary in 
(SELECT DISTINCT TOP 3 Salary FROM Employees2
ORDER BY Salary DESC
)

SELECT TOP 3 * FROM Employees2
WHERE Salary in 
(SELECT MAX(Salary) FROM Employees2
GROUP BY Department
)

SELECT Department, MAX(Salary) AS MaxSalary, MIN(Salary) AS MinSalary FROM Employees2
GROUP BY Department
HAVING (MAX(Salary) - MIN(Salary)) > 100000


SELECT R1.* FROM Employees2 R1
JOIN (SELECT Department,AVG(PerformanceRating)AS PER FROM Employees2 GROUP BY Department) R
ON R1.Department= R.Department AND R.PER < R1.PerformanceRating
ORDER BY PerformanceRating DESC


SELECT * FROM Employees2 E
WHERE PerformanceRating > (SELECT AVG(PerformanceRating) FROM Employees2 E2
WHERE E.Department = E2.Department)
ORDER BY PerformanceRating DESC


SELECT PerformanceCategory ,COUNT(*) AS NumberOfEmployees, AVG(Salary) AS AverageSalaries  FROM 
	(SELECT * 
	,CASE
		WHEN PerformanceRating >= 80 THEN 'High'
		WHEN PerformanceRating >= 60 THEN 'Medium'
		ELSE 'Low'
	END AS PerformanceCategory
	FROM Employees2) AS PerformanceTable 
		GROUP BY PerformanceCategory