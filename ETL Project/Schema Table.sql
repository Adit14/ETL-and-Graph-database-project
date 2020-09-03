create database CA_DW

use CA_DW

CREATE TABLE Product_Dim
( ProductKey INT NOT NULL IDENTITY,
ProductID VARCHAR(255),
ProductName VARCHAR(255),
productLine VARCHAR(255),
ProductVendorName VARCHAR(255),
PRIMARY KEY (ProductKey));
GO

CREATE TABLE Customer_Dim
(CustomerKey INT NOT NUll IDENTITY,
CustomerID	VARCHAR(255),
CustomerName CHAR(255),
CustomerCountry CHAR(255),
PRIMARY KEY (CustomerKey));
GO

CREATE TABLE Employee_Dim
(EmployeeKey INT NOT NUll IDENTITY,
EmployeeID	INT,
EmployeeFirstName CHAR(255),
EmployeeLastName CHAR(255),
OfficeCode INT,
OfficeCity VARCHAR(255),
OfficeCountry VARCHAR(255),
PRIMARY KEY (EmployeeKey));
GO

CREATE TABLE Calendar_Dim
(
CalendarKey INT NOT NULL IDENTITY,
FullDate DATE,
DayofWeek_ CHAR(255),
DayType CHAR(255),
DayofMonth_ INT,
Month_	CHAR(255),
Quarter_ CHAR(255),
Year_ INT,
PRIMARY KEY (CalendarKey));
GO


GO
CREATE TABLE Sales_Fact
(
CalendarKey INT,
ProductKey INT,
CustomerKey INT,
OrderId VARCHAR(10),
FullDate DATE,
PriceEach INT,
CustomerCreditLimit INT,
UnitsSold INT,
RevenueGenerated INT,
PRIMARY KEY(ProductKey, OrderId),
FOREIGN KEY (Calendarkey) REFERENCES Calendar_Dim (CalendarKey),
FOREIGN KEY (Productkey) REFERENCES Product_Dim (ProductKey),
FOREIGN KEY (CustomerKey) REFERENCES Customer_Dim(CustomerKey)
);

CREATE TABLE Employee_Fact
(
EmployeeKey INT,
CustomerKey INT,
CustomerId INT,
SalesByEmplyee INT,
UnitsSoldByEmployee INT,
PRIMARY KEY(EmployeeKey,CustomerId),
FOREIGN KEY (EmployeeKey) REFERENCES Employee_Dim (EmployeeKey),
FOREIGN KEY (CustomerKey) REFERENCES Customer_Dim(CustomerKey)
);

select * from Employee_Fact order by CustomerKey