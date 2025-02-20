-- -----------------------------------------------------
-- Names: Alyshia Benson
-- Group Number: 141
-- Project Title: Westside Auto Parts Sales Management System
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Find an individual customer, colon : character is used to denote variables
-- Not currently in use after the UI changes
-- -----------------------------------------------------
SELECT * FROM Customers WHERE customer_id = :customer_id;

-- -----------------------------------------------------
-- Return all customers
-- -----------------------------------------------------
SELECT * FROM Customers;

-- -----------------------------------------------------
-- Create a new customer, colon : character is used to denote variables
-- -----------------------------------------------------
INSERT INTO Customers (first_name, last_name, email, address, phone)
VALUES (:first_nameInput, :last_nameInput, :emailInput, :addressInput, :phoneInput);

-- -----------------------------------------------------
-- Update a customer, colon : character is used to denote variables
-- -----------------------------------------------------
UPDATE Customers 
SET first_name = :first_nameInput, last_name = :last_nameInput, email = :emailInput, address = :addressInput, phone = :phoneInput
WHERE customer_id = :customer_id;

-- -----------------------------------------------------
-- Delete a customer, colon : character is used to denote variables
-- Not in use after UI changes
-- -----------------------------------------------------
DELETE FROM Customers WHERE customer_id = :customer_id;

-- -----------------------------------------------------
-- Return all orders for an individual customer, colon : character is used to denote variables
-- -----------------------------------------------------
SELECT * FROM Orders WHERE customer_id = :customer_id;

-- -----------------------------------------------------
-- Return all order details for an individual order, colon : character is used to denote variables
-- -----------------------------------------------------
SELECT * FROM Order_Details WHERE order_id = :order_id;

-- -----------------------------------------------------
-- Delete an order, colon : character is used to denote variables
-- -----------------------------------------------------
DELETE FROM Orders WHERE order_id = :order_id;

-- -----------------------------------------------------
-- Find an individual order, colon : character is used to denote variables
-- -----------------------------------------------------
SELECT * FROM Orders WHERE order_id = :order_id;

-- -----------------------------------------------------
-- Return all orders
-- -----------------------------------------------------
SELECT * FROM Orders;

-- -----------------------------------------------------
-- Find an individual product, colon : character is used to denote variables
-- -----------------------------------------------------
SELECT * FROM Products WHERE product_id = :product_id;

-- -----------------------------------------------------
-- Return all products
-- -----------------------------------------------------
SELECT * FROM Products;

-- -----------------------------------------------------
-- Return all product inventory
-- -----------------------------------------------------
SELECT * FROM Inventory;

-- -----------------------------------------------------
-- Find an individual product's inventory, colon : character is used to denote variables
-- -----------------------------------------------------
SELECT * FROM Inventory WHERE product_id = :product_id;

-- -----------------------------------------------------
-- Create a new product, colon : character is used to denote variables
-- -----------------------------------------------------
INSERT INTO Products (name, description, msrp, wholesale_cost)
VALUES (:nameInput, :descriptionInput, :msrpInput, :wholesale_costInput);

-- -----------------------------------------------------
-- Update a product, colon : character is used to denote variables
-- -----------------------------------------------------
UPDATE Products 
SET name = :nameInput, description = :descriptionInput, msrp = :msrpInput, wholesale_cost = :costInput
WHERE product_id = :product_id;

-- -----------------------------------------------------
-- Delete a product, colon : character is used to denote variables
-- -----------------------------------------------------
DELETE FROM Products WHERE product_id = :product_id;