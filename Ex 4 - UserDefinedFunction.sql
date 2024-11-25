-- Author: Rikin Shah
-- Course: IFT 530
-- SQL History: Microsoft SQL Server 2012 (SP1) - Created a Stored Procedure Previous History

--------------------------------------------------- Ex 1 -  Script ------------------------------------------
---- Creating a function named fnUnpaidInvoiceID
CREATE FUNCTION fnUnpaidInvoiceID()
RETURNS INT
AS
BEGIN
----- Declare a variable to store the unpaid invoice ID
    DECLARE @UnpaidInvoiceID INT;

---- Selecting the top unpaid invoice ID based on the condition
    SELECT TOP 1 @UnpaidInvoiceID = InvoiceID
    FROM Invoices
    WHERE (InvoiceTotal - PaymentTotal - CreditTotal) > 0
    ORDER BY InvoiceDate;

---- Returning the unpaid invoice ID
    RETURN @UnpaidInvoiceID;
END
------------ To View the Function Run the Below script ------------------------

SELECT VendorName, InvoiceNumber, InvoiceDueDate,
       InvoiceTotal - CreditTotal - PaymentTotal AS Balance
FROM Vendors v
JOIN Invoices i
ON v.VendorID = i.VendorID
WHERE InvoiceID = dbo.fnUnpaidInvoiceID();

--------------------------------------------------- Ex 2 -  Script ------------------------------------------

---- Creating a function named fnDateRange and creating 2 date var

CREATE FUNCTION fnDateRange
(
    @DateMin DATE,
    @DateMax DATE
)
RETURNS TABLE
AS
RETURN
---- Selecting statement to return invoice details within the specified date range
(
    SELECT I.InvoiceNumber, I.InvoiceDate, I.InvoiceTotal,
           (I.InvoiceTotal - I.PaymentTotal - I.CreditTotal) AS Balance
    FROM Invoices AS I
    WHERE I.InvoiceDate BETWEEN @DateMin AND @DateMax
);

------------ To View the Function Run the Below script ------------------------

SELECT InvoiceNumber, InvoiceDate, InvoiceTotal, Balance
FROM dbo.fnDateRange('2022-10-10', '2022-10-20');

--------------------------------------------------- Ex 3 -  Script ------------------------------------------
---- Creating a function named fnDateRange01

CREATE FUNCTION fnDateRange01
(
    @DateMin DATE,
    @DateMax DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT I.VendorID, I.InvoiceNumber, I.InvoiceDate, I.InvoiceTotal,
           (I.InvoiceTotal - I.PaymentTotal - I.CreditTotal) AS Balance
    FROM Invoices AS I
    WHERE I.InvoiceDate BETWEEN @DateMin AND @DateMax
);

------------ To View the Function Run the Below script ------------------------

SELECT V.VendorName, DR.InvoiceNumber, DR.InvoiceDate, DR.InvoiceTotal, DR.Balance
FROM Vendors V
JOIN dbo.fnDateRange01('2022-10-10', '2022-10-20') DR
ON V.VendorID = DR.VendorID;

-----------------------------------------------------END OF SCRIPT ---------------------------------------
