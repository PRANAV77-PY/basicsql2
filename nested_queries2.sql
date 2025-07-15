CREATE DATABASE nested_queries2;

USE nested_queries2;

CREATE TABLE products(
	product_id INT,
	product_name VARCHAR(50),
	price DECIMAL(10,2)
);

SELECT * FROM products;


-- orders table
CREATE TABLE orders(
	order_id INT,
    product_id INT,
    quantity INT
);

SELECT * FROM orders;

INSERT INTO products VALUES
(1,'Pen',10.00),
(2,'Pencil',5.00),
(3,'Notebook',50.00),
(4,'Bag',200.00);

INSERT INTO orders VALUES
(101,1,5),
(102,2,10),
(103,3,2),
(104,4,1);

-- find products which have been ordered
SELECT product_name FROM products
WHERE Product_id IN ( 
SELECT distinct product_id
 FROM orders );
 
 -- products with price higher than average product price
 SELECT product_name,price FROM products WHERE price > (
 SELECT AVG(price) FROM products);
 
 -- orders with products that cost more than $50
 SELECT order_id FROM orders WHERE products > 50
 
 
 --
 

    

