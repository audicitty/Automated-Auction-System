create database auction;
use auction;

create table admin
(
	admin_id int primary key auto_increment,
	admin_name varchar(25) not null, 
	admin_email varchar(25) not null,
	admin_password varchar(15) not null
);
select * from admin;

create table buyer
(
	buyer_id int primary key auto_increment,
	buyer_name varchar(20) not null,
	buyer_email varchar(25) not null,
	buyer_password varchar(15) not null,
	buyer_signup_date date not null
);
select * from buyer;	

create table seller
(
	seller_id int primary key auto_increment,
	seller_name varchar(20) not null,
	seller_email varchar(25) not null,
	seller_password varchar(15) not null,
	seller_signup_date date not null
);

select * from seller;
drop table product;
 CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_id INT NOT NULL,
    disputed BOOLEAN NOT NULL,
    product_added_date DATE NOT NULL,
    availability BOOLEAN NOT NULL,
    product_name VARCHAR(25) NOT NULL,
    product_time_limit DATE NOT NULL,
    product_current_price INT NOT NULL,
    product_selling_price INT,
    buyer_id INT,
    sold BOOLEAN NOT NULL,
    product_sold_date DATE,  -- New column
    dispute_reason VARCHAR(255),  -- New column
    FOREIGN KEY (seller_id) REFERENCES seller (seller_id)
);
select * from product;	
    
drop table bids;
CREATE TABLE bids (
    bid_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    buyer_id INT,
    bid_amount INT,
    bid_date DATE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (buyer_id) REFERENCES Buyer(buyer_id)
);
select * from bids;

-- Insert data into the product table
INSERT INTO product (seller_id, disputed, product_added_date, availability, product_name, product_time_limit, product_current_price, product_selling_price, buyer_id, sold, product_sold_date, dispute_reason) VALUES
(1, false, '2023-01-05', true, 'Product1', '2023-01-15', 100, 120, 1, false, NULL, NULL),
(2, true, '2023-01-06', true, 'Product2', '2023-01-16', 150, 180, 2, false, NULL, NULL),
(3, false, '2023-01-07', true, 'Product3', '2023-01-17', 80, 100, 1, false, NULL, NULL),
(4, false, '2023-01-08', true, 'Product4', '2023-01-18', 200, 220, 2, false, NULL, NULL),
(5, true, '2023-01-09', true, 'Product5', '2023-01-19', 120, 140, 1, false, NULL, NULL),
(1, false, '2023-01-11', true, 'Product6', '2023-01-20', 90, 110, 2, false, NULL, NULL),
(2, false, '2023-01-12', true, 'Product7', '2023-01-21', 110, 130, 1, false, NULL, NULL),
(3, true, '2023-01-13', true, 'Product8', '2023-01-22', 170, 200, 2, false, NULL, NULL),
(4, false, '2023-01-14', true, 'Product9', '2023-01-23', 130, 150, 1, false, NULL, NULL),
(5, false, '2023-01-15', true, 'Product10', '2023-01-24', 180, 200, 2, false, NULL, NULL);


INSERT INTO bids (product_id, buyer_id, bid_amount, bid_date) VALUES
(1, 3, 120, '2023-02-01'),
(2, 1, 180, '2023-02-02'),
(1, 4, 95, '2023-02-03'),
(3, 2, 220, '2023-02-04'),
(2, 3, 140, '2023-02-05'),
(1, 1, 110, '2023-02-06'),
(4, 4, 130, '2023-02-07'),
(3, 2, 200, '2023-02-08'),
(5, 3, 150, '2023-02-09'),
(1, 1, 200, '2023-02-10');

-- Insert random data into the bids table
INSERT INTO bids (product_id, buyer_id, bid_amount, bid_date) VALUES
(1, 3, 120, '2023-02-01'),
(2, 1, 180, '2023-02-02'),
(3, 4, 95, '2023-02-03'),
(4, 2, 220, '2023-02-04'),
(5, 3, 140, '2023-02-05'),
(6, 1, 110, '2023-02-06'),
(7, 4, 130, '2023-02-07'),
(8, 2, 200, '2023-02-08'),
(9, 3, 150, '2023-02-09'),
(10, 1, 200, '2023-02-10');


-- Insert data into the product table
INSERT INTO product (product_id, seller_id, disputed, product_added_date, availability, product_name, product_time_limit, product_current_price, product_selling_price, buyer_id, sold, product_sold_date, dispute_reason) VALUES
(1,1, false, '2023-01-05', true, 'Product1', '2023-01-15', 100, 120, 1, false, NULL, NULL),
(2,2, true, '2023-01-06', true, 'Product2', '2023-01-16', 150, 180, 2, false, NULL, NULL),
(3,3, false, '2023-01-07', true, 'Product3', '2023-01-17', 80, 100, 1, false, NULL, NULL),
(4,4, false, '2023-01-08', true, 'Product4', '2023-01-18', 200, 220, 2, false, NULL, NULL),
(5,5, true, '2023-01-09', true, 'Product5', '2023-01-19', 120, 140, 1, false, NULL, NULL),
(6,1, false, '2023-01-11', true, 'Product6', '2023-01-20', 90, 110, 2, false, NULL, NULL),
(7,2, false, '2023-01-12', true, 'Product7', '2023-01-21', 110, 130, 1, false, NULL, NULL),
(8,3, true, '2023-01-13', true, 'Product8', '2023-01-22', 170, 200, 2, false, NULL, NULL),
(9,4, false, '2023-01-14', true, 'Product9', '2023-01-23', 130, 150, 1, false, NULL, NULL),
(10,5, false, '2023-01-15', true, 'Product10', '2023-01-24', 180, 200, 2, false, NULL, NULL);


-- Inserting data into admin table
INSERT INTO admin (admin_id, admin_name, admin_email, admin_password) VALUES
(101,'Admin1', 'admin1@example.com', 'adminpass1'),
(102,'Admin2', 'admin2@example.com', 'adminpass2'),
(103,'Admin3', 'admin3@example.com', 'adminpass3'),
(104,'Admin4', 'admin4@example.com', 'adminpass4'),
(105,'Admin5', 'admin5@example.com', 'adminpass5'),
(106,'Admin6', 'admin6@example.com', 'adminpass6'),
(107,'Admin7', 'admin7@example.com', 'adminpass7'),
(108,'Admin8', 'admin8@example.com', 'adminpass8'),
(109,'Admin9', 'admin9@example.com', 'adminpass9'),
(110,'Admin10', 'admin10@example.com', 'adminpass10');

-- Inserting data into buyer table
INSERT INTO buyer (buyer_id, buyer_name, buyer_email, buyer_password, buyer_signup_date) VALUES
(1,'Buyer1', 'buyer1@example.com', 'buypass1', '2023-01-15'),
(2,'Buyer2', 'buyer2@example.com', 'buypass2', '2023-02-20'),
(3,'Buyer3', 'buyer3@example.com', 'buypass3', '2023-03-10'),
(4,'Buyer4', 'buyer4@example.com', 'buypass4', '2023-02-20'),
(5,'Buyer5', 'buyer5@example.com', 'buypass5', '2023-02-20'),
(6,'Buyer6', 'buyer6@example.com', 'buypass6', '2023-02-20'),
(7,'Buyer7', 'buyer7@example.com', 'buypass7', '2023-02-20'),
(8,'Buyer8', 'buyer8@example.com', 'buypass8', '2023-02-20'),
(9,'Buyer9', 'buyer9@example.com', 'buypass9', '2023-02-20'),
(10,'Buyer10', 'buyer10@example.com', 'buypass10', '2023-02-20');   

INSERT INTO seller (seller_id, seller_name, seller_email, seller_password, seller_signup_date) VALUES
(1,'SellerX', 'sellerX@example.com', 'sellpassX', '2023-04-05'),
(2,'SellerY', 'sellerY@example.com', 'sellpassY', '2023-05-12'),
(3,'SellerZ', 'sellerZ@example.com', 'sellpassZ', '2023-06-25'),
(4,'SellerP', 'sellerP@example.com', 'sellpassP', '2023-07-01'),
(5,'SellerQ', 'sellerQ@example.com', 'sellpassQ', '2023-08-05'),
(6,'SellerR', 'sellerR@example.com', 'sellpassR', '2023-09-10'),
(7,'SellerS', 'sellerS@example.com', 'sellpassS', '2023-10-20'),
(8,'SellerT', 'sellerT@example.com', 'sellpassT', '2023-11-05'),
(9,'SellerU', 'sellerU@example.com', 'sellpassU', '2023-12-15'),
(10,'SellerV', 'sellerV@example.com', 'sellpassV', '2023-12-31');
-- make the dispute in buyer such that only sold product can have dispute  ----- done
-- add see purchased item option in buyer 
-- variable varification 
-- make function to remove bid from the bids table  ----- done 
