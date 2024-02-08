

CREATE DATABASE store;

USE store;

CREATE TABLE store(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL
    );
    
USE store;

CREATE TABLE product(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL,
    description VARCHAR(50) NULL
    );
    
ALTER TABLE product ADD store_id INT NOT NULL;

ALTER TABLE product ADD CONSTRAINT fk_store_product FOREIGN KEY (store_id) REFERENCES store(id);

USE store;

CREATE TABLE customer(
	id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    address VARCHAR(50) NULL
    );
    
ALTER TABLE customer ADD phone VARCHAR(10) NULL;

CREATE TABLE payment_method(
	id INT NOT NULL PRIMARY KEY,
    type_payment VARCHAR(50) NOT NULL
    );

ALTER TABLE payment_method ADD customer_id INT NOT NULL;
ALTER TABLE payment_method ADD CONSTRAINT fk_payment_method_customer FOREIGN KEY (id) REFERENCES customer(id);

CREATE TABLE purchase_order(
id INT NOT NULL PRIMARY KEY,
 payment_method_id INT NOT NULL,
 customer_id INT NOT NULL
);

ALTER TABLE purchase_order DROP COLUMN payment_method_id;
ALTER TABLE purchase_order DROP COLUMN customer_id;
ALTER TABLE purchase_order ADD payment_method_id INT NOT NULL;
ALTER TABLE purchase_order ADD CONSTRAINTcustomer_id INT NOT NULL;

    
CREATE TABLE purchase_order_detail(
	id INT NOT NULL PRIMARY KEY,
	amount INT NOT NULL,
	price_per_unit DOUBLE NOT NULL,
	product_description VARCHAR(150) NULL
);

ALTER TABLE purchase_order ADD CONSTRAINT fk_payment_method_id FOREIGN KEY (id) REFERENCES payment_method(id);
ALTER TABLE purchase_order ADD CONSTRAINT fk_customer_id FOREIGN KEY (id) REFERENCES customer(id);

ALTER TABLE purchase_order_detail ADD CONSTRAINT fk_product_id FOREIGN KEY (id) REFERENCES product(id);
ALTER TABLE purchase_order_detail ADD CONSTRAINT fk_purchase_order_id FOREIGN KEY (id) REFERENCES purchase_order(id);











    



    

    



