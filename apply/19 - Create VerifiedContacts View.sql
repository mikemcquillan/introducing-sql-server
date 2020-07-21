USE AddressBook

IF EXISTS (SELECT 1 FROM sys.views WHERE [Name] = 'VerifiedContacts')
 BEGIN
	DROP VIEW dbo.VerifiedContacts
 END

GO

CREATE VIEW dbo.VerifiedContacts
WITH SCHEMABINDING
AS
SELECT	C.ContactId,
		C.FirstName,
		C.LastName,
		C.DateOfBirth,
		CASE C.AllowContactByPhone
			WHEN 1 THEN 'Yes'
			ELSE 'No'
		END AS AllowContactByPhone,
		CVD.DrivingLicenseNumber,
		CVD.PassportNumber
FROM dbo.Contacts C
	INNER JOIN dbo.ContactVerificationDetails CVD
		ON C.ContactId = CVD.ContactId
WHERE CVD.ContactVerified = 1

GO