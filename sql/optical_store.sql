CREATE SCHEMA IF NOT EXISTS optical_store;
USE optical_store;

CREATE TABLE IF NOT EXISTS optical_store.ADDRESS(
id_address INT NOT NULL AUTO_INCREMENT,
street VARCHAR(45) NOT NULL,
number VARCHAR(45) NOT NULL,
floor VARCHAR(45) NULL,
door VARCHAR(45) NULL,
city VARCHAR(45) NOT NULL,
zip_code VARCHAR(45) NULL,
country VARCHAR(45) NOT NULL,
CONSTRAINT pk_address PRIMARY KEY (id_address));

CREATE TABLE IF NOT EXISTS optical_store.SUPPLIER(
id_supplier INT NOT NULL AUTO_INCREMENT,
name VARCHAR(45) NOT NULL,
phone_number VARCHAR(45) NOT NULL,
fax VARCHAR(45) NULL,
nif VARCHAR(45) NOT NULL,
id_address INT NOT NULL,
CONSTRAINT pk_supplier PRIMARY KEY (id_supplier),
CONSTRAINT fk_supplier_address FOREIGN KEY (id_address) REFERENCES optical_store.ADDRESS(id_address));

CREATE TABLE IF NOT EXISTS optical_store.BRAND(
id_brand INT NOT NULL AUTO_INCREMENT,
name VARCHAR(45) NOT NULL,
id_supplier INT NOT NULL,
CONSTRAINT pk_brand PRIMARY KEY (id_brand),
CONSTRAINT fk_brand_supplier FOREIGN KEY (id_supplier) REFERENCES optical_store.SUPPLIER (id_supplier));

CREATE TABLE IF NOT EXISTS optical_store.EMPLOYEE(
id_employee INT NOT NULL AUTO_INCREMENT,
name VARCHAR(45) NOT NULL,
surname VARCHAR(45) NOT NULL,
CONSTRAINT pk_employee PRIMARY KEY (id_employee));

CREATE TABLE IF NOT EXISTS optical_store.CUSTOMER(
id_customer INT NOT NULL AUTO_INCREMENT,
name VARCHAR(45) NOT NULL,
id_address INT NOT NULL,
phone_number VARCHAR(45) NOT NULL,
email VARCHAR(45) NULL,
registration_date DATE NOT NULL,
id_customer_recommended INT NULL,
CONSTRAINT pk_customer PRIMARY KEY (id_customer),
CONSTRAINT fk_customer_address FOREIGN KEY (id_address) REFERENCES optical_store.ADDRESS (id_address),
CONSTRAINT fk_customer_recommended FOREIGN KEY (id_customer_recommended) REFERENCES optical_store.CUSTOMER (id_customer)
ON DELETE SET NULL);

CREATE TABLE IF NOT EXISTS optical_store.GLASSES(
id_glasses INT NOT NULL AUTO_INCREMENT,
left_lens_graduation DECIMAL(4,2) NOT NULL,
right_lens_graduation DECIMAL(4,2) NOT NULL,
frame_type ENUM('RIMLESS', 'ACETATE', 'METALLIC'),
frame_color VARCHAR(45) NOT NULL,
left_glass_color VARCHAR(45) NOT NULL,
right_glass_color VARCHAR(45) NOT NULL,
price DECIMAL(6,2) NOT NULL,
id_brand INT NOT NULL,
CONSTRAINT pk_glasses PRIMARY KEY (id_glasses),
CONSTRAINT fk_glasses_brand FOREIGN KEY (id_brand) REFERENCES optical_store.BRAND (id_brand));

CREATE TABLE IF NOT EXISTS optical_store.SALE(
id_sale INT NOT NULL AUTO_INCREMENT,
id_glasses INT NOT NULL,
id_customer INT NOT NULL,
id_employee INT NOT NULL,
sale_date DATE NOT NULL,
price DECIMAL(4,2) NOT NULL,
CONSTRAINT pk_sale PRIMARY KEY (id_sale),
CONSTRAINT fk_sale_glasses FOREIGN KEY (id_glasses) REFERENCES optical_store.GLASSES (id_glasses)
ON DELETE CASCADE 
ON UPDATE CASCADE,
CONSTRAINT fk_sale_customer FOREIGN KEY (id_customer) REFERENCES optical_store.CUSTOMER (id_customer)
ON DELETE RESTRICT
ON UPDATE CASCADE,
CONSTRAINT fk_sale_employee FOREIGN KEY (id_employee) REFERENCES optical_store.EMPLOYEE (id_employee)
ON DELETE RESTRICT
ON UPDATE CASCADE);

