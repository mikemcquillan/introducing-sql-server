USE AddressBook

IF EXISTS (SELECT 1 FROM sys.indexes 
WHERE [name] = 'IX_ContactAddresses_Clustered_ContactIdPostcode')
 BEGIN
	DROP INDEX IX_ContactAddresses_Clustered_ContactIdPostcode 
ON dbo.ContactAddresses
 END

CREATE CLUSTERED INDEX IX_ContactAddresses_Clustered_ContactIdPostcode
	 ON dbo.ContactAddresses(ContactId, Postcode)

GO
