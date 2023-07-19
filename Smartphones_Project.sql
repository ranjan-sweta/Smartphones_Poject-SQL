SELECT * FROM smartphone.details;
-- SORTING DATA :-
-- 1. Find top 5 samsung phones with biggest screan size.
SELECT model, screen_size FROM smartphone.details WHERE brand_name = 'samsung'
ORDER BY screen_size DESC LIMIT 5;
-- 2. sort all the phones in decending order of number of total camers.
SELECT model,num_rear_cameras + num_front_cameras AS Total_cameras
FROM smartphone.details ORDER BY Total_cameras DESC; 
-- 3. Find the phone 2nd largest battery
SELECT brand_name, model  FROM smartphone.details
ORDER BY battery_capacity DESC LIMIT 1,1;
-- 4. Find the name and rating of the worst rated apple phone
SELECT model, rating FROM smartphone.details
WHERE brand_name = 'apple'
ORDER BY rating ASC LIMIT 1; 
-- 5. Sort phones alfabatically and then on the basic of ratings in desc order
SELECT * FROM smartphone.details
ORDER BY rating DESC;
-- 6. Sort phones alfabatically and then the basic of price in asc order.
SELECT * FROM smartphone.details
ORDER BY price ASC;
-- 7. Find the phones name, price of the costliest phone.
SELECT brand_name,price FROM smartphone.details
ORDER BY price DESC LIMIT 1;
-- GROUPING DATA :-
-- 7. Group smartphones by brand and the count, average price, max rating,avg screen size and avg battery capacity.
SELECT brand_name, COUNT(*) AS 'num_phones',
ROUND(AVG(price)) AS 'avg price',
MAX(rating) AS 'avg rating',
ROUND(AVG(screen_size),2) AS 'avg screen size',
ROUND(AVG(battery_capacity))AS'avg battery capacity'
FROM smartphone.details
GROUP BY brand_name LIMIT 15

-- 8.Group smartphones by the extended memory available and get the average price.
SELECT * FROM smartphone.details;
SELECT extended_memory_available,
AVG(price) AS ' avg price'
FROM smartphone.details
GROUP BY extended_memory_available;
-- 9. Groups smartphones whether they have an NFC and get the avg price and rating
SELECT has_nfc,
ROUND(AVG(price))AS 'avg price',
ROUND(AVG(rating)) AS 'avg rating'
FROM smartphone.details
GROUP BY has_nfc;
-- 10. Group smartphones by the brand and processor brand and get count of the models and the average primary camera resolution(rear).
SELECT brand_name , processor_brand,
COUNT(*) AS 'num of phones',
ROUND(AVG(primary_camera_rear)) AS 'avg camera resolution'
FROM smartphone.details
GROUP BY brand_name, processor_brand;
-- 11. Find top 5 most costly phone brands.
SELECT * FROM smartphone.details;
SELECT brand_name ,ROUND(AVG(price)) AS avg_price
FROM smartphone.details
GROUP BY brand_name
ORDER BY avg_price DESC LIMIT 5;
-- 12.Which brand makes the smallest screen smartphones.
SELECT brand_name , AVG(screen_size) AS 'avg_screen_size'
FROM smartphone.details
GROUP BY brand_name
ORDER BY avg_screen_size ASC LIMIT 1;
-- 13.Group smartphones by the brand, and find the brand with the highest number of the models that have both NFC and IR blaster.
SELECT brand_name ,COUNT(*) AS 'num_brand'
FROM smartphone.details
WHERE has_nfc = 'True' AND has_ir_blaster = 'True'
GROUP BY brand_name
ORDER BY num_brand DESC LIMIT 1;
-- 14. Find all samsung 5g enabled smarthphones and find out the avg price NFC and NON-NFC phones.
SELECT has_5g, ROUND(AVG(price)) AS ' avg_price'
FROM smartphone.details
WHERE brand_name = 'samsung'
GROUP BY has_5g;



