CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10,2)
);

INSERT INTO products (product_name, price)
VALUES
('Protein Bars', 10.99),
('Organic Granola', 15.99),
('Green Smoothie', 7.99);

