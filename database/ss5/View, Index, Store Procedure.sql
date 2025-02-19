-- Bước 1: Tạo cơ sở dữ liệu demo
CREATE DATABASE IF NOT EXISTS demo;
USE demo;

-- Bước 2: Tạo bảng products và chèn dữ liệu 
CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_code VARCHAR(50) UNIQUE,
    product_name VARCHAR(100),
    product_price DECIMAL(10, 2),
    product_amount INT,
    product_description TEXT,
    product_status ENUM('active', 'inactive') DEFAULT 'active'
);

INSERT INTO products (product_code, product_name, product_price, product_amount, product_description, product_status)
VALUES 
('P001', 'iPhone 15', 1000.50, 10, 'Description of iPhone 15', 'active'),
('P002', 'Samsung Galaxy S24', 1200.00, 5, 'Description of Samsung Galaxy S24', 'active'),
('P003', 'MacBook Air M3', 1500.75, 20, 'Description of MacBook Air M3', 'inactive');

-- Bước 3: Tạo Index
CREATE UNIQUE INDEX idx_product_code ON products(product_code);
CREATE INDEX idx_product_name_price ON products(product_name, product_price);

-- Kiểm tra hiệu suất
EXPLAIN SELECT * FROM products WHERE product_code = 'P001';
EXPLAIN SELECT * FROM products WHERE product_name = 'iPhone 15' AND product_price = 1000.50;

-- Bước 4: View
CREATE VIEW view_products AS
SELECT product_code, product_name, product_price, product_status
FROM products;

ALTER VIEW view_products AS
SELECT product_code, product_name, product_price, product_status, product_amount
FROM products;

DROP VIEW IF EXISTS view_products;

-- Bước 5: Stored Procedure
DELIMITER //

CREATE PROCEDURE get_all_products()
BEGIN
    SELECT * FROM products;
END //

CREATE PROCEDURE add_product(
    IN p_product_code VARCHAR(50),
    IN p_product_name VARCHAR(100),
    IN p_product_price DECIMAL(10, 2),
    IN p_product_amount INT,
    IN p_product_description TEXT,
    IN p_product_status ENUM('active', 'inactive')
)
BEGIN
    INSERT INTO products(product_code, product_name, product_price, product_amount, product_description, product_status)
    VALUES (p_product_code, p_product_name, p_product_price, p_product_amount, p_product_description, p_product_status);
END //

CREATE PROCEDURE update_product(
    IN p_id INT,
    IN p_product_name VARCHAR(100),
    IN p_product_price DECIMAL(10, 2),
    IN p_product_amount INT,
    IN p_product_description TEXT,
    IN p_product_status ENUM('active', 'inactive')
)
BEGIN
    UPDATE products
    SET product_name = p_product_name,
        product_price = p_product_price,
        product_amount = p_product_amount,
        product_description = p_product_description,
        product_status = p_product_status
    WHERE id = p_id;
END //

CREATE PROCEDURE delete_product(
    IN p_id INT
)
BEGIN
    DELETE FROM products WHERE id = p_id;
END //

DELIMITER ;
