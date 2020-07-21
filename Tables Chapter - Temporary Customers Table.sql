USE AddressBook

CREATE TABLE Customers (FirstName VARCHAR(30), Surname VARCHAR(30))

INSERT INTO Customers (FirstName, Surname)
VALUES ('Grace', 'McQuillan'), ('Jo', 'McQuillan')

SELECT * FROM Customers