-- Create table
CREATE TABLE ecommerce_sales (
    Product_ID TEXT,
    Product_Name TEXT,
    Category TEXT,
    Seller_Name TEXT,
    Price DECIMAL,
    Units_Sold INT,
    Revenue DECIMAL,
    Rating DECIMAL,
    Return_Rate DECIMAL,
    Channel TEXT,
    Geography TEXT
);
INSERT INTO ecommerce_sales 
(Product_ID, Product_Name, Category, Seller_Name, Price, Units_Sold, Revenue, Rating, Return_Rate, Channel, Geography)
VALUES
('P001', 'Wireless Mouse', 'Electronics', 'TechWorld', 15.99, 500, 7995.00, 4.2, 5.5, 'Online', 'USA'),
('P002', 'Running Shoes', 'Sportswear', 'FitStore', 55.00, 300, 16500.00, 4.5, 12.0, 'Online', 'India'),
('P003', 'Leather Wallet', 'Accessories', 'UrbanStyle', 25.50, 150, 3825.00, 3.8, 8.0, 'Retail', 'UK'),
('P004', 'Smartphone Case', 'Electronics', 'GadgetHub', 10.00, 800, 8000.00, 4.0, 15.0, 'Online', 'USA'),
('P005', 'Yoga Mat', 'Sportswear', 'ZenLife', 20.00, 400, 8000.00, 4.7, 3.5, 'Retail', 'India'),
('P006', 'Sunglasses', 'Accessories', 'UrbanStyle', 30.00, 200, 6000.00, 4.1, 9.5, 'Online', 'UK'),
('P007', 'Bluetooth Speaker', 'Electronics', 'SoundMax', 45.00, 250, 11250.00, 4.6, 10.0, 'Online', 'Canada'),
('P008', 'Office Chair', 'Furniture', 'HomePlus', 120.00, 100, 12000.00, 4.3, 6.5, 'Retail', 'USA'),
('P009', 'Backpack', 'Accessories', 'UrbanStyle', 40.00, 180, 7200.00, 4.2, 7.0, 'Online', 'Germany'),
('P010', 'Tennis Racket', 'Sportswear', 'FitStore', 75.00, 90, 6750.00, 4.5, 11.5, 'Online', 'India'),
('P011', 'Desk Lamp', 'Furniture', 'LightHouse', 35.00, 220, 7700.00, 4.4, 4.5, 'Retail', 'USA'),
('P012', 'Gaming Keyboard', 'Electronics', 'TechWorld', 60.00, 150, 9000.00, 4.6, 6.0, 'Online', 'UK'),
('P013', 'Winter Jacket', 'Clothing', 'FashionHub', 85.00, 130, 11050.00, 4.3, 13.0, 'Retail', 'Canada'),
('P014', 'Cookware Set', 'Home & Kitchen', 'KitchenPro', 150.00, 80, 12000.00, 4.7, 5.0, 'Online', 'USA'),
('P015', 'Headphones', 'Electronics', 'SoundMax', 70.00, 300, 21000.00, 4.5, 9.0, 'Online', 'India'),
('P016', 'Wrist Watch', 'Accessories', 'UrbanStyle', 95.00, 120, 11400.00, 4.0, 12.5, 'Retail', 'UK'),
('P017', 'Formal Shirt', 'Clothing', 'FashionHub', 35.00, 250, 8750.00, 4.1, 6.8, 'Online', 'Germany'),
('P018', 'Coffee Maker', 'Home & Kitchen', 'KitchenPro', 110.00, 70, 7700.00, 4.6, 7.5, 'Retail', 'USA'),
('P019', 'Cricket Bat', 'Sportswear', 'FitStore', 90.00, 95, 8550.00, 4.4, 14.0, 'Online', 'India'),
('P020', 'Table Lamp', 'Furniture', 'LightHouse', 45.00, 160, 7200.00, 4.3, 5.8, 'Online', 'Canada');


-- Preview first few rows
SELECT * FROM ecommerce_sales LIMIT 10;

-- Count records, null check
SELECT COUNT(*) AS total_rows,
       SUM(CASE WHEN Return_Rate IS NULL THEN 1 ELSE 0 END) AS null_return_rate
FROM ecommerce_sales;

-- Checkpoints1
-- Overall retrun 
SELECT Avg(Return_Rate)AS avg_return_rate,sum(Return_Rate * Units_Sold)/ sum(Units_Sold)AS weighted_return_rate FROM ecommerce_sales;

-- 2,by category
SELECT category,avg( return_rate)AS avg_return_rate,sum( return_rate * units_sold)/ sum( units_sold ) AS weighted_return_rate,count( *) AS num_products FROM ecommerce_sales GROUP BY category ORDER BY weighted_return_rate DESC;

-- 3: by seller
SELECT seller_name,avg( return_rate)AS avg_return_rate,sum( return_rate * units_sold)/ sum( units_sold)AS weighted_return_rate,count( *) AS num_products FROM ecommerce_sales GROUP BY seller_name HAVING count( *) > 5  -- filter small seller
ORDER BY weighted_return_rate DESC;

-- 4:by geography
SELECT geography,avg( return_rate)AS avg_return_rate,sum( return_rate * units_sold) / sum(units_sold) AS weighted_return_rate,count( *)AS num_products FROM ecommerce_sales GROUP BY geography ORDER BY weighted_return_rate DESC;

-- 5:by channel(online vs retail)
SELECT channel,avg( return_rate)AS avg_return_rate,sum( return_rate * units_sold)/sum(units_sold) AS weighted_return_rate,count( *) AS num_products FROM ecommerce_sales GROUP BY channel ORDER BY weighted_return_rate DESC;

-- 6:Top 10 high-risk products
SELECT product_id,product_name,category,seller_name,units_sold,price,return_rate FROM ecommerce_sales ORDER BY return_rate DESC LIMIT 10;