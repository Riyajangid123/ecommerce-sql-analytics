select * from customers;
select * from orders;
select * from order_items;
select * from payments;
select * from products;
#List all customers from Jaipur
select customer_name from customers where city='jaipur';
#Find total number of orders placed
select count(order_id) from orders;
#Show order_id, customer_name, order_date
select o.order_id,c.customer_name,o.order_date from customers as c join orders 
as o on c.customer_id=o.customer_id;
#Find all products in Electronics category
select product_name from products where category='Electronics';
#Total revenue generated
select sum(amount) from payments;
#Revenue by payment method
select  payment_method,sum(amount) from payments group by payment_method;
#Total orders placed by each customer
select c.customer_name,count(o.order_id) from customers as c join orders as o 
on c.customer_id=o.customer_id group by c.customer_name;
#Find average order value
select sum(p.amount)/count(distinct o.order_id) as avg_order_value from payments as p join orders as o
on p.order_id=o.order_id;
#Top 3 highest selling products (by quantity)
select p.product_name,sum(oi.quantity) as total_qty from products as p join  order_items as oi 
on p.product_id=oi.product_id group by p.product_name order by sum(oi.quantity) desc limit 3;
#Find customers who placed more than 1 order
select c.customer_name, count(distinct o.order_id) as unique_orders from customers as c join orders as o
 on c.customer_id=o.customer_id group by c.customer_name having count(distinct o.order_id)>1;
#Identify customers who never placed an order
select customer_name from customers join orders on customers.customer_id=orders.customer_id where 
orders.order_id is null;
#Find the most popular product category
select p.category from products as p join order_items as oi on p.product_id=oi.product_id 
order by oi.quantity desc limit 1;
#Rank customers based on total spending (use RANK())
select c.customer_name, sum(p.amount) as total_spending,rank() over(order by sum(p.amount)  desc) as
spending_rank from customers as c join orders as o on c.customer_id =o.customer_id join payments as p 
on o.order_id=p.order_id group by c.customer_name;
#Find repeat customers
select c.customer_name,count(distinct o.order_id) as orders_placed from customers as c join orders 
as o on c.customer_id=o.customer_id group by c.customer_name having count(distinct o.order_id)>1;
#Identify orders where payment amount ≠ calculated order value
select o.order_id,sum(oi.quantity*p.price) as order_value, sum(pay.amount) as payment_amount from 
orders as o join order_items as oi on o.order_id=oi.order_id join products as p on 
oi.product_id=p.product_id join payments as pay on o.order_id=pay.order_id group by o.order_id having
 sum(oi.quantity*p.price)!= sum(pay.amount);
#Calculate customer lifetime value (CLV)
select c.customer_id,c.customer_name,sum(p.amount) as customer_lifetime_value from customers as c 
join orders as o on c.customer_id=o.customer_id join payments as p on o.order_id=p.order_id group by
c.customer_id,c.customer_name order by sum(p.amount) desc;
#Get the second highest revenue-generating product
select p.product_id,p.product_name,sum(oi.quantity*p.price) as total_revenue from products as p 
join order_items as oi on p.product_id=oi.product_id group by p.product_id,p.product_name limit 1 offset 1;
