
-- Declare a forward_only cursor
-- a forwar only corsors can only move forward through the result set and do not suppurt scrolling.
--  this cursor select form the students table
DECLARE forward_only_cursor CURSOR STATIC FORWARD_ONLY FOR
SELECT StudentID, Name, IsActive FROM Students

-- open the cursor. This initialize the cursor and makes it ready to use.
OPEN forward_only_cursor;

-- Declare variables to store the data for each row fetched by the cursor
DECLARE @StudentID INT, @Name NVARCHAR(50), @IsActive BIT;

-- Fetch the first row of data from the cursor and store it in the declare variables.
FETCH NEXT FROM forward_only_cursor INTO @StudentID, @Name, @IsActive;


-- Enter the loop that will continue as long as the previous fetch was successful
WHILE @@FETCH_STATUS = 0
BEGIN 

	-- Print hte current row's student id, name and subject
	PRINT 'Student ID:' + CAST(@StudentID AS VARCHAR) + ', Student Name: ' + @Name + ', Student Status: ' + CASE @IsActive WHEN 1 THEN 'ACTIVE' ELSE 'NOT ACTIVE' END;
	--fetch the next row of the data from the cursor
	-- since this is a forward only cursor, it can only move to the next row
	FETCH NEXT FROM forward_only_cursor INTO @StudentID, @Name, @IsActive;
END 


CLOSE forward_only_cursor
DEALLOCATE forward_only_cursor;










































