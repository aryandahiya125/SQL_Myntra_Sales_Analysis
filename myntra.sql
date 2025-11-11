USE myntra;

SELECT * FROM products;

SELECT brand_name,rating,((marked_price-discounted_price)/marked_price)*100 as "discount%" FROM products;


# Write an SQL query to retrieve the unique product tags, brand name, and discounted price of all products from the brand "Adidas" where the discounted price is greater than 5000.

SELECT DISTINCT(product_tag),brand_name,discounted_price
FROM products
WHERE brand_name = "Adidas"
AND discounted_price > 5000;


#From the products table, retrieve the unique product tags along with their brand name and discounted price for products belonging to the brand "Adidas", where the discounted price is between 3000 and 5000 (inclusive).

SELECT DISTINCT(product_tag),brand_name,discounted_price
FROM products
WHERE brand_name = "Adidas"
AND discounted_price BETWEEN 3000 and 5000;


#From the products table, retrieve the unique product tags along with their brand name, discounted price, rating, and rating count for products belonging to the brand "Adidas", where the discounted price is between 4000 and 8000, the rating is greater than 3, and the rating count is more than 12.

SELECT DISTINCT(product_tag),brand_name,discounted_price,rating,rating_count
FROM products
WHERE brand_name= "Adidas"
AND discounted_price BETWEEN 4000 AND 8000 
AND rating > 3
AND rating_count > 12;


#From the products table, retrieve the unique product tags along with their brand name and discounted price for products belonging to either "Adidas" or "Puma", where the discounted price falls between 3000 and 8000.

SELECT DISTINCT(product_tag),brand_name,discounted_price
FROM products
WHERE brand_name IN("Adidas","Puma")
AND discounted_price BETWEEN 3000 AND 8000;


USE myntra;


#From the products table, retrieve the unique product tags along with their brand name and discounted price for products whose brand is not "H&M" or "Biba", and whose discounted price lies between 2000 and 4000.
  
SELECT DISTINCT(product_tag),brand_name,discounted_price 
FROM products
WHERE brand_name NOT IN ("H&M","Biba")
AND discounted_price BETWEEN 2000 AND 4000;


SELECT * FROM myntra.products;


#From the products table, retrieve the brand name, rating count, and product tag for products whose product tag is either "tshirts", "shoes", or "flip flops", and have a rating count greater than 3000.
  
SELECT brand_name,rating_count,product_tag
FROM products
WHERE product_tag IN ("tshirts","shoes","flip flops")
AND rating_count>3000;


#Find the Average of marked_price,discounted_price.

SELECT AVG(marked_price),AVG(discounted_price) FROM products;


SELECT COUNT(*) FROM products;

#From the products table, find the maximum, minimum, and average marked price of products belonging to the brand "Adidas".
  
SELECT MAX(marked_price),MIN(marked_price),AVG(marked_price)
FROM products
WHERE brand_name = "Adidas";


#Find the maximum,minumum and average of discounted_price.
  
SELECT MAX(discounted_price),MIN(discounted_price),AVG(discounted_price)
FROM products
WHERE brand_name = "Adidas";

SELECT * FROM products;


#From the products table, count how many unique product tags are available for the brand "Nike".
  
SELECT COUNT(DISTINCT (product_tag)) FROM products
WHERE brand_name = 'Nike';


#Find the sum of revenue from the products table.

SELECT SUM(discounted_price* rating_count) AS 'Sum of Revenue' FROM products;


#From the products table, retrieve the product name and rating count of the top 5 products with the highest rating count, ordering the results in descending order of rating count.
  
SELECT product_name,rating_count FROM products ORDER BY rating_count DESC  LIMIT 5;


#From the products table, retrieve the product name and calculate a new value called total (rating*rating_count). Display the top 5 products with the highest total value, sorted in descending order.
  
SELECT product_name,(rating*rating_count) AS 'total' FROM products
ORDER BY total DESC
LIMIT 5;


#From the products table, retrieve the product name and rating of the lowest-rated product from the brand "Nike", excluding products with a rating of 0, and display only one result.
  
SELECT product_name,rating
FROM products
WHERE brand_name = 'Nike' AND  
rating!=0
ORDER BY rating
LIMIT 1;


#From the products table, calculate a new value  total (rating*rating_count) for products with the product tag "tshirt" and belonging to either "Nike" or "Adidas". Retrieve the total value, product tag, and rating, and display the top 10 products with the highest total value, ordered in descending order.
  
SELECT (rating*rating_count) AS total ,product_tag,rating
FROM products
WHERE product_tag="tshirt"
AND brand_name IN("Nike","Adidas")
ORDER BY total DESC
LIMIT 10;


# Worst rated 10 products based on the rating of 100 people atleast

SELECT rating_count,rating,product_tag 
FROM products
WHERE rating_count >= 100
ORDER BY rating_count ASC
LIMIT 10;

SELECT * FROM products;


#Sort the products in alphabetical descending order based on their product_name and show the last 10 of them.

SELECT *
FROM products
ORDER BY product_name DESC
LIMIT 10;


#Finding the list of tshirts from nike and adidas prices between 1000 and 1200 | Sort them based on ascending order of brand_name and price.
  
SELECT product_tag,brand_name,discounted_price
FROM products
WHERE product_tag="tshirts" AND
brand_name IN("Nike","Adidas")
AND discounted_price BETWEEN 1000 AND 1200
ORDER BY brand_name ASC, discounted_price ASC;


#From the products table, calculate the revenue for each brand by  and summing the result. Retrieve the brand name and the calculated revenue, then display the top 5 brands with the highest revenue in descending order.
  
SELECT brand_name,sum(rating_count*discounted_price) as revenue
FROM products
GROUP BY brand_name
ORDER BY revenue DESC
LIMIT 5;


#From the products table, calculate the total rating count for each brand. Retrieve the brand_name along with the total rating count, and display the top 5 brands with the highest total rating count, ordered in descending order.
  
SELECT brand_name,SUM(rating_count) as total
FROM products
GROUP BY brand_name
ORDER BY total DESC
LIMIT 5;

#Top 5 categories sold the most along with their revenue|sort based on revenue.
  
SELECT product_tag,sum(rating_count*discounted_price) as total,sum(rating_count)
FROM products
GROUP BY product_tag
ORDER BY total DESC
LIMIT 5;


#From the products table, count the number of unique product tags available for each brand. Retrieve the brand name along with this count, and display the top 5 brands that offer the highest variety of product tags, ordered in descending order.
  
SELECT brand_name,COUNT(distinct(product_tag))
FROM products
GROUP BY brand_name
ORDER BY COUNT(distinct(product_tag)) DESC
LIMIT 5;

#finding the top 5 brand who sold the most number of products.
  
SELECT brand_name,SUM(rating_count)
FROM products
GROUP BY brand_name
ORDER BY SUM(rating_count) DESC
LIMIT 5;


#finding the top 5 most expensive brands based on their discounted price.
  
SELECT brand_name,AVG(discounted_price)
FROM products
GROUP BY brand_name
ORDER BY AVG(discounted_price) DESC
LIMIT 5;


# Finding the top 5 least expensive brands based on their discounted price

SELECT brand_name,AVG(discounted_price)
FROM products
GROUP BY brand_name
ORDER BY AVG(discounted_price) ASC
LIMIT 5;


#Finding the top 10 best selling product categories.
  
SELECT product_tag,SUM(rating_count)
FROM products
GROUP BY product_tag
ORDER BY SUM(rating_count) DESC
LIMIT 10;


SELECT * FROM products;


#Finding the top 10 brands who gives maximum discount.
  
SELECT brand_name,AVG(discount_percent)
FROM products
GROUP BY brand_name
ORDER BY AVG(discount_percent) DESC
LIMIT 10;

#Finding the top 5 most expensive product categories.
  
SELECT product_tag,AVG(discounted_price)
FROM products
GROUP BY product_tag
ORDER BY AVG(discounted_price) DESC
LIMIT 5;

#Which category of any specific brand is sold the most?

SELECT product_tag,brand_name,SUM(rating_count)
FROM products
GROUP BY product_tag,brand_name
ORDER BY SUM(rating_count) DESC;

#Which brand of any specific category is sold the most?

SELECT brand_name,product_tag,SUM(rating_count)
FROM products
GROUP BY brand_name,product_tag
ORDER BY SUM(rating_count) DESC;





