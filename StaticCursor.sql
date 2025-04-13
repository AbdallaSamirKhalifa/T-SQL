

-- Declare a static cursor named static_cursor
-- A static cursor creates a snapshoty of the result set at the time of cursor creation
-- This cursor selects StudentID, Name, and Grade form the students table
DECLARE static_cursor CURSOR STATIC FOR
SELECT StudentID, Name, Grade FROM Students

-- Opent the curser. this initialize the cursor and make it ready to use.
OPEN static_cursor;

-- Declare variable to store the data for each row fetched by the cursor.

DECLARE @StudentID INT;
DECLARE @Name NVARCHAR(50);
DECLARE @Grade INT;

-- Fetch the first row of the data form the cursor and store it in the declare variables.

FETCH NEXT FROM static_cursor INTO @StudentID, @Name, @Grade;

-- Enter a loop that will continue as long as the previous fetch was successfu.
-- @@FETCH_STATUS returns 0 if the fetch was successful.
WHILE @@FETCH_STATUS = 0
BEGIN
	-- Print the current row's student id, name, and grade. Or do whatever logic you want to,.
	PRINT 'Student ID: ' + CAST(@StudentID AS VARCHAR) + ', Student Name: ' + @Name + ', Student Grade: ' + CAST(@Grade AS VARCHAR)
	-- Fetch the next row of data form the cursor
	-- The loop will continue untill there are no more rows to fetch.
	FETCH NEXT FROM static_cursor INTO @StudentID, @Name, @Grade;
END


-- Once the loop is finished (no more rows to fetch), close the cursor
-- Closing the cursor releases the current result set.
CLOSE static_cursor;

--Deallocate the cursor
-- This step is important to free up resources used by the cursor
DEALLOCATE static_cursor;















