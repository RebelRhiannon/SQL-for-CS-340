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
-- Not in use after UI changes
-- -----------------------------------------------------
SELECT * FROM Orders WHERE customer_id = :customer_id;

-- -----------------------------------------------------
-- Return all order details for an individual order, colon : character is used to denote variables
-- Not in use after UI changes
-- -----------------------------------------------------
SELECT * FROM Order_Details WHERE order_id = :order_id;

-- -----------------------------------------------------
-- Delete an order, colon : character is used to denote variables
-- Not in use after UI changes
-- -----------------------------------------------------
DELETE FROM Orders WHERE order_id = :order_id;

-- -----------------------------------------------------
-- Find an individual order, colon : character is used to denote variables
-- Not in use after UI changes
-- -----------------------------------------------------
SELECT * FROM Orders WHERE order_id = :order_id;

-- -----------------------------------------------------
-- Return all orders
-- -----------------------------------------------------
SELECT * FROM Orders;

-- -----------------------------------------------------
-- Insert into orders
-- -----------------------------------------------------
INSERT INTO Orders (order_date, order_total, customer_id, sales_rep_id)
VALUES (:order_dateInput, :order_totalInput, :customer_idInput, :sales_rep_idInput);

-- -----------------------------------------------------
-- Used to populate drop down Customer ID menu in Create Orders
-- -----------------------------------------------------
SELECT customer_id FROM Customer

-- -----------------------------------------------------
-- Used to populate drop down Sales Rep ID menu in Create Orders
-- -----------------------------------------------------
SELECT sales_rep_id FROM Sales_Reps

-- -----------------------------------------------------
-- View all Order Details
-- -----------------------------------------------------
SELECT * FROM Order_Details;

-- -----------------------------------------------------
-- Insert into Order Details
-- -----------------------------------------------------
INSERT INTO Order_Details (order_id, product_id, quantity, unit_price, line_total)
VALUES (:order_idInput, :product_idInput, :quantityInput, :unit_priceInput, :line_totalInput);

-- -----------------------------------------------------
-- Delete an Order Detail
-- -----------------------------------------------------
DELETE FROM Order_Details WHERE order_details_id = :order_details_id;

-- -----------------------------------------------------
-- Edit an Order Detail
-- -----------------------------------------------------
UPDATE Order_Details 
SET order_id = :order_idInput, product_id = :product_idInput, quantity = :quantityInput, unit_price = :unit_priceInput, line_total = :line_totalInput
WHERE order_details_id = :order_details_id;

-- -----------------------------------------------------
-- Used to populate drop down Order ID for Create/Edit Order Details
-- -----------------------------------------------------
SELECT order_id FROM Orders

-- -----------------------------------------------------
-- Used to populate drop down Product ID for Create/Edit Order Details
-- -----------------------------------------------------
SELECT product_id from Product

-- -----------------------------------------------------
-- -----------------------------------------------------
-- Find an individual product, colon : character is used to denote variables
-- Not in use after UI changes
-- -----------------------------------------------------
SELECT * FROM Products WHERE product_id = :product_id;

-- -----------------------------------------------------
-- Return all products
-- -----------------------------------------------------
SELECT * FROM Products;

-- -----------------------------------------------------
-- Return all inventory
-- -----------------------------------------------------
SELECT * FROM Inventory;

-- -----------------------------------------------------
-- Insert into Inventory
-- -----------------------------------------------------
INSERT INTO Inventory (product_id, warehouse, quantity)
VALUES (:product_idInput, :warehouseInput, :quantityInput);

-- -----------------------------------------------------
-- Find an individual product's inventory, colon : character is used to denote variables
-- Not in use after UI changes
-- -----------------------------------------------------
SELECT * FROM Inventory WHERE product_id = :product_id;

-- -----------------------------------------------------
-- Create a new product, colon : character is used to denote variables
-- -----------------------------------------------------
INSERT INTO Products (name, description, msrp, wholesale_cost)
VALUES (:nameInput, :descriptionInput, :msrpInput, :wholesale_costInput);

-- -----------------------------------------------------
-- Update a product, colon : character is used to denote variables
-- Not in use after UI changes
-- -----------------------------------------------------
UPDATE Products 
SET name = :nameInput, description = :descriptionInput, msrp = :msrpInput, wholesale_cost = :costInput
WHERE product_id = :product_id;

-- -----------------------------------------------------
-- Delete a product, colon : character is used to denote variables
-- Not in use after UI changes
-- -----------------------------------------------------
DELETE FROM Products WHERE product_id = :product_id;