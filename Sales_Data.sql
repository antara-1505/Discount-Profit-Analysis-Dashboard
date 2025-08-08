CREATE DATABASE IF NOT EXISTS Sales_data;
USE Sales_data;
CREATE TABLE Sales_Data (
	Date VARCHAR(50),
    Segment VARCHAR(50),
    City VARCHAR(50),
    Product VARCHAR(50),
    Discount_Band VARCHAR(20),
    Units_Sold FLOAT,
    Manufacturing_Price FLOAT,
    Sale_Price FLOAT,
    Gross_Sales FLOAT,
    Discounts FLOAT,
    Sales_Amt FLOAT
    );
	SELECT * FROM Sales_Data;
ALTER TABLE Sales_Data
ADD COLUMN Id INT AUTO_INCREMENT PRIMARY KEY FIRST; 
ALTER TABLE Sales_Data
ADD COLUMN Order_Date DATE AFTER Id;
UPDATE Sales_Data
SET Order_Date = STR_TO_DATE(Date, '%m-%d-%Y');
ALTER TABLE Sales_Data DROP COLUMN Date;
ALTER TABLE Sales_Data ADD COLUMN Profit FLOAT;
UPDATE Sales_Data 
SET Profit = Sales_Amt - (Units_Sold * Manufacturing_Price);