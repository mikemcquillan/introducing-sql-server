USE AddressBook
	
BULK INSERT dbo.ContactAddresses
	FROM 'C:\Temp\SqlBasics\importfiles\02_ContactAddresses.csv'
WITH
(
	ROWTERMINATOR = '\n',
	FIELDTERMINATOR = ',',
	FIRSTROW = 2,
	ERRORFILE = 'c:\temp\sqlbasics\importfiles\02_ContactAddresses_Errors.csv',
	CHECK_CONSTRAINTS
)

GO


