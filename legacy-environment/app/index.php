<?php

$host = getenv('DB_HOST');
$user = getenv('DB_USER');
$pass = getenv('DB_PASSWORD');
$db   = getenv('DB_NAME');

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Database connection failed");
}

$result = $conn->query(
    "SELECT product_name, price FROM products"
);

echo "<h1>Legacy E-Commerce Platform</h1>";

while ($row = $result->fetch_assoc()) {
    echo "<p>{$row['product_name']} - $ {$row['price']}</p>";
}