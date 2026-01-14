INSERT INTO customers VALUES
(1,'Amit Sharma','amit@gmail.com','Delhi','2023-01-15'),
(2,'Kirti Mittal','riya@gmail.com','Jaipur','2023-02-10'),
(3,'Rahul Verma','rahul@gmail.com','Mumbai','2023-03-05'),
(4,'Neha Singh','neha@gmail.com','Bangalore','2023-04-20');
INSERT INTO products VALUES
(101,'iPhone 14','Electronics',70000),
(102,'Laptop','Electronics',60000),
(103,'Headphones','Accessories',2000),
(104,'Smart Watch','Accessories',5000);
INSERT INTO orders VALUES
(1001,1,'2023-05-01'),
(1002,2,'2023-05-03'),
(1003,1,'2023-06-10'),
(1004,3,'2023-06-15');
INSERT INTO order_items VALUES
(1,1001,101,1),
(2,1001,103,2),
(3,1002,102,1),
(4,1003,104,1),
(5,1004,103,3);
INSERT INTO payments VALUES
(1,1001,'Credit Card',74000,'2023-05-01'),
(2,1002,'UPI',60000,'2023-05-03'),
(3,1003,'Debit Card',5000,'2023-06-10'),
(4,1004,'UPI',6000,'2023-06-15');
