-- This script generates an emplooyee attendance report for a specified month and year
-- It takes the number of days present, absent and leave for a particular employee

DECLARE @ReportMonth INT;
DECLARE @ReportYear INT;
DECLARE @TotalDays INT; 
DECLARE @EmployeeID INT;
DECLARE @PresentDays INT;
DECLARE @AbsentDays INT;
DECLARE @LeaveDays INT;

SET @ReportMonth=7;
SET @ReportYear=2023;
SET @EmployeeID=101;
 
--Calculate total days in a month EOMont stands for (end of month)
SET @TotalDays = DAY(EOMONTH(DATEFROMPARTS(@ReportYear, @ReportMonth, 1)));

--SELECT @PresentDays = COUNT(*)
--FROM EmployeeAttendance
--WHERE EmployeeID = @EmployeeID AND YEAR(AttendanceDate) = @ReportYear AND MONTH(AttendanceDate) = @ReportMonth AND Status = 'Present';


--SELECT @AbsentDays= COUNT(*)
--FROM EmployeeAttendance
--WHERE EmployeeID = @EmployeeID AND YEAR(AttendanceDate) = @ReportYear AND MONTH(AttendanceDate) = @ReportMonth AND Status = 'Absent';


--SELECT @LeaveDays = COUNT(*)
--FROM EmployeeAttendance
--WHERE EmployeeID = @EmployeeID AND YEAR(AttendanceDate) = @ReportYear AND MONTH(AttendanceDate) = @ReportMonth AND Status = 'Leave';


-- shortcut query
SELECT 
    @PresentDays = SUM(CASE WHEN Status = 'Present' THEN 1 ELSE 0 END),
    @AbsentDays= SUM(CASE WHEN Status = 'Absent' THEN 1 ELSE 0 END),
    @LeaveDays= SUM(CASE WHEN Status = 'On Leave' THEN 1 ELSE 0 END)
FROM 
    EmployeeAttendance
WHERE 
    EmployeeID = @EmployeeId AND
    YEAR(AttendanceDate) = @ReportYear AND
    MONTH(AttendanceDate) = @ReportMonth;



PRINT 'Employee Attendance Report for Employee ID: ' + CAST(@EmployeeID AS VARCHAR);
PRINT 'Report Month: ' + CAST(@ReportMonth AS VARCHAR) + '/' + CAST(@ReportYear AS VARCHAR);
PRINT 'Total working days: ' + CAST(@TotalDays AS VARCHAR);
PRINT 'Days Present: '+ CAST(@PresentDays AS VARCHAR);
PRINT 'Absent Days: '+ CAST(@AbsentDays AS VARCHAR);
PRINT 'Leave Days: ' + CAST(@LeaveDays AS VARCHAR);

