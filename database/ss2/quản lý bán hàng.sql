create database quan_ly_ban_hang;
use quan_ly_ban_hang ;


CREATE TABLE customer (
    c_id INT AUTO_INCREMENT PRIMARY KEY,
    c_name VARCHAR(50) NOT NULL,
    c_age DATE NOT NULL
);

CREATE TABLE orders (
    o_id INT AUTO_INCREMENT PRIMARY KEY,
    c_id INT NOT NULL,
    o_date DATE NOT NULL,
    o_totalprice DOUBLE NOT NULL DEFAULT 0,
    FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);
	CREATE TABLE product (
    p_id INT AUTO_INCREMENT PRIMARY KEY,
    p_name VARCHAR(100) NOT NULL,
    p_price DOUBLE NOT NULL
);
CREATE TABLE order_detail (
    o_id INT NOT NULL,
    p_id INT NOT NULL,
    od_qty INT NOT NULL DEFAULT 1,
    PRIMARY KEY (o_id , p_id),
    FOREIGN KEY (o_id)
        REFERENCES orders (o_id),
    FOREIGN KEY (p_id)
        REFERENCES product (p_id)
);
