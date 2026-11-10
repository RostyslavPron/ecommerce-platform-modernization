<?php

$host = getenv('DB_HOST');
$user = getenv('DB_USER');
$pass = getenv('DB_PASSWORD');
$db   = getenv('DB_NAME');

$conn = new mysqli($host, $user, $pass, $db);

$appName = getenv('APP_NAME');

echo "<h1>Legacy E-Commerce Platform</h1>";
echo "<h3>Served by: {$appName}</h3>";

if ($conn->connect_error) {
    die("Database connection failed");
}

$result = $conn->query(
    "SELECT product_name, price FROM products"
);


while ($row = $result->fetch_assoc()) {
    echo "<p>{$row['product_name']} - $ {$row['price']}</p>";
}