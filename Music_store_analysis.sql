-- Q1 Who is the senior most employee based on job title
SELECT * FROM employee
ORDER BY levels desc
limit 1

-- Q2 Which country have the most invoices
SELECT COUNT(*) AS c, billing_country
FROM invoice
group by billing_country
order by c desc

-- Q3 What are top 3 values of total invoice
SELECT total FROM invoice
order by total desc 
limit 3

-- Q4 Which city has the best customers? We would like to throw a promotional music festival in the city we made 
-- the most money. Write a query that returns one city that has the highest sum of invoice totals . Return both 
-- the city name and sum of all invoice totals
SELECT SUM(total) as invoice_total, billing_city
FROM invoice
group by billing_city
order by invoice_total desc

-- Q5 Who is the best customer? The customer who has spent the most money will be declared the best customer.
-- Write a query that returns the person who has spent the most money
SELECT customer.customer_id, customer.first_name, customer.last_name, SUM(invoice.total) as total
from customer
JOIN invoice ON customer.customer_id = invoice.customer_id
group by customer.customer_id
order by total desc
limit 1

