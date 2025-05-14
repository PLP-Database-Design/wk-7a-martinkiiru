question 1
SELECT OrderID, CustomerName, Product
FROM ProductDetail
CROSS JOIN UNNEST(SPLIT(Products, ',')) AS Product;

question 2
step 1
CREATE TABLE OrderInfo (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert data into OrderInfo table
INSERT INTO OrderInfo (OrderID, CustomerName)
SELECT DISTINCT OrderID, CustomerName
FROM OrderDetails;

step2
CREATE TABLE OrderDetailsNew (
    OrderID INT,
    Product VARCHAR(255),
    Quantity INT,
    PRIMARY KEY (OrderID, Product)
);

-- Insert data into OrderDetailsNew table
INSERT INTO OrderDetailsNew (OrderID, Product, Quantity)
SELECT OrderID, Product, Quantity
FROM OrderDetails;
