
-- Declare scrollable cursor 
-- Scrollable cursors allow movement both forward and backward through the result set

DECLARE scroll_cursor CURSOR STATIC SCROLL FOR 
SELECT StudentID, Name, Grade FROM Students

-- open the cursor
OPEN scroll_cursor;


--declare variables to store the data for each row
DECLARE @StudentID INT, @Name NVARCHAR(50), @Grade INT

-- fetch the next row of data form the cursor and store it on the declare variables
FETCH NEXT FROM scroll_cursor INTO @StudentID, @Name, @Grade ;


WHILE @@FETCH_STATUS = 0 
BEGIN
	-- Print hte current row's student id, name and subject
	PRINT 'Student ID:' + CAST(@StudentID AS VARCHAR) + ', Student Name: ' + @Name + ', Student Grade: ' + CAST(@Grade AS VARCHAR);
	
	--fetch the next row of the data from the cursor (moving forward)
	-- this is to demonstrate that the cursor can move back to the next row after movig backward
	FETCH NEXT FROM scroll_cursor INTO @StudentID, @Name, @Grade;
END 


PRINT ''
PRINT 'Previous:' 
FETCH PRIOR FROM scroll_cursor INTO @StudentID, @Name, @Grade;

WHILE @@FETCH_STATUS = 0 
BEGIN
	-- Print hte current row's student id, name and subject
	PRINT 'Student ID:' + CAST(@StudentID AS VARCHAR) + ', Student Name: ' + @Name + ', Student Grade: ' + CAST(@Grade AS VARCHAR);
	
		-- fetch the previous row of data from the cursor (moving backward)
		--this demonstrates the ability of the scrolable cursor to move in reverse
		FETCH PRIOR FROM scroll_cursor INTO @StudentID, @Name, @Grade;
	
END 

CLOSE scroll_cursor;
DEALLOCATE scroll_cursor;


























