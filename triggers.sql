--DELETE CUSTOMER -> DELETE RENTS, DELETE RESERVES
CREATE TRIGGER trgAfterDeleteCustom ON [dbo].[Customers] 
AFTER DELETE
AS
	declare @customid int;

	select @customid=d.CustomerID from deleted d;	

	DELETE FROM RENTS
	WHERE CUSTOMERID = @CUSTOMID

	DELETE FROM Reserves
	WHERE CustomerID = @customid

GO


--INSERT VEHICLE -> INSERT HANDLES
CREATE TRIGGER trgAfterInsertVehicle ON [dbo].[Vehicle] 
AFTER INSERT
AS
	declare @vehid int;

	select @vehid=i.VehicleID from inserted i;	

	INSERT INTO HANDLES(STOREID,VehicleID)
	VALUES (1, @vehid)

GO

--DELETE VEHICLE -> DELETE HANDLES
CREATE TRIGGER trgAfterDeleteVeh ON [dbo].[Vehicle] 
AFTER DELETE
AS
	declare @vehid int;

	select @vehid=d.VehicleID from deleted d;	

	DELETE FROM HANDLES 
	WHERE VehicleID = @vehid

	
	DELETE FROM RENTS
	WHERE VehicleID = @vehid

	DELETE FROM Reserves
	WHERE VehicleID = @vehid

GO




--DELETE Rents -> DELETE PayTransaction
CREATE TRIGGER trgAfterDeleteRent ON [dbo].[Rents] 
AFTER DELETE
AS
	declare @rentid int;

	select @rentid=d.RentID from deleted d;	

	DELETE FROM PayTransaction 
	WHERE RentID = @rentid

GO

--INSERT RENTS -> INSERT PAYTRANSACTION
CREATE TRIGGER trgAfterInsertRent ON [dbo].[Rents] 
AFTER INSERT
AS
	declare @rentid int;
	declare @startdate datetime;
	declare @vehid int;

	select @rentid=i.RentID from inserted i;
	select @startdate=i.StartDate from inserted i;
	select @vehid=i.VehicleID from inserted i;	

	INSERT INTO PayTransaction(StartDate,VehicleID,PayAmount,PayMethod,RentID)
	VALUES (@startdate, @vehid, 15, 'Cash', @rentid )

GO

--UPDATE RENTS -> UPDATE PAYTRANSACTION
CREATE TRIGGER trgAfterUpdateRent ON [dbo].[Rents] 
AFTER UPDATE
AS
	declare @rentid int;
	declare @startdate datetime;
	declare @vehid int;

	select @rentid=i.RentID from inserted i;
	select @startdate=i.StartDate from inserted i;
	select @vehid=i.VehicleID from inserted i;	

	UPDATE PayTransaction
	SET StartDate = @startdate , VehicleID = @vehid
	WHERE RentID = @rentid

GO

--INSERT EMPLOYEE -> INSERT WORKS
CREATE TRIGGER trgAfterInsertEmployee ON [dbo].[Employee] 
AFTER INSERT
AS
	declare @IRSNum int;

	select @IRSNum=i.IRSNumber from inserted i;	

	INSERT INTO WORKS(IRSNumber,StoreID,StartDate,Position)
	VALUES (@IRSNum,1,GETDATE(),'Sales')

GO

--DELETE EMPLOYEE -> DELETE WORKS
CREATE TRIGGER trgAfterDeleteEmp ON [dbo].[Employee] 
AFTER DELETE
AS
	declare @IRSNum int;

	select @IRSNum=d.IRSNumber from deleted d;	

	DELETE FROM Works 
	WHERE IRSNumber = @IRSNum

GO



--DELETE STORE -> DELETE PHONENUMBER, DELETE EMAILADDRESS, UPDATE HANDLES, UPDATE WORKS
CREATE TRIGGER trgAfterDeleteStore ON [dbo].[Store] 
AFTER DELETE
AS
	declare @storeid int;

	select @storeid=d.StoreID from deleted d;	

	DELETE FROM PhoneNumber
	WHERE StoreID = @storeid

	DELETE FROM EmailAddress
	WHERE StoreID = @storeid

	UPDATE Handles
	SET StoreID = 1
	WHERE StoreID = @storeid

	UPDATE Works
	SET StoreID = 1
	WHERE StoreID = @storeid

GO

--INSERT STORE -> INSERT PHONENUMBER, INSERT EMAILADDRESS
CREATE TRIGGER trgAfterInsertStore ON [dbo].[Store] 
AFTER INSERT
AS
	declare @storeid int;

	select @storeid=i.StoreID from inserted i;	

	INSERT INTO PhoneNumber(StoreID,PhoneNumber)
	VALUES (@storeid,2102222222)

	INSERT INTO EmailAddress(StoreID,Email)
	VALUES (@storeid,'newRent@store.gr')

GO


