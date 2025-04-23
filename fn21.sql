-- Active: 1745317106021@@127.0.0.1@3306@fn21
CREATE DATABASE IF NOT EXISTS store;

CREATE TABLE IF NOT EXISTS products (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  category VARCHAR(50) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  stock INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO products(name, category, price, stock) VALUES
('Iphone 13', 'Electronics', 900, 10),
('Samsung TV 55"', 'Electronics', 1200, 5),
('Nike Shoes', 'Fashion', 150, 20),
('Adidas T-shirt', 'Fashion', 40, 30),
('HP Laptop', 'Electronics', 700, 7)

SELECT name, category, price FROM products

SELECT * FROM products WHERE price > 500

SELECT * FROM products ORDER BY price DESC

UPDATE products
set price = price + 170
WHERE name = 'Nike Shoes'

SELECT * FROM products

DELETE FROM products
WHERE name = "Adidas T-shirt"

SELECT * FROM products

SELECT * FROM products WHERE name like "S%"

SELECT COUNT(*) FROM products;

SELECT MAX(price) FROM products;

SELECT MIN(price) FROM products;

SELECT SUM(price) FROM products;

SELECT AVG(price) FROM products;
