CREATE VIEW RentsPerStores
AS
SELECT COUNT(RENTS.VEHICLEID) as VEHID , STORE.CITY AS CITYSTORE
FROM STORE
INNER JOIN HANDLES ON HANDLES.STOREID=STORE.STOREID
INNER JOIN VEHICLE ON VEHICLE.VEHICLEID = HANDLES.VehicleID
INNER JOIN RENTS ON VEHICLE.VEHICLEID=RENTS.VEHICLEID
GROUP BY STORE.CITY
HAVING COUNT(RENTS.VEHICLEID) > 0

GO

CREATE VIEW EmployeeView
AS
SELECT Employee.IRSNumber, Employee.FirstName, Employee.LastName, Employee.Street, Employee.StreetNumber, Employee.PostalCode 
FROM Employee


GO

CREATE VIEW StoreView
AS
SELECT Store.City, Store.Street, Store.StreetNumber, Store.PostalCode , PhoneNumber.PhoneNumber, EmailAddress.Email 
FROM Store 
INNER JOIN PhoneNumber ON Store.StoreID = PhoneNumber.StoreID 
INNER JOIN EmailAddress ON Store.StoreID = EmailAddress.StoreID
GO

CREATE VIEW StatisticsPerVeh 
AS
SELECT COUNT(VEHICLEID) AS VEHNO , FUELTYPE
FROM VEHICLE
--WHERE CylinderCapacity >1400
GROUP BY FuelType
HAVING COUNT(VehicleID) >0