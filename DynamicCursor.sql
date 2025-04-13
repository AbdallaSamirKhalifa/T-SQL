


-- Declare a dynamic cursor 
-- A dynamic cursor reflects changes in the database while the cursor is open
-- this cursor selects StudentID, Name, and subject from the students table
DECLARE dynamic_cursor CURSOR DYNAMIC FOR
SELECT StudentID, Name, Subject FROM Students;

-- open the cursor. This initialize the cursor and makes it ready to use
OPEN dynamic_cursor;

-- Declare variabvles to store the data for each row fetched by the cursor
DECLARE @StudentID INT;
DECLARE @Name NVARCHAR(50);
DECLARE @Subject NVARCHAR(50);

-- Fetch the first row of data form the cursor and store it in the declare variables
FETCH NEXT FROM dynamic_cursor INTO @StudentID, @Name, @Subject;


-- Enter a loop that will continue as long as the previous fetch was successful
WHILE @@FETCH_STATUS = 0
BEGIN 

	-- Print hte current row's student id, name and subject
	PRINT 'Student ID:' + CAST(@StudentID AS VARCHAR) + ', Student Name: ' + @Name + ', Student Subject: ' + @Subject;
	--fetch the next row of the data from the cursor
	FETCH NEXT FROM dynamic_cursor INTO @StudentID, @Name, @Subject;
END 


CLOSE dynamic_cursor
DEALLOCATE dynamic_cursor;
















