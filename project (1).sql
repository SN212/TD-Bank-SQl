create database newscript;
use newscript;

CREATE TABLE Feed_1 (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    price_per_unit DECIMAL(10, 2),
    total_price DECIMAL(10, 2),
    order_status VARCHAR(20),
    payment_method VARCHAR(20),
    order_date DATE,
    shipping_address VARCHAR(100)
);

INSERT INTO Feed_1 (customer_id, product_id, quantity, price_per_unit, total_price, order_status, payment_method, order_date, shipping_address)
VALUES

(201, 301, 2, 40.00, 80.00, 'Shipped', 'Credit Card', '2025-07-10', '123 Main St'),
(202, 302, 1, 60.00, 60.00, 'Delivered', 'UPI', '2025-07-11', '456 Elm St'),
(203, 303, 3, 20.00, 60.00, 'Pending', 'PayPal', '2025-07-12', '789 Oak St'),
(201, 301, 2, 40.00, 80.00, 'Shipped', 'Credit Card', '2025-07-10', '123 Main St'),
(202, 302, 1, 60.00, 60.00, 'Delivered', 'UPI', '2025-07-11', '456 Elm St'),
(204, 304, 1, 100.00, 100.00, 'Shipped', 'Cash', '2025-07-13', '321 Pine St'),
(205, 305, 2, 25.00, 50.00, 'Delivered', 'Credit Card', '2025-07-14', '654 Cedar St'),
(203, 303, 3, 20.00, 60.00, 'Pending', 'PayPal', '2025-07-12', '789 Oak St'),
(206, 306, 1, 70.00, 70.00, 'Cancelled', 'PayPal', '2025-07-15', '999 Walnut St'),
(207, 307, 2, 30.00, 60.00, 'Shipped', 'UPI', '2025-07-16', '888 Maple St');

CREATE TABLE Feed_2 (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10),country VARCHAR(50),
    dob DATE,
    gender VARCHAR(10),created_at DATE,
    updated_at DATE,
    status VARCHAR(20)
);

INSERT INTO Feed_2 (first_name, last_name, email, phone, address, city, state, zip_code, country, dob, gender, created_at, updated_at, status)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Maple St', 'New York', 'NY', '10001', 'USA', '1985-05-15', 'Male', '2025-01-01', '2025-07-01', 'Active'),
('Jane', 'Smith', 'jane.smith@example.com', '2345678901', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA', '1990-08-20', 'Female', '2025-01-02', '2025-07-02', 'Active'),
('Alice', 'Johnson', 'alice.j@example.com', '3456789012', '789 Pine St', 'Chicago', 'IL', '60601', 'USA', '1988-12-05', 'Female', '2025-01-03', '2025-07-03', 'Inactive'),
('Bob', 'Brown', 'bob.brown@example.com', '4567890123', '321 Elm St', 'Houston', 'TX', '77001', 'USA', '1979-03-22', 'Male', '2025-01-04', '2025-07-04', 'Active'),
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Maple St', 'New York', 'NY', '10001', 'USA', '1985-05-15', 'Male', '2025-01-01', '2025-07-01', 'Active'),
('Emma', 'Williams', 'emma.w@example.com', '5678901234', '654 Cedar St', 'Phoenix', 'AZ', '85001', 'USA', '1992-11-11', 'Female', '2025-01-05', '2025-07-05', 'Active'),
('David', 'Miller', 'david.m@example.com', '6789012345', '987 Birch St', 'Philadelphia', 'PA', '19019', 'USA', '1983-06-30', 'Male', '2025-01-06', '2025-07-06', 'Inactive'),
('Sarah', 'Davis', 'sarah.d@example.com', '7890123456', '111 Spruce St', 'San Antonio', 'TX', '78201', 'USA', '1995-09-09', 'Female', '2025-01-07', '2025-07-07', 'Active'),
('Mike', 'Wilson', 'mike.w@example.com', '8901234567', '222 Palm St', 'San Diego', 'CA', '92101', 'USA', '1987-04-17', 'Male', '2025-01-08', '2025-07-08', 'Active'),
('Jane', 'Smith', 'jane.smith@example.com', '2345678901', '456 Oak St', 'Los Angeles', 'CA', '90001', 'USA', '1990-08-20', 'Female', '2025-01-02', '2025-07-02', 'Active'),
('Chris', 'Taylor', 'chris.t@example.com', '9012345678', '333 Willow St', 'Dallas', 'TX', '75201', 'USA', '1986-02-14', 'Male', '2025-01-09', '2025-07-09', 'Active'),
('Olivia', 'Anderson', 'olivia.a@example.com', '0123456789', '444 Redwood St', 'San Jose', 'CA', '95101', 'USA', '1993-07-21', 'Female', '2025-01-10', '2025-07-10', 'Inactive'),
('James', 'Thomas', 'james.t@example.com', '1123456789', '555 Chestnut St', 'Austin', 'TX', '73301', 'USA', '1981-10-10', 'Male', '2025-01-11', '2025-07-11', 'Active'),
('Emily', 'Moore', 'emily.m@example.com', '1223456789', '666 Cypress St', 'Jacksonville', 'FL', '32099', 'USA', '1989-01-01', 'Female', '2025-01-12', '2025-07-12', 'Active'),
('Alice', 'Johnson', 'alice.j@example.com', '3456789012', '789 Pine St', 'Chicago', 'IL', '60601', 'USA', '1988-12-05', 'Female', '2025-01-03', '2025-07-03', 'Inactive');


CREATE TABLE feed_3 (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    quantity INT,
    category VARCHAR(50),
    brand VARCHAR(50),
    sku VARCHAR(50),
    weight DECIMAL(6,2),dimensions VARCHAR(50),
    color VARCHAR(30),
    material VARCHAR(50),
    warranty_period VARCHAR(30),rating DECIMAL(2,1),
    num_reviews INT,
    origin_country VARCHAR(50),
    release_date DATE,
    created_at DATE,
    updated_at DATE,
    status VARCHAR(20)
);


INSERT INTO feed_3 (
    product_name, description, price, quantity, category, brand, sku, weight, dimensions,
    color, material, warranty_period, rating, num_reviews, origin_country, release_date,
    created_at, updated_at, status
) VALUES
('Wireless Mouse', 'Ergonomic mouse with USB receiver', 25.99, 150, 'Electronics', 'Logitech', 'M185-BLK', 0.10, '4x2x1 in', 'Black', 'Plastic', '1 year', 4.5, 245, 'China', '2024-03-01', '2025-01-01', '2025-07-01', 'Active'),
('Mechanical Keyboard', 'RGB backlit keyboard', 89.99, 80, 'Electronics', 'Corsair', 'K68-RGB', 1.20, '17x5x1.5 in', 'Black', 'Aluminum', '2 years', 4.8, 530, 'Taiwan', '2024-04-10', '2025-01-02', '2025-07-02', 'Active'),
('USB-C Charger', 'Fast wall charger', 19.99, 200, 'Accessories', 'Anker', 'A2133', 0.20, '2x2x1 in', 'White', 'Plastic', '18 months', 4.6, 310, 'Vietnam', '2023-12-01', '2025-01-03', '2025-07-03', 'Active'),
('Bluetooth Speaker', 'Portable speaker', 45.50, 60, 'Audio', 'JBL', 'Flip5-BLK', 0.55, '7x3x3 in', 'Black', 'Rubber', '1 year', 4.7, 760, 'China', '2023-11-15', '2025-01-04', '2025-07-04', 'Active'),
('Gaming Headset', 'Surround headset', 59.99, 75, 'Audio', 'Razer', 'Kraken-X', 0.45, '6x7x3 in', 'Green', 'Plastic', '2 years', 4.3, 650, 'China', '2023-10-01', '2025-01-05', '2025-07-05', 'Active'),
('Laptop Stand', 'Adjustable aluminum stand', 34.99, 120, 'Office', 'Nulaxy', 'NX-LS07', 1.00, '11x10x2 in', 'Silver', 'Aluminum', '1 year', 4.4, 310, 'USA', '2023-08-20', '2025-01-06', '2025-07-06', 'Inactive'),
('Smart Watch', 'Fitness watch with heart rate monitor', 129.99, 95, 'Wearables', 'Fitbit', 'Versa3', 0.30, '1.5x1.5x0.5 in', 'Black', 'Metal', '2 years', 4.2, 840, 'Malaysia', '2023-09-25', '2025-01-07', '2025-07-07', 'Active'),
('Wireless Mouse', 'Ergonomic mouse with USB receiver', 25.99, 150, 'Electronics', 'Logitech', 'M185-BLK', 0.10, '4x2x1 in', 'Black', 'Plastic', '1 year', 4.5, 245, 'China', '2024-03-01', '2025-01-01', '2025-07-01', 'Active'), 
('Noise Cancelling Earbuds', 'Wireless earbuds with ANC', 79.99, 100, 'Audio', 'Sony', 'WF-1000XM4', 0.15, '2x2x1 in', 'Black', 'Plastic', '1 year', 4.9, 980, 'Japan', '2023-11-11', '2025-01-08', '2025-07-08', 'Active'),
('Webcam', '1080p HD webcam', 39.99, 50, 'Electronics', 'Logitech', 'C920', 0.25, '3x1x1 in', 'Black', 'Plastic', '2 years', 4.6, 670, 'China', '2024-01-15', '2025-01-09', '2025-07-09', 'Active'),
('External Hard Drive', '1TB USB 3.0 HDD', 64.99, 70, 'Storage', 'Seagate', 'STEA1000400', 0.50, '5x3x0.5 in', 'Black', 'Plastic', '1 year', 4.4, 490, 'Thailand', '2023-10-10', '2025-01-10', '2025-07-10', 'Active'),
('Laptop Backpack', 'Water-resistant with USB port', 49.99, 60, 'Bags', 'Samsonite', 'Tectonic-Lifestyle', 2.00, '18x12x6 in', 'Gray', 'Nylon', '3 years', 4.5, 320, 'USA', '2023-09-12', '2025-01-11', '2025-07-11', 'Inactive'),
('Mechanical Keyboard', 'RGB backlit keyboard', 89.99, 80, 'Electronics', 'Corsair', 'K68-RGB', 1.20, '17x5x1.5 in', 'Black', 'Aluminum', '2 years', 4.8, 530, 'Taiwan', '2024-04-10', '2025-01-02', '2025-07-02', 'Active'),
('Graphic Tablet', 'Digital drawing tablet with stylus', 99.00, 30, 'Art Supplies', 'Wacom', 'Intuos S', 0.40, '8x6x0.5 in', 'Black', 'Plastic', '1 year', 4.7, 230, 'Japan', '2023-08-30', '2025-01-12', '2025-07-12', 'Active'),
('HDMI Cable', 'High-speed 6ft cable', 12.99, 180, 'Accessories', 'AmazonBasics', 'HDMI-6FT', 0.15, '6x0.5x0.5 in', 'Black', 'Copper', '1 year', 4.6, 540, 'India', '2023-11-03', '2025-01-13', '2025-07-13', 'Active'),
('Bluetooth Speaker', 'Portable speaker', 45.50, 60, 'Audio', 'JBL', 'Flip5-BLK', 0.55, '7x3x3 in', 'Black', 'Rubber', '1 year', 4.7, 760, 'China', '2023-11-15', '2025-01-04', '2025-07-04', 'Active'), 
('Smartphone Tripod', 'Adjustable tripod for phones', 29.99, 90, 'Accessories', 'UBeesize', 'TR50', 1.10, '15x3x3 in', 'Black', 'Aluminum', '6 months', 4.3, 180, 'Vietnam', '2023-06-01', '2025-01-14', '2025-07-14', 'Active'),
('Portable SSD', '500GB USB-C SSD', 109.99, 40, 'Storage', 'Samsung', 'T7-500GB', 0.20, '3x2x0.5 in', 'Gray', 'Metal', '3 years', 4.9, 910, 'South Korea', '2023-12-15', '2025-01-15', '2025-07-15', 'Active'),
('Wireless Charger', 'Qi wireless pad', 22.99, 130, 'Accessories', 'Belkin', 'BOOSTUP-15W', 0.18, '4x4x0.5 in', 'White', 'Plastic', '1 year', 4.5, 270, 'China', '2023-11-29', '2025-01-16', '2025-07-16', 'Active'),
('Gaming Headset', 'Surround headset', 59.99, 75, 'Audio', 'Razer', 'Kraken-X', 0.45, '6x7x3 in', 'Green', 'Plastic', '2 years', 4.3, 650, 'China', '2023-10-01', '2025-01-05', '2025-07-05', 'Active');

### REQ2
DELIMITER $$

CREATE PROCEDURE populate_feed_1(IN row_count INT)
BEGIN
    DECLARE i INT DEFAULT 0
    WHILE i < row_count DO
        INSERT INTO Feed_1 ...;
        SET i = i + 1;
END$$

DELIMITER ;


DELIMITER $$


CREATE PROCEDURE populate_feed_1(IN row_count INT)
BEGIN
  DECLARE i INT DEFAULT 0;
  WHILE i < row_count DO
    INSERT INTO Feed_1 (
      customer_id, product_id, quantity, price_per_unit, total_price,
      order_status, payment_method, order_date, shipping_address
    ) VALUES (
      FLOOR(200 + RAND()*10),             
      FLOOR(300 + RAND()*10),            
      FLOOR(1 + RAND()*5),               
      ROUND(10 + RAND()*90,2),          
      ROUND(10 + RAND()*450,2),         
      ELT(FLOOR(1+RAND()*4),'Pending','Shipped','Delivered','Cancelled'),
      ELT(FLOOR(1+RAND()*3),'Credit Card','UPI','PayPal'),
      CURDATE() - INTERVAL FLOOR(RAND()*100) DAY,
      CONCAT('Street ', FLOOR(RAND()*1000))
    );
    SET i = i + 1;
  END WHILE;
END$$

DELIMITER ;


##REQ3

SELECT customer_id, product_id, quantity, price_per_unit, COUNT(*)
FROM Feed_1
GROUP BY customer_id;

SELECT customer_id, product_id, quantity, price_per_unit, total_price, order_status, payment_method, order_date, shipping_address,
  COUNT(*) FROM Feed_1
GROUP BY customer_id, product_id, quantity, price_per_unit, total_price, order_status, payment_method, order_date, shipping_address
HAVING COUNT(*) > 1;


SELECT
  first_name, last_name, email, phone, address, city, state, zip_code, country, dob, gender, created_at, updated_at, status,
  COUNT(*) FROM Feed_2
GROUP BY first_name, last_name, email, phone, address, city, state, zip_code, country, dob, gender, created_at, updated_at, status
HAVING COUNT(*) > 1;


SELECT 
  product_name, description, price, quantity, category, brand, sku, weight, dimensions, color, material, warranty_period, rating, num_reviews, origin_country, release_date, created_at, updated_at, status,
  COUNT(*)
FROM Feed_3
GROUP BY product_name, description, price, quantity, category, brand, sku, weight, dimensions, color, material, warranty_period, rating, num_reviews, origin_country, release_date, created_at, updated_at, status
HAVING COUNT(*) > 1;

##REQ4
SELECT customer_id, product_id, quantity, price_per_unit, total_price, order_status, payment_method, order_date, shipping_address, COUNT(*)
FROM Feed_1
GROUP BY customer_id, product_id, quantity, price_per_unit, total_price, order_status, payment_method, order_date, shipping_address
HAVING COUNT(*) > 1 INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/feed1_duplicates1.csv';

SELECT first_name, last_name, email, phone, address, city, state, zip_code, country, dob, gender, created_at, updated_at, status, COUNT(*)
FROM Feed_2
GROUP BY first_name, last_name, email, phone, address, city, state, zip_code, country, dob, gender, created_at, updated_at, status
HAVING COUNT(*) > 1 INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/feed2_duplicates2.csv';

##REQ5
DELETE FROM Feed_1
WHERE order_id NOT IN ( SELECT MIN(order_id) FROM Feed_1 GROUP BY customer_id, product_id, quantity
);

DELETE f1
FROM Feed_1 f1
JOIN Feed_1 f2 ON f1.customer_id = f2.customer_id
  AND f1.product_id = f2.product_id
  AND f1.order_id > f2.order_id;

DELETE f1
FROM Feed_2 f1
JOIN Feed_2 f2 ON f1.first_name = f2.first_name AND f1.last_name = f2.last_name
  AND f1.email = f2.email
  AND f1.phone = f2.phone AND f1.email > f2.email;

DELETE f1
FROM Feed_3 f1
JOIN Feed_3 f2 ON f1.product_name = f2.product_name
  AND f1.description = f2.description;
  
  DELETE f1
FROM Feed_1 f1
JOIN Feed_1 f2
  ON f1.customer_id     = f2.customer_id
  AND f1.product_id     = f2.product_id AND f1.quantity       = f2.quantity
  AND f1.price_per_unit = f2.price_per_unit AND f1.total_price    = f2.total_price
  AND f1.order_status   = f2.order_status
  AND f1.payment_method = f2.payment_method AND f1.order_date     = f2.order_date
  AND f1.shipping_address = f2.shipping_address AND f1.order_id > f2.order_id;
  

DELETE f1
FROM Feed_2 f1
JOIN Feed_2 f2
  ON f1.first_name = f2.first_name AND f1.last_name = f2.last_name
  AND f1.email     = f2.email
  AND f1.phone     = f2.phone
  AND f1.address   = f2.address
  AND f1.city      = f2.city AND f1.state     = f2.state
  AND f1.zip_code  = f2.zip_code
  AND f1.country   = f2.country
  AND f1.dob       = f2.dob
  AND f1.gender    = f2.gender AND f1.created_at= f2.created_at
  AND f1.updated_at= f2.updated_at
  AND f1.status    = f2.status AND f1.customer_id > f2.customer_id;

DELETE f1
FROM Feed_3 f1
JOIN Feed_3 f2
  ON f1.product_name    = f2.product_name
  AND f1.description    = f2.description
  AND f1.price          = f2.price
  AND f1.quantity       = f2.quantity
  AND f1.category       = f2.category AND f1.brand          = f2.brand
  AND f1.sku            = f2.sku
  AND f1.weight         = f2.weight
  AND f1.dimensions     = f2.dimensions
  AND f1.color          = f2.color
  AND f1.material       = f2.material AND f1.warranty_period= f2.warranty_period
  AND f1.rating         = f2.rating
  AND f1.num_reviews    = f2.num_reviews
  AND f1.origin_country = f2.origin_country
  AND f1.release_date   = f2.release_date
  AND f1.created_at     = f2.created_at
  AND f1.updated_at     = f2.updated_at
  AND f1.status         = f2.status
  AND f1.product_id > f2.product_id;

##REQ6
SELECT * FROM (
  SELECT customer_id, product_id, quantity, price_per_unit, total_price, order_status, payment_method, order_date, shipping_address,
         COUNT(*) AS cnt FROM Feed_1 GROUP BY customer_id, product_id, quantity, price_per_unit, total_price, order_status, payment_method, order_date, shipping_address
) AS sub WHERE cnt > 1;


SELECT * FROM (
  SELECT first_name, last_name, email, phone, address, city, state, zip_code, country, dob, gender, created_at, updated_at, status,
         COUNT(*) AS cnt FROM Feed_2
  GROUP BY first_name, last_name, email, phone, address, city, state, zip_code, country, dob, gender, created_at, updated_at, status
) AS sub WHERE cnt > 1;


SELECT *
FROM (SELECT product_name, description, price, quantity, category, brand, sku, weight, dimensions, color, material, warranty_period, rating, num_reviews, origin_country, release_date, created_at, updated_at, status,
         COUNT(*) AS cnt FROM Feed_3 GROUP BY product_name, description, price, quantity, category, brand, sku, weight, dimensions, color, material, warranty_period, rating, num_reviews, origin_country, release_date, created_at, updated_at, status
) AS sub
WHERE cnt > 1;

##REQ7
SELECT 
    f1.order_id,
    f1.customer_id,
    f2.first_name,
    f2.last_name,
    f1.product_id,
    f3.product_name,
    f1.quantity,
    f1.total_price
FROM Feed_1 f1
LEFT JOIN Feed_2 f2 
    ON f1.customer_id = f2.customer_id
LEFT JOIN Feed_3 f3
    ON f1.product_id = f3.product_id

SELECT f1.*
FROM Feed_1 f1
LEFT JOIN Feed_2 f2 
    ON f1.customer_id = f2.customer_id
WHERE f2.customer_id IS NULL;

SELECT f1.*
FROM Feed_1 f1
LEFT JOIN Feed_3 f3
    ON f1.product_id = f3.product_id
WHERE f3.product_id IS NULL;
	
SELECT 
    f1.order_id,
    f1.customer_id,
    f2.first_name,
    f2.last_name,
    f1.product_id,
    f3.product_name,
    f1.quantity,
    f1.total_price FROM Feed_1 f1
LEFT JOIN Feed_2 f2 ON f1.customer_id = f2.customer_id
LEFT JOIN Feed_3 f3 ON f1.product_id = f3.product_id;

SELECT f1.*
FROM Feed_1 f1
LEFT JOIN Feed_2 f2 
    ON f1.customer_id = f2.customer_id
WHERE f2.customer_id IS NULL;

SELECT f1.*
FROM Feed_1 f1
LEFT JOIN Feed_3 f3
    ON f1.product_id = f3.product_id
WHERE f3.product_id IS NULL;
