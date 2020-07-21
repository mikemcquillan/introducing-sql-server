USE AddressBook

IF EXISTS (SELECT 1 FROM sys.tables WHERE [Name] = 'Contacts')
 BEGIN
	DROP TABLE dbo.Contacts
 END

GO