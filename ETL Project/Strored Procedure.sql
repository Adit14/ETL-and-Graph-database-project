USE [CA_DW]
GO

/****** Object:  StoredProcedure [dbo].[CAQueryReport2]    Script Date: 13-04-2020 10:09:46 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[CAQueryReport2]
AS
select productLine, CustomerCountry,ProductName, count(productLine) as NoOfProducts from Product_Dim PD, Customer_Dim CD, Sales_Fact SF
where PD.ProductKey=SF.ProductKey and CD.CustomerKey=SF.CustomerKey group by CustomerCountry,productLine,ProductName
GO

USE [CA_DW]
GO

/****** Object:  StoredProcedure [dbo].[CAQueryReport1]    Script Date: 13-04-2020 10:10:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[CAQueryReport1]
AS
select employeeID, EmployeeFirstName,EmployeeLastName,sum(SalesByEmplyee) as SalesByEmployee,sum(UnitsSoldByEmployee) as UnitsSoldByEmployee,OfficeCity
from Employee_Dim ED, Employee_Fact EF where ED.EmployeeKey=EF.EmployeeKey 
group by EmployeeID, EmployeeFirstName,EmployeeLastName,OfficeCity
GO

USE [CA_DW]
GO

/****** Object:  StoredProcedure [dbo].[CAQueryReport3]    Script Date: 13-04-2020 10:10:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROC [dbo].[CAQueryReport3]
AS
select productLine,ProductVendorName,Year_,sum(UnitsSold) as NumberofUnitsSold from Product_Dim PD, Calendar_Dim CD, Sales_Fact SF 
where PD.ProductKey=SF.ProductKey and CD.CalendarKey=SF.CalendarKey group by productLine,ProductVendorName,Year_
GO

USE [CA_DW]
GO

/****** Object:  StoredProcedure [dbo].[CAQueryReport4]    Script Date: 13-04-2020 10:10:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

Create PROC [dbo].[CAQueryReport4]
AS
Select CustomerId,sum(RevenueGenerated) RevenueGenerated,Year_,CustomerCountry,Customername from Customer_Dim CD,Sales_Fact SF,Calendar_Dim CAD
where CD.CustomerKey=SF.CustomerKey and CAD.CalendarKey=SF.CalendarKey group by CustomerId,Year_,CustomerCountry,CustomerName
GO


