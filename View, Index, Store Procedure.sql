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
('P01', 'iPhone 15', 1000.50, 10, 'Description of iPhone 15', 'active'),
('P02', 'Samsung Galaxy S24', 1200.00, 5, 'Description of Samsung Galaxy S24', 'active'),
('P03', 'MacBook Air M3', 1500.75, 20, 'Description of MacBook Air M3', 'inactive');

-- Bước 3: Tạo Index

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
CREATE UNIQUE INDEX idx_product_code ON products(product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE INDEX idx_product_name_price ON products(product_name, product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM products WHERE product_code = 'P001';

-- So sánh câu truy vấn trước và sau khi tạo index
EXPLAIN SELECT * FROM products WHERE product_name = 'iPhone 15' AND product_price = 1000.50;

-- Bước 4: View

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW view_products AS
SELECT product_code, product_name, product_price, product_status
FROM products;

-- Tiến hành sửa đổi view
ALTER VIEW view_products AS
SELECT product_code, product_name, product_price, product_status, product_amount
FROM products;

-- Tiến hành xoá view
DROP VIEW IF EXISTS view_products;

-- Bước 5: Stored Procedure

DELIMITER //

-- -- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
CREATE PROCEDURE get_all_products()
BEGIN
    SELECT * FROM products;
END //

-- Tạo store procedure thêm một sản phẩm mới
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

-- Tạo store procedure sửa thông tin sản phẩm theo id
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

-- Tạo store procedure xoá sản phẩm theo id
CREATE PROCEDURE delete_product(
    IN p_id INT
)
BEGIN
    DELETE FROM products WHERE id = p_id;
END //

DELIMITER ;
