create database project
go 


create table customer(
customer_id int not null
primary key (customer_id),
name varchar(255),
contact_add int,
address varchar (255)
);
insert into customer values
(1,'Ratul', 0111111,'dhaka'),
(2,'Rahim', 0111112,'Sylhet'),
(3,'Afif', 0111113,'chittagong'),
(4,'Nadim', 0111114,'barisal'),
(5,'abul', 0111115,'khulna');
select * from customer;

create table categroies(
category_id int not null,
primary key(category_id),
category_name varchar(255),
category_type varchar(255),
);
insert into categroies values
(1,'Mobile', 'electronics'),
(2,'T-shirts', 'clothings'),
(3,'Chocolates', 'vegtable'),
(4,'Monitor', 'computer-components'),
(5,'smart-watches', 'electronic-accessories');
select * from categroies;


create table shopping_Order(
order_id int not null,
primary key(order_id),
customer_id int not null,
foreign key (customer_id) references customer(customer_id),
Date date not null,
);
insert into shopping_Order values
(1, 3, '2022-04-22'),
(2, 5, '2022-04-21'),
(3, 2, '2022-04-25'),
(4, 1, '2022-04-10'),
(5, 4, '2022-04-05');
select * from shopping_Order;

create table product(
product_id varchar(255)not null,
primary key (product_id),
category_id int not null,
foreign key (category_id) references categroies(category_id),
product_name varchar(255),
);
insert into product values
(1, 1,'Pixel 6' ),
(2, 1,'Iphone 13 pro' ),
(3, 1,'Samsung S22 ultra' ),
(4, 2,' Calvin Klein Men’s Cotton Crew Neck T-Shirts' ),
(5, 2,'Uniqlo U Oversized T-Shirt' ),
(6, 2,' Nike Dri-Fit Rise 365 Running Tee' ),
(7, 3,' Kerbers Farm Hot Cocoa Mix' ),
(8, 3,' Starbucks Double Chocolate Hot Cocoa' ),
(9, 3,' Nestlé Rich Hot Chocolate Hot Cocoa Mix' ),
(10, 4,'Gigabyte G27Q' ),
(11, 4,'Dell S2722DGM' ),
(12, 4,'Acer Predator X38' ),
(13, 5,'Apple Watch 7' ),
(14, 5,'Samsung Galaxy Watch 4' ),
(15, 5,'Fitbit Versa 3' );
select * from product;

create table deliveries(
delivery_id int not null,
primary key(delivery_id),
customer_id int not null,
foreign key (customer_id) references customer(customer_id),
order_id int not null,
foreign key (order_id) references shopping_order(order_id),
product_id varchar(255) not null,
foreign key (product_id) references product(product_id),
Date date not null,
);
insert into deliveries values
(1, 1, 4, 10, '2022-04-15'),
(2, 2, 3, 5, '2022-04-28'),
(3, 3, 1, 1, '2022-04-25'),
(4, 4, 5, 3, '2022-04-08'),
(5, 5, 2, 8, '2022-04-24');
select * from deliveries; 

create table Seller(
seller_id int not null,
primary key(seller_id),
product_id varchar(255) not null,
foreign key (product_id) references product(product_id),
name varchar(255),
contact_add int not null,
);
insert into Seller values
(1, 10,'Rafid', 01010101),
(2, 5, 'Jubayer', 01010102),
(3, 1, 'mahmud', 01010103),
(4, 3, 'John', 01010104),
(5, 8, 'Shakib', 01010105);
select * from Seller;

create table payment(
payment_id int not null,
primary key(payment_id),
customer_id int not null,
foreign key (customer_id) references customer(customer_id),
Date date not null,
);
insert into payment values
(1, 1,'2022-04-15'),
(2, 2,'2022-04-28'),
(3, 3,'2022-04-25'),
(4, 4,'2022-04-08'),
(5, 5,'2022-04-24');
select * from payment;

create table transaction_report(
report_id int not null,
primary key(report_id),
customer_id int not null,
foreign key (customer_id) references customer(customer_id),
order_id int not null,
foreign key (order_id) references shopping_order(order_id),
product_id varchar(255) not null,
foreign key (product_id) references product(product_id),
payment_id int not null,
foreign key (payment_id) references payment(payment_id),
);
insert into transaction_report values
(1,1,4,10,1),
(2,2,3,5,2),
(3,3,1,1,3),
(4,4,5,3,4),
(5,5,2,8,5);
select * from transaction_report;




/* Question: Find names of all the products from category 4*/

select product_name,category_name, product.category_id
from product, categroies
where categroies.category_id = product.category_id
and categroies.category_id=3;






