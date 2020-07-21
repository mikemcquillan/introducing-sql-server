USE AddressBook

BULK INSERT dbo.Contacts
	FROM 'C:\temp\sqlbasics\importfiles\01_Contacts.csv'
WITH
(
	ROWTERMINATOR = '\n',
	FIELDTERMINATOR = ',',
	FIRSTROW = 2,
	ERRORFILE = 'c:\temp\sqlbasics\importfiles\01_Contacts_Errors.csv',
	CHECK_CONSTRAINTS
)
	
GO


