
SELECT *
FROM brands

SELECT *
FROM finance

SELECT *
FROM info

SELECT *
FROM reviews

SELECT *
FROM traffic



--Finding Missing Values

SELECT 'Brands' AS dataset_name, COUNT(*) AS missing_values
FROM Brands
WHERE product_id IS NULL OR brand IS NULL 
UNION ALL
SELECT 'Info' AS dataset_name, COUNT(*) AS missing_values
FROM Info
WHERE product_name IS NULL OR product_id IS NULL OR description IS NULL
UNION ALL
SELECT 'Finance' AS dataset_name, COUNT(*) AS missing_values
FROM finance
WHERE listing_price IS NULL OR product_id IS NULL OR sale_price IS NULL OR discount IS NULL OR revenue IS NULL
UNION ALL
SELECT 'Reviews' AS dataset_name, COUNT(*) AS missing_values
FROM reviews
WHERE rating IS NULL OR product_id IS NULL OR reviews IS NULL
UNION ALL
SELECT 'Traffic' AS dataset_name, COUNT(*) AS missing_values
FROM traffic
WHERE last_visited IS NULL OR product_id IS NULL;

--Dealing with null values
--Deleting  Null Values

DELETE FROM brands
WHERE brand IS NULL;

DELETE FROM finance
WHERE listing_price IS NULL OR sale_price IS NULL OR discount IS NULL OR revenue IS NULL;

-- Now finding the ratio between nike and addidas
SELECT 
    brand,
    COUNT(*) AS product_count,
    CAST(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM brands) AS DECIMAL(5,2)) AS percentage
FROM 
    brands
WHERE 
    brand IN ('Nike', 'Adidas')
GROUP BY 
    brand;

--We want to know how do the price points of nike and addidas products differ
SELECT 
    b.brand,
    AVG(f.listing_price) AS avg_listing_price,
    AVG(f.sale_price) AS avg_sale_price
FROM 
    brands b
JOIN 
    finance f ON b.product_id = f.product_id
WHERE 
    b.brand IN ('Nike', 'Adidas')
GROUP BY 
    b.brand;

-- difference in the amount of discount offered between the brands
SELECT 
    b.brand,
    AVG(f.discount) AS avg_discount
FROM 
    brands b
JOIN 
    finance f ON b.product_id = f.product_id
WHERE 
    b.brand IN ('Nike', 'Adidas')
GROUP BY 
    b.brand;


SELECT 
    f.product_id,
    f.listing_price,
    f.sale_price,
    f.discount,
    f.revenue,
    r.rating,
    r.reviews,
    b.brand,
	i.product_name,
	i.description,
	t.last_visited
FROM 
    finance f
JOIN 
    reviews r ON f.product_id = r.product_id
JOIN 
    brands b ON f.product_id = b.product_id
JOIN 
    info i ON f.product_id = i.product_id
JOIN 
    traffic t ON f.product_id = t.product_id
ORDER BY product_id DESC;

--Now want to know which brand has the highest number of reviews
SELECT 
    b.brand,
    AVG(r.rating) AS rating_count
FROM 
    brands b
JOIN 
    reviews r ON b.product_id = r.product_id
GROUP BY 
    b.brand
ORDER BY 
    COUNT(r.rating) DESC

--Want to know the product the most revenue
SELECT 
    f.product_id,
    f.listing_price,
    f.sale_price,
    f.discount,
    f.revenue,
    r.rating,
    r.reviews,
    b.brand,
	i.product_name,
	i.description,
	t.last_visited
FROM 
    finance f
JOIN 
    reviews r ON f.product_id = r.product_id
JOIN 
    brands b ON f.product_id = b.product_id
JOIN 
    info i ON f.product_id = i.product_id
JOIN 
    traffic t ON f.product_id = t.product_id
ORDER BY revenue DESC;






