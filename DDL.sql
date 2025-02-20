-- -----------------------------------------------------
-- Names: Alyshia Benson
-- Group Number: 141
-- Project Title: Westside Auto Parts Sales Management System
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Disable foreign key checks and commits
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

-- -----------------------------------------------------
-- Drop all tables if they exist
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Customers`,`Sales_Reps`,`Orders`,`Products`,`Order_Details`,`Inventory`;

-- -----------------------------------------------------
-- Create table `Customers`
-- -----------------------------------------------------
CREATE TABLE `Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(200) NOT NULL,
  `phone` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) VISIBLE);

-- -----------------------------------------------------
-- Create table `Sales_Reps`
-- -----------------------------------------------------
CREATE TABLE `Sales_Reps` (
  `sales_rep_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sales_rep_id`),
  UNIQUE INDEX `sales_rep_id_UNIQUE` (`sales_rep_id` ASC) VISIBLE);

-- -----------------------------------------------------
-- Create table `Orders`
-- -----------------------------------------------------
CREATE TABLE `Orders` (
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `order_date` DATETIME NOT NULL,
  `order_total` DECIMAL(10,2) NOT NULL,
  `customer_id` INT NOT NULL,
  `sales_rep_id` INT NULL,
  PRIMARY KEY (`order_id`, `customer_id`),
  INDEX `fk_Orders_customers1_idx` (`customer_id` ASC) VISIBLE,
  INDEX `fk_Orders_Sales_Reps1_idx` (`sales_rep_id` ASC) VISIBLE,
  UNIQUE INDEX `order_id_UNIQUE` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Customers` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_Sales_Reps1`
    FOREIGN KEY (`sales_rep_id`)
    REFERENCES `Sales_Reps` (`sales_rep_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Create table `Products`
-- -----------------------------------------------------
CREATE TABLE `Products` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NULL,
  `MSRP` DECIMAL(10,2) NOT NULL,
  `wholesale_cost` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE INDEX `product_id_UNIQUE` (`product_id` ASC) VISIBLE);

-- -----------------------------------------------------
-- Create table `Order_Details`
-- -----------------------------------------------------
CREATE TABLE `Order_Details` (
  `order_details_id` INT NOT NULL AUTO_INCREMENT,
  `order_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  `unit_price` DECIMAL(10,2) NOT NULL,
  `line_total` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`order_details_id`, `order_id`, `product_id`),
  INDEX `fk_Orders_has_products_products1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_Orders_has_products_orders1_idx` (`order_id` ASC) VISIBLE,
  UNIQUE INDEX `order_details_id_UNIQUE` (`order_details_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_has_products_orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `Orders` (`order_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orders_has_products_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `Products` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Create table `Inventory`
-- -----------------------------------------------------
CREATE TABLE `Inventory` (
  `inventory_line_id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `warehouse` VARCHAR(45) NOT NULL,
  `quantity` INT NOT NULL,
  PRIMARY KEY (`inventory_line_id`, `product_id`),
  INDEX `fk_Inventory_products1_idx` (`product_id` ASC) VISIBLE,
  UNIQUE INDEX `inventory_line_id_UNIQUE` (`inventory_line_id` ASC) VISIBLE,
  CONSTRAINT `quantity`
    CHECK (`quantity` >= 0),
  CONSTRAINT `fk_Inventory_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `Products` (`product_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Insert sample Customer data
-- -----------------------------------------------------
INSERT INTO Customers (email, first_name, last_name, address, phone)
VALUES ('jane@gmail.com', 'Jane', 'Smith', '1443 Main St Los Angeles CA 94534', '310-225-5878'),
('john@gmail.com', 'John', 'Robertson', '4642 1st St Corvallis OR 97331', '541-547-5568'),
('mary@hotmail.com', 'Mary', 'Jackson', '3867 Hope St Seattle WA 98309', '206-884-2345');

-- -----------------------------------------------------
-- Insert sample Sales Rep data
-- -----------------------------------------------------
INSERT INTO Sales_Reps (email, first_name, last_name)
VALUES ('mark@autosales.com', 'Mark', 'Robinson'),
('sally@autosales.com', 'Sally', 'Davis'),
('steve@autosales.com', 'Steve', 'Jefferson');

-- -----------------------------------------------------
-- Insert sample Product data
-- -----------------------------------------------------
INSERT INTO Products (name, description, MSRP, wholesale_cost)
VALUES ('Goodyear Tire', 'Single P225 70R16 Goodyear tire', 149.99, 89.99),
('Magnaflow Catalytic Converter', 'Magnaflow catalytic converter for Toyota Camry vehicles', 1299.99, 599.99),
('Brembo Brake Caliper Set', 'Two front Red Brembo brake calipers for Porsche 911 vehicles', 3699.99, 2199.99);

-- -----------------------------------------------------
-- Insert sample Inventory data
-- -----------------------------------------------------
INSERT INTO Inventory (product_id, warehouse, quantity)
VALUES (1, 'AW4', 100),
(2, 'AW4', 500),
(3, 'AW4', 100);

-- -----------------------------------------------------
-- Insert sample Order data
-- -----------------------------------------------------
INSERT INTO Orders (order_date, order_total, customer_id, sales_rep_id)
VALUES (20240506, 1899.95, 1, 1),
(20240607, 1299.99, 2, NULL),
(20250107, 3699.99, 3, 2);

-- -----------------------------------------------------
-- Insert sample Order Details data
-- -----------------------------------------------------
INSERT INTO Order_Details (order_id, product_id, quantity, unit_price, line_total)
VALUES (1, 1, 4, 149.99, 599.96),
(1, 2, 1, 1299.99, 1299.99),
(2, 2, 1, 1299.99, 1299.99),
(3, 3, 1, 3699.99, 3699.99);

-- -----------------------------------------------------
-- Re-enable foreign key checks and commits
-- -----------------------------------------------------
SET FOREIGN_KEY_CHECKS=1;
COMMIT;