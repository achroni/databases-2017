CREATE DATABASE VEHICLESAE

CREATE TABLE Employee (
    IRSNumber int NOT NULL PRIMARY KEY,
    FirstName varchar(255),
    LastName varchar(255) NOT NULL,
    SSN bigint ,
	DriverLicense varchar(20),
	City varchar(255),
	Street varchar(255),
	StreetNumber int ,
	PostalCode int
);

CREATE TABLE Store (
    StoreID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	City varchar(255),
	Street varchar(255),
	StreetNumber int ,
	PostalCode int
);

CREATE TABLE Vehicle (
	VehicleID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    LicensePlate varchar(50) NOT NULL,
    VehicleType varchar(255),
    Make varchar(255) NOT NULL,
	Model varchar(20),
	CylinderCapacity int,
	HorsePower int,
	FuelType varchar(255),
	VehicleYear int,
	Kilometers int,
	LastService datetime,
	NextService datetime,
	InsurExpDate datetime,
	DamagesDescr varchar(300),
	Malfunctions varchar(300)
);

CREATE TABLE Customers (
    CustomerID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    IRSNumber int,
	FirstName varchar(255),
    LastName varchar(255) NOT NULL,
    SSN bigint ,
	DriverLicense varchar(20),
	FirstRegCity varchar(255),
	Street varchar(255),
	StreetNumber int ,
	PostalCode int
);



CREATE TABLE Works (
	WorkID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    IRSNumber int NOT NULL FOREIGN KEY REFERENCES Employee(IRSNumber), 
	StoreID int NOT NULL FOREIGN KEY REFERENCES Store(StoreID),
	StartDate datetime NOT NULL ,
	FinishDate datetime,
	Position varchar(50)
);

CREATE TABLE Handles (
	HandleID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    StoreID int FOREIGN KEY REFERENCES Store(StoreID),
	VehicleID int FOREIGN KEY REFERENCES Vehicle(VehicleID)
);

CREATE TABLE Reserves (
	ReservationID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    StartDate datetime NOT NULL,
	VehicleID int NOT NULL FOREIGN KEY REFERENCES Vehicle(VehicleID),
    CustomerID int NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID),
	FinishDate datetime,
	StartLocation varchar(255),
	FinishLocation varchar(255),
	Paid int  
	--0=notpaid / 1=paid
);

CREATE TABLE Rents (
	RentID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    StartDate datetime NOT NULL,
	VehicleID int FOREIGN KEY REFERENCES Vehicle(VehicleID),
    CustomerID int NOT NULL FOREIGN KEY REFERENCES Customers(CustomerID),
	IRSNumber int NOT NULL FOREIGN KEY REFERENCES Employee(IRSNumber),
	FinishDate datetime,
	StartLocation varchar(255),
	FinishLocation varchar(255),
	ReturnState varchar(255)
);

CREATE TABLE PhoneNumber (
	ID int NOT NULL  IDENTITY(1,1) PRIMARY KEY,
	StoreID int NOT NULL FOREIGN KEY REFERENCES Store(StoreID),
	PhoneNumber int
);

CREATE TABLE EmailAddress (
	EmailID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
	StoreID int NOT NULL FOREIGN KEY REFERENCES Store(StoreID),
	Email varchar(255)
);


CREATE TABLE PayTransaction (
	PayID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
    StartDate datetime NOT NULL,
	VehicleID int FOREIGN KEY REFERENCES Vehicle(VehicleID),
    PayAmount float,
	PayMethod varchar(50),
	RentID int NOT NULL FOREIGN KEY REFERENCES Rents(RentID)
);