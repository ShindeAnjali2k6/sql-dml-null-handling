
-- Create Tables
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) DEFAULT 'unknown@example.com',
    city VARCHAR(50) DEFAULT 'Not Provided'
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Insert Data
INSERT INTO Customers (customer_id, name, email, city) VALUES (1, 'Aditi Sharma', 'aditi@gmail.com', 'Mumbai');
INSERT INTO Customers (customer_id, name, email, city) VALUES (2, 'Rahul Mehta', NULL, 'Delhi');
INSERT INTO Customers (customer_id, name, email, city) VALUES (3, 'Sneha Desai', 'sneha@gmail.com', 'Pune');
INSERT INTO Customers (customer_id, name, email, city) VALUES (4, 'Vikas Rao', 'vikas@gmail.com', NULL);
INSERT INTO Customers (customer_id, name, email, city) VALUES (5, 'Neha Kulkarni', 'neha.k@gmail.com', 'Nagpur');
INSERT INTO Customers (customer_id, name) VALUES (6, 'Aarav Singh'); -- uses default email & city

INSERT INTO Products VALUES (101, 'Laptop', 'Electronics', 55000);
INSERT INTO Products VALUES (102, 'Bluetooth Speaker', 'Electronics', 3000);
INSERT INTO Products VALUES (103, 'Office Chair', NULL, 4500);
INSERT INTO Products VALUES (104, 'Standing Desk', 'Furniture', 11000);

INSERT INTO Orders VALUES (1001, 1, DATE '2025-06-01', 57500);
INSERT INTO Orders VALUES (1002, 2, DATE '2025-06-02', 2500);
INSERT INTO Orders VALUES (1003, 3, DATE '2025-06-03', 4500);
INSERT INTO Orders VALUES (1004, 4, DATE '2025-06-04', NULL);

INSERT INTO OrderDetails VALUES (1, 1001, 101, 1, 55000);
INSERT INTO OrderDetails VALUES (2, 1001, 102, 1, 2500);
INSERT INTO OrderDetails VALUES (3, 1002, 102, 1, 2500);
INSERT INTO OrderDetails VALUES (4, 1003, 103, 1, 4500);
INSERT INTO OrderDetails VALUES (5, 1004, 104, 1, NULL);

-- Update NULL values to defaults
UPDATE Customers SET email = 'unknown@example.com' WHERE email IS NULL;
UPDATE Customers SET city = 'Not Provided' WHERE city IS NULL;
UPDATE Products SET category = 'General' WHERE category IS NULL;
UPDATE Orders SET total_amount = 0 WHERE total_amount IS NULL;

-- Deletion Examples
DELETE FROM OrderDetails WHERE order_id = 1004;
DELETE FROM Orders WHERE customer_id = 4;
DELETE FROM Customers WHERE name = 'Vikas Rao';
DELETE FROM OrderDetails WHERE product_id = 101;
DELETE FROM Products WHERE product_name = 'Laptop';
