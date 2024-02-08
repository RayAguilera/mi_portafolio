

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

INSERT INTO customer(id, first_name, last_name, email, password, address, phone)
	VALUES(548, "Gabriela", "Caporal", "gabygaby@correo.com", "123abc", "Enrique Segoviano #123, col. Centro", "4771234567");

INSERT INTO payment_method(id, type_payment, customer_id)
	VALUES(185, "Efectivo", 548);
    
START TRANSACTION;

SELECT *
FROM customer
WHERE id = 548;

SELECT *
FROM payment_method
WHERE customer_id = 548;

INSERT INTO purchase_order (id, payment_method_id, customer_id) VALUES (266, 185,
548);

SELECT *
FROM purchase_order
WHERE id = 266;

SELECT *
FROM product
WHERE id = 317;

INSERT INTO purchase_order_detail (id, amount, price_per_unit, product_description,
product_id, purchase_order_id)
VALUES (267, 5, 8890, 'Tamaño de pantalla real 57.5" x 33.3"', 555, 266666);

ROLLBACK;

SELECT *
FROM purchase_order
WHERE id = 266;

INSERT INTO purchase_order_detail (id, amount, price_per_unit, product_description,
product_id, purchase_order_id)
VALUES (267, 5, 8890, 'Tamaño de pantalla real 57.5" x 33.3"', 317, 266);

COMMIT;

SELECT *
FROM purchase_order
WHERE id = 266;

SELECT *
FROM purchase_order_detail
WHERE purchase_order_id = 266;

