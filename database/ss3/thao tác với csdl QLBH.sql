-- Thêm dữ liệu vào bảng customer
INSERT INTO customer (c_id, c_name, c_age) VALUES
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);
-- Thêm dữ liệu vào bảng orders
INSERT INTO orders (o_id, c_id, o_date, o_totalprice) VALUES
(1, 1, '2006-03-21', 0),
(2, 2, '2006-03-23', 0),
(3, 1, '2006-03-16', 0);

-- Thêm dữ liệu vào bảng product
INSERT INTO product (p_id, p_name, p_price) VALUES
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

-- Thêm dữ liệu vào bảng order_detail
INSERT INTO order_detail (o_id, p_id, od_qty) VALUES
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(2, 5, 4),
(3, 1, 8),
(3, 3, 3);

-- Hiển thị các thông tin gồm o_id, o_date, o_totalprice của tất cả các hóa đơn trong bảng orders
SELECT 
    o_id, o_date, o_totalprice
FROM
    orders;

-- Hiển thị danh sách các khách hàng đã mua hàng
SELECT DISTINCT
    customer.c_id AS customer_id,
    customer.c_name AS customer_name,
    customer.c_age AS customer_age
FROM
    customer
JOIN orders ON customer.c_id = orders.c_id;

-- Hiển thị danh sách sản phẩm được mua bởi các khách hàng
SELECT DISTINCT
    product.p_id AS product_id,
    product.p_name AS product_name,
    product.p_price AS product_price
FROM
    product
JOIN order_detail ON product.p_id = order_detail.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
SELECT DISTINCT
    customer.c_id AS customer_id,
    customer.c_name AS customer_name,
    customer.c_age AS customer_age
FROM
    customer
LEFT JOIN orders ON customer.c_id = orders.c_id
WHERE
    orders.o_id IS NULL;

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- (Giá một hóa đơn = Tổng giá bán của từng loại mặt hàng trong hóa đơn)
SELECT 
    orders.o_id AS order_id,
    orders.o_date AS order_date,
    SUM(order_detail.od_qty * product.p_price) AS total_price
FROM
    orders
JOIN order_detail ON orders.o_id = order_detail.o_id
JOIN product ON order_detail.p_id = product.p_id
GROUP BY orders.o_id, orders.o_date;