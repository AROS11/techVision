-- Create the database
CREATE DATABASE base;

-- Use the newly created database
USE base;

-- Create Product table
CREATE TABLE Product (
    _id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(200),
    image VARCHAR(255) DEFAULT '/placeholder.png',
    brand VARCHAR(200),
    category VARCHAR(200),
    description TEXT,
    rating DECIMAL(7, 2),
    numReviews INT DEFAULT 0,
    price DECIMAL(7, 2),
    countInStock INT DEFAULT 0,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES auth_user(id) ON DELETE SET NULL
);

-- Create Review table
CREATE TABLE Review (
    _id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    user_id INT,
    name VARCHAR(200),
    rating INT DEFAULT 0,
    comment TEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES Product(_id) ON DELETE SET NULL,
    FOREIGN KEY (user_id) REFERENCES auth_user(id) ON DELETE SET NULL
);

-- Create Order table
CREATE TABLE `Order` (
    _id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    paymentMethod VARCHAR(200),
    taxPrice DECIMAL(7, 2),
    shippingPrice DECIMAL(7, 2),
    totalPrice DECIMAL(7, 2),
    isPaid BOOLEAN DEFAULT FALSE,
    paidAt DATETIME,
    isDelivered BOOLEAN DEFAULT FALSE,
    deliveredAt DATETIME,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES auth_user(id) ON DELETE SET NULL
);

-- Create OrderItem table
CREATE TABLE OrderItem (
    _id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    order_id INT,
    name VARCHAR(200),
    qty INT DEFAULT 0,
    price DECIMAL(7, 2),
    image VARCHAR(200),
    FOREIGN KEY (product_id) REFERENCES Product(_id) ON DELETE SET NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(_id) ON DELETE SET NULL
);

-- Create ShippingAddress table
CREATE TABLE ShippingAddress (
    _id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    address VARCHAR(200),
    city VARCHAR(200),
    postalCode VARCHAR(200),
    country VARCHAR(200),
    shippingPrice DECIMAL(7, 2),
    FOREIGN KEY (order_id) REFERENCES `Order`(_id) ON DELETE CASCADE
);
