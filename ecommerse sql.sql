create database ecommerce;

use ecommerce

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50)
);
INSERT INTO customers (customer_id, customer_name, city, state) VALUES
(1, 'Rahul Sharma', 'Hyderabad', 'Telangana'),
(2, 'Aman Khan', 'Karimnagar', 'Telangana'),
(3, 'Priya Reddy', 'Warangal', 'Telangana'),
(4, 'Arjun Kumar', 'Bengaluru', 'Karnataka'),
(5, 'Sneha Patel', 'Mumbai', 'Maharashtra'),
(6, 'Vikram Singh', 'Delhi', 'Delhi'),
(7, 'Neha Verma', 'Pune', 'Maharashtra'),
(8, 'Imran Ali', 'Hyderabad', 'Telangana'),
(9, 'Kiran Rao', 'Vijayawada', 'Andhra Pradesh'),
(10, 'Anjali Gupta', 'Chennai', 'Tamil Nadu'),
(11, 'Rohit Mehta', 'Jaipur', 'Rajasthan'),
(12, 'Fatima Sheikh', 'Hyderabad', 'Telangana'),
(13, 'Suresh Reddy', 'Warangal', 'Telangana'),
(14, 'Pooja Nair', 'Kochi', 'Kerala'),
(15, 'Mohammed Asif', 'Karimnagar', 'Telangana');

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);
INSERT INTO categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home Appliances'),
(4, 'Books'),
(5, 'Sports');
 
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO products (product_id, product_name, category_id, price) VALUES
(1, 'Laptop', 1, 55000),
(2, 'Smartphone', 1, 25000),
(3, 'Headphones', 1, 2000),
(4, 'Keyboard', 1, 1500),
(5, 'T-Shirt', 2, 800),
(6, 'Jeans', 2, 1800),
(7, 'Jacket', 2, 2500),
(8, 'Shoes', 2, 3000),
(9, 'Microwave Oven', 3, 12000),
(10, 'Mixer Grinder', 3, 4500),
(11, 'Air Cooler', 3, 9000),
(12, 'Python Programming', 4, 700),
(13, 'SQL Guide', 4, 600),
(14, 'Data Analytics Book', 4, 900),
(15, 'Cricket Bat', 5, 3500),
(16, 'Football', 5, 1200),
(17, 'Badminton Racket', 5, 2200),
(18, 'Smart Watch', 1, 5000),
(19, 'Hoodie', 2, 2200),
(20, 'Yoga Mat', 5, 1000);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id, order_date, status) VALUES
(101, 1, '2026-01-05', 'Delivered'),
(102, 2, '2026-01-08', 'Delivered'),
(103, 3, '2026-01-12', 'Delivered'),
(104, 4, '2026-01-15', 'Cancelled'),
(105, 5, '2026-01-20', 'Delivered'),
(106, 6, '2026-02-02', 'Delivered'),
(107, 7, '2026-02-10', 'Shipped'),
(108, 8, '2026-02-14', 'Delivered'),
(109, 9, '2026-02-18', 'Delivered'),
(110, 10, '2026-02-25', 'Cancelled'),
(111, 1, '2026-03-03', 'Delivered'),
(112, 2, '2026-03-08', 'Delivered'),
(113, 11, '2026-03-12', 'Shipped'),
(114, 12, '2026-03-18', 'Delivered'),
(115, 13, '2026-03-22', 'Delivered'),
(116, 14, '2026-04-02', 'Delivered'),
(117, 15, '2026-04-10', 'Delivered'),
(118, 3, '2026-04-15', 'Shipped'),
(119, 5, '2026-04-20', 'Delivered'),
(120, 8, '2026-04-25', 'Delivered');

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 101, 1, 1),
(2, 101, 3, 2),
(3, 102, 2, 1),
(4, 102, 13, 2),
(5, 103, 8, 1),
(6, 103, 5, 2),
(7, 104, 1, 1),
(8, 105, 9, 1),
(9, 105, 10, 1),
(10, 106, 6, 2),
(11, 106, 7, 1),
(12, 107, 18, 1),
(13, 108, 15, 1),
(14, 108, 16, 2),
(15, 109, 14, 2),
(16, 109, 12, 1),
(17, 110, 11, 1),
(18, 111, 2, 1),
(19, 111, 18, 1),
(20, 112, 3, 2),
(21, 112, 4, 1),
(22, 113, 19, 2),
(23, 114, 10, 1),
(24, 114, 20, 2),
(25, 115, 15, 1),
(26, 116, 17, 1),
(27, 117, 1, 1),
(28, 117, 13, 1),
(29, 118, 8, 1),
(30, 119, 7, 1),
(31, 119, 5, 3),
(32, 120, 2, 1),
(33, 120, 3, 1);

select count(*) as total_customers from customers

select count(*) as total_products from products

select count(*) as total_orders from orders

select * from customers where city = 'Hyderabad'

select * from products where price > 5000

select * from products order by price desc

select * from orders where status = 'Delivered'

select distinct city from customers 

select * from products order by price desc 

select city ,count(*) from customers group by city

select  category_name,count(*) from categories group by category_name


SELECT  categories.category_name,
AVG(products.price) AS average_price
FROM products products
JOIN categories categories
ON products.category_id = categories.category_id
GROUP BY categories.category_name;

select order_id,sum(quantity) as total_quantity from order_items group by order_id
 
select * from products
select * from customers 
select * from order_items
select * from orders

show tables;

select product_id , sum(quantity) as total_quantity_sold from order_items join orders 
on order_items.order_id = orders.order_id where orders.status = 'Delivered' group by product_id

select status ,count(*) as total_orders from orders group by status

select city, count(*) as customer_count from customers group by city order by customer_count desc

select avg(price) as avg_sales from products 

select min(price) as min_price, max(price) as min_price from products

select max(price) as min_price from products group by price

select customers.customer_name, orders.order_id from customers 
join orders on  customers.customer_id = orders.customer_id

select orders.order_id, customers.customer_id,orders.order_date from orders
join customers on  customers.customer_id = orders.customer_id

select products.product_name, orders.order_date from products 
join orders on  products.product_id= orders.customer_id

select orders.order_id, products.product_name, order_items.quantity from orders 
join order_items on  order_items.order_id = orders.order_id 
join products on  products.product_id = order_items.product_id ;

SELECT customers.customer_name, orders.order_id, products.product_name, order_items.quantity FROM customers
JOIN orders ON customers.customer_id = orders.customer_id 
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id;

SELECT customers.customer_name, COUNT(orders.order_id) AS total_orders FROM customers
JOIN orders ON customers.customer_id = orders.customer_id 
GROUP BY customers.customer_id, customers.customer_name;

select products.product_name   ,sum(order_items.quantity) sold_products from products 
join order_items on products.product_id = order_items.product_id
group by products.product_name  

select products.product_name, sum(order_items.quantity *products.price ) as revenue from products
join order_items  on products.product_id = order_items.product_id
group by products.product_name  

select customers.customer_name, sum(order_items.quantity *products.price ) as Total_spending from customers 
join orders on customers.customer_id = orders.customer_id 
join order_items on orders.order_id = order_items .order_id  
join products on  order_items.product_id = products.product_id
 group by customers.customer_name

select products.product_name, sum(order_items.quantity) as Total_sold from products 
join order_items 
on products.product_id = order_items.product_id
group by products.product_name order by Total_sold desc limit 5

select customers.customer_name, sum(order_items.quantity * products.price) as product_solds from customers 
join orders on customers.customer_id = orders.customer_id 
join order_items on  orders.order_id = order_items.order_id
join products on  order_items.product_id = products.product_id
group by customers.customer_name order by product_solds desc limit 1

select customers.customer_name from customers left join orders on 
customers.customer_id = orders.customer_id where orders.order_id is null

SELECT MONTH(orders.order_date) AS month, SUM(order_items.quantity * products.price) AS monthly_revenue FROM orders 
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id
group by MONTH(orders.order_date) ORDER BY month;

select category_id, max(price) as highest_price from products group by category_id

select products.product_name,sum(order_items.quantity)  as products_sales from order_items
join products on order_items.product_id = products.product_id 
group by products.product_name  order by products_sales desc limit 3

select customers.customer_id ,customers.customer_name as repeated_customers from customers join orders 
on customers.customer_id = orders.customer_id group by customers.customer_id, customers.customer_name
having count(orders.order_id) > 1

select customers.customer_name, sum(order_items.quantity * products.price) as total_spending from customers 
join orders on customers.customer_id = orders.customer_id 
join order_items on  orders.order_id = order_items.order_id
join products on  order_items.product_id = products.product_id
group by customers.customer_name order by total_spending desc 

select month(order_date) as month, sum(order_items.quantity * products.price) as revenue from orders 
join order_items on orders.order_id = order_items.order_id
join products on order_items.product_id = products.product_id
group by month(order_date) order by month

