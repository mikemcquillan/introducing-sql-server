USE AddressBook

BULK INSERT dbo.ContactNotes
	FROM 'C:\Temp\SqlBasics\importfiles\03_ContactNotes.csv'
WITH
(
	ROWTERMINATOR = '\n',
	FIELDTERMINATOR = ',',
	FIRSTROW = 2,
	ERRORFILE = 'c:\temp\sqlbasics\importfiles\03_ContactNotes_Errors.csv',
	CHECK_CONSTRAINTS
)
	
GO


