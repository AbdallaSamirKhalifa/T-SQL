
------------------------------------Looping over a Table-------------------------------------------------
--DECLARE @EmployeeID INT;
--DECLARE @Name VARCHAR(50);
--DECLARE @MaxID INT;

-- Inithialize the starting point
--SELECT @EmployeeID = MIN(EmployeeID) FROM Employees

-- Find the maximum id
--SELECT @MaxID = MAX(EmployeeID) FROM Employees

-- loop through employees
--WHILE @EmployeeID IS NOT NULL AND @EmployeeID <= @MaxID
	--BEGIN
		--Perform an operation
		--SELECT @Name =NAME FROM Employees WHERE EmployeeID = @EmployeeID
		--PRINT @Name;

		--get the next id
		--SELECT @EmployeeID = MIN(EmployeeID) FROM Employees WHERE EmployeeID > @EmployeeID

	--END
------------------------------------------------Loop with conditional Exit--------------------------------------


--DECLARE @Balance DECIMAL(10,2) = 950.00 ,@Withdraw DECIMAL(10,2) =100.00


--WHILE @Balance > 0
--BEGIN
--	SET @Balance = @Balance - @Withdraw;

--		IF @Balance < 0 
--		BEGIN
--			PRINT 'Insuffecient funds for withdrawal.';
--			BREAK;
--		END

--	PRINT 'New Balance: '+ CAST(@Balance AS VARCHAR);
--END
------------------------------------------------Nested while loops 10 * 10 Multiplication Table--------------------------------------


--DECLARE @Row INT  =1, @Col INT, @Result INT;

--WHILE @Row <= 10
--BEGIN
--	PRINT 'ROW '+ CAST(@ROW AS VARCHAR)
--	SET @COL=1;
--	WHILE @Col <= 10
--	BEGIN
--		SET @Result = @Row * @COL;
--		PRINT CAST (@Row AS VARCHAR) + ' X ' + CAST(@COL AS VARCHAR) + ' = '+ CAST(@RESULT AS VARCHAR)
--		SET @COL = @COL + 1;
--	END

--	SET @Row = @ROW + 1;
--END

------------------------------------------------ 10 * 10 Matrix Multiplication Table--------------------------------------
--DECLARE @ROW INT =1;
--DECLARE @COL INT;
--DECLARE @HEADERSTRING VARCHAR(255);
--DECLARE @ROWSTRING VARCHAR(255);
--DECLARE @RESULT INT;

-- CREATE THE HEADER ROW FOR THE COLUMNS
--SET @HEADERSTRING = CHAR(9); -- STARTING WITH A TAP FOR THE ROW HEADER
--SET @COL =1;

--WHILE @COL <=10
--BEGIN
--	SET @HEADERSTRING = @HEADERSTRING + CAST(@COL AS VARCHAR) + CHAR(9);--APPEND THE COLUMN HEADER
--	SET @COL = @COL + 1;
--END

--PRINT @HEADERSTRING ;

---- GENERATE THE MULTIPLICATION TABLE
--WHILE @ROW <= 10
--BEGIN 

--	SET @ROWSTRING = CAST(@ROW AS VARCHAR) + CHAR(9);-- START EACH ROW WITH THE ROW NUMBER
--	SET @COL =1;
--	WHILE @COL <= 10 
--	BEGIN
--		SET @RESULT = @COL * @ROW;
--		SET @ROWSTRING = @ROWSTRING + CAST(@RESULT AS VARCHAR) + CHAR(9);--APPEND THE MULTIPLICATION RESULT
--		SET @COL = @COL + 1;
--	END
--	PRINT @ROWSTRING --PRINT THE ROW
--	SET @ROW = @ROW + 1;
--END

------------------------------------------------ BREAK AND CONTINUE STATEMENT--------------------------------------

--DECLARE @COUNTER INT =1;

--PRINT 'BREAK STATEMENT';
--WHILE @COUNTER <= 10
--BEGIN
--	PRINT 'COUNTER: '+ CAST(@COUNTER AS VARCHAR);
--	IF @COUNTER =5
--	BEGIN 
--		BREAK;
--	END
--	SET @COUNTER = @COUNTER + 1; 
--END

--SET @COUNTER =0 ;
--PRINT '';
--PRINT 'CONTINUE STATEMENT';

--WHILE @COUNTER <= 10
--BEGIN
--	SET @COUNTER = @COUNTER + 1;
--	IF @COUNTER % 2 = 0
--	BEGIN

--		CONTINUE;
--	END
--	PRINT 'COUNTER '+ CAST (@COUNTER AS VARCHAR);
--END

------------------------------------------------ BREAK AND CONTINUE STATEMENT--------------------------------------
