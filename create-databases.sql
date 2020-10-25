DROP DATABASE IF EXISTS sql_invoicing;
CREATE DATABASE sql_invoicing; 
\c sql_invoicing;

/* SET NAMES utf8 ; */
character_set_client := utf8mb4 ;

CREATE SEQUENCE payment_methods_seq;

CREATE TABLE payment_methods (
  payment_method_id smallint NOT NULL DEFAULT NEXTVAL ('payment_methods_seq'),
  name varchar(50) NOT NULL,
  PRIMARY KEY (payment_method_id)
)   ;

ALTER SEQUENCE payment_methods_seq RESTART WITH 5;
INSERT INTO payment_methods VALUES (1,'Credit Card');
INSERT INTO payment_methods VALUES (2,'Cash');
INSERT INTO payment_methods VALUES (3,'PayPal');
INSERT INTO payment_methods VALUES (4,'Wire Transfer');

CREATE TABLE clients (
  client_id int NOT NULL,
  name varchar(50) NOT NULL,
  address varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  state char(2) NOT NULL,
  phone varchar(50) DEFAULT NULL,
  PRIMARY KEY (client_id)
)  ;
INSERT INTO clients VALUES (1,'Vinte','3 Nevada Parkway','Syrac\c','NY','315-252-7305');
INSERT INTO clients VALUES (2,'Myworks','34267 Glendale Parkway','Huntington','WV','304-659-1170');
INSERT INTO clients VALUES (3,'Yadel','096 Pawling Parkway','San Francisco','CA','415-144-6037');
INSERT INTO clients VALUES (4,'Kwideo','81674 Westerfield Circle','Waco','TX','254-750-0784');
INSERT INTO clients VALUES (5,'Topiclounge','0863 Farmco Road','Portland','OR','971-888-9129');

CREATE TABLE invoices (
  invoice_id int NOT NULL,
  number varchar(50) NOT NULL,
  client_id int NOT NULL,
  invoice_total decimal(9,2) NOT NULL,
  payment_total decimal(9,2) NOT NULL DEFAULT '0.00',
  invoice_date date NOT NULL,
  due_date date NOT NULL,
  payment_date date DEFAULT NULL,
  PRIMARY KEY (invoice_id)
 ,
  CONSTRAINT FK_client_id FOREIGN KEY (client_id) REFERENCES clients (client_id) ON DELETE RESTRICT ON UPDATE CASCADE
)  ;

CREATE INDEX FK_client_id ON invoices (client_id);
INSERT INTO invoices VALUES (1,'91-953-3396',2,101.79,0.00,'2019-03-09','2019-03-29',NULL);
INSERT INTO invoices VALUES (2,'03-898-6735',5,175.32,8.18,'2019-06-11','2019-07-01','2019-02-12');
INSERT INTO invoices VALUES (3,'20-228-0335',5,147.99,0.00,'2019-07-31','2019-08-20',NULL);
INSERT INTO invoices VALUES (4,'56-934-0748',3,152.21,0.00,'2019-03-08','2019-03-28',NULL);
INSERT INTO invoices VALUES (5,'87-052-3121',5,169.36,0.00,'2019-07-18','2019-08-07',NULL);
INSERT INTO invoices VALUES (6,'75-587-6626',1,157.78,74.55,'2019-01-29','2019-02-18','2019-01-03');
INSERT INTO invoices VALUES (7,'68-093-9863',3,133.87,0.00,'2019-09-04','2019-09-24',NULL);
INSERT INTO invoices VALUES (8,'78-145-1093',1,189.12,0.00,'2019-05-20','2019-06-09',NULL);
INSERT INTO invoices VALUES (9,'77-593-0081',5,172.17,0.00,'2019-07-09','2019-07-29',NULL);
INSERT INTO invoices VALUES (10,'48-266-1517',1,159.50,0.00,'2019-06-30','2019-07-20',NULL);
INSERT INTO invoices VALUES (11,'20-848-0181',3,126.15,0.03,'2019-01-07','2019-01-27','2019-01-11');
INSERT INTO invoices VALUES (13,'41-666-1035',5,135.01,87.44,'2019-06-25','2019-07-15','2019-01-26');
INSERT INTO invoices VALUES (15,'55-105-9605',3,167.29,80.31,'2019-11-25','2019-12-15','2019-01-15');
INSERT INTO invoices VALUES (16,'10-451-8824',1,162.02,0.00,'2019-03-30','2019-04-19',NULL);
INSERT INTO invoices VALUES (17,'33-615-4694',3,126.38,68.10,'2019-07-30','2019-08-19','2019-01-15');
INSERT INTO invoices VALUES (18,'52-269-9803',5,180.17,42.77,'2019-05-23','2019-06-12','2019-01-08');
INSERT INTO invoices VALUES (19,'83-559-4105',1,134.47,0.00,'2019-11-23','2019-12-13',NULL);

CREATE SEQUENCE payments_seq;

CREATE TABLE payments (
  payment_id int NOT NULL DEFAULT NEXTVAL ('payments_seq'),
  client_id int NOT NULL,
  invoice_id int NOT NULL,
  date date NOT NULL,
  amount decimal(9,2) NOT NULL,
  payment_method smallint NOT NULL,
  PRIMARY KEY (payment_id)
 ,
  CONSTRAINT fk_payment_client FOREIGN KEY (client_id) REFERENCES clients (client_id) ON UPDATE CASCADE,
  CONSTRAINT fk_payment_invoice FOREIGN KEY (invoice_id) REFERENCES invoices (invoice_id) ON UPDATE CASCADE,
  CONSTRAINT fk_payment_payment_method FOREIGN KEY (payment_method) REFERENCES payment_methods (payment_method_id)
)   ;

ALTER SEQUENCE payments_seq RESTART WITH 9;

CREATE INDEX fk_client_id_idx ON payments (client_id);
CREATE INDEX fk_invoice_id_idx ON payments (invoice_id);
CREATE INDEX fk_payment_payment_method_idx ON payments (payment_method);
INSERT INTO payments VALUES (1,5,2,'2019-02-12',8.18,1);
INSERT INTO payments VALUES (2,1,6,'2019-01-03',74.55,1);
INSERT INTO payments VALUES (3,3,11,'2019-01-11',0.03,1);
INSERT INTO payments VALUES (4,5,13,'2019-01-26',87.44,1);
INSERT INTO payments VALUES (5,3,15,'2019-01-15',80.31,1);
INSERT INTO payments VALUES (6,3,17,'2019-01-15',68.10,1);
INSERT INTO payments VALUES (7,5,18,'2019-01-08',32.77,1);
INSERT INTO payments VALUES (8,5,18,'2019-01-08',10.00,2);


DROP DATABASE IF EXISTS sql_store;
CREATE DATABASE sql_store;
\c sql_store;

CREATE SEQUENCE products_seq;

CREATE TABLE products (
  product_id int NOT NULL DEFAULT NEXTVAL ('products_seq'),
  name varchar(50) NOT NULL,
  quantity_in_stock int NOT NULL,
  unit_price decimal(4,2) NOT NULL,
  PRIMARY KEY (product_id)
)   ;

ALTER SEQUENCE products_seq RESTART WITH 11;
INSERT INTO products VALUES (1,'Foam Dinner Plate',70,1.21);
INSERT INTO products VALUES (2,'Pork - Bacon,back Peameal',49,4.65);
INSERT INTO products VALUES (3,'Lettuce - Romaine, Heart',38,3.35);
INSERT INTO products VALUES (4,'Brocolinni - Gaylan, Chinese',90,4.53);
INSERT INTO products VALUES (5,'Sauce - Ranch Dressing',94,1.63);
INSERT INTO products VALUES (6,'Petit Baguette',14,2.39);
INSERT INTO products VALUES (7,'Sweet Pea Sprouts',98,3.29);
INSERT INTO products VALUES (8,'Island Oasis - Raspberry',26,0.74);
INSERT INTO products VALUES (9,'Longan',67,2.26);
INSERT INTO products VALUES (10,'Broom - Push',6,1.09);


CREATE SEQUENCE shippers_seq;

CREATE TABLE shippers (
  shipper_id smallint NOT NULL DEFAULT NEXTVAL ('shippers_seq'),
  name varchar(50) NOT NULL,
  PRIMARY KEY (shipper_id)
)   ;

ALTER SEQUENCE shippers_seq RESTART WITH 6;
INSERT INTO shippers VALUES (1,'Hettinger LLC');
INSERT INTO shippers VALUES (2,'Schinner-Predovic');
INSERT INTO shippers VALUES (3,'Satterfield LLC');
INSERT INTO shippers VALUES (4,'Mraz, Renner and Nolan');
INSERT INTO shippers VALUES (5,'Waters, Mayert and Prohaska');


CREATE SEQUENCE customers_seq;

CREATE TABLE customers (
  customer_id int NOT NULL DEFAULT NEXTVAL ('customers_seq'),
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  birth_date date DEFAULT NULL,
  phone varchar(50) DEFAULT NULL,
  address varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  state char(2) NOT NULL,
  points int NOT NULL DEFAULT '0',
  PRIMARY KEY (customer_id)
)   ;

ALTER SEQUENCE customers_seq RESTART WITH 11;
INSERT INTO customers VALUES (1,'Babara','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace','Waltham','MA',2273);
INSERT INTO customers VALUES (2,'Ines','Brushfield','1986-04-13','804-427-9456','14187 Commercial Trail','Hampton','VA',947);
INSERT INTO customers VALUES (3,'Freddi','Boagey','1985-02-07','719-724-7869','251 Springs Junction','Colorado Springs','CO',2967);
INSERT INTO customers VALUES (4,'Ambur','Roseburgh','1974-04-14','407-231-8017','30 Arapahoe Terrace','Orlando','FL',457);
INSERT INTO customers VALUES (5,'Clemmie','Betchley','1973-11-07',NULL,'5 Spohn Circle','Arlington','TX',3675);
INSERT INTO customers VALUES (6,'Elka','Twiddell','1991-09-04','312-480-8498','7 Manley Drive','Chicago','IL',3073);
INSERT INTO customers VALUES (7,'Ilene','Dowson','1964-08-30','615-641-4759','50 Lillian Crossing','Nashville','TN',1672);
INSERT INTO customers VALUES (8,'Thacher','Naseby','1993-07-17','941-527-3977','538 Mosinee Center','Sarasota','FL',205);
INSERT INTO customers VALUES (9,'Romola','Rumgay','1992-05-23','559-181-3744','3520 Ohio Trail','Visalia','CA',1486);
INSERT INTO customers VALUES (10,'Levy','Mynett','1969-10-13','404-246-3370','68 Lawn Avenue','Atlanta','GA',796);


CREATE TABLE order_stat\cs (
  order_status_id smallint NOT NULL,
  name varchar(50) NOT NULL,
  PRIMARY KEY (order_status_id)
)  ;
INSERT INTO order_stat\cs VALUES (1,'Processed');
INSERT INTO order_stat\cs VALUES (2,'Shipped');
INSERT INTO order_stat\cs VALUES (3,'Delivered');


CREATE SEQUENCE orders_seq;

CREATE TABLE orders (
  order_id int NOT NULL DEFAULT NEXTVAL ('orders_seq'),
  customer_id int NOT NULL,
  order_date date NOT NULL,
  status smallint NOT NULL DEFAULT '1',
  comments varchar(2000) DEFAULT NULL,
  shipped_date date DEFAULT NULL,
  shipper_id smallint DEFAULT NULL,
  PRIMARY KEY (order_id)
 ,
  CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON UPDATE CASCADE,
  CONSTRAINT fk_orders_order_stat\cs FOREIGN KEY (status) REFERENCES order_stat\cs (order_status_id) ON UPDATE CASCADE,
  CONSTRAINT fk_orders_shippers FOREIGN KEY (shipper_id) REFERENCES shippers (shipper_id) ON UPDATE CASCADE
)   ;

ALTER SEQUENCE orders_seq RESTART WITH 11;

CREATE INDEX fk_orders_customers_idx ON orders (customer_id);
CREATE INDEX fk_orders_shippers_idx ON orders (shipper_id);
CREATE INDEX fk_orders_order_stat\cs_idx ON orders (status);
INSERT INTO orders VALUES (1,6,'2019-01-30',1,NULL,NULL,NULL);
INSERT INTO orders VALUES (2,7,'2018-08-02',2,NULL,'2018-08-03',4);
INSERT INTO orders VALUES (3,8,'2017-12-01',1,NULL,NULL,NULL);
INSERT INTO orders VALUES (4,2,'2017-01-22',1,NULL,NULL,NULL);
INSERT INTO orders VALUES (5,5,'2017-08-25',2,'','2017-08-26',3);
INSERT INTO orders VALUES (6,10,'2018-11-18',1,'Aliquam erat volutpat. In congue.',NULL,NULL);
INSERT INTO orders VALUES (7,2,'2018-09-22',2,NULL,'2018-09-23',4);
INSERT INTO orders VALUES (8,5,'2018-06-08',1,'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',NULL,NULL);
INSERT INTO orders VALUES (9,10,'2017-07-05',2,'Nulla mollis molestie lorem. Quisque ut erat.','2017-07-06',1);
INSERT INTO orders VALUES (10,6,'2018-04-22',2,NULL,'2018-04-23',2);


CREATE SEQUENCE order_items_seq;

CREATE TABLE order_items (
  order_id int NOT NULL DEFAULT NEXTVAL ('order_items_seq'),
  product_id int NOT NULL,
  quantity int NOT NULL,
  unit_price decimal(4,2) NOT NULL,
  PRIMARY KEY (order_id,product_id)
 ,
  CONSTRAINT fk_order_items_orders FOREIGN KEY (order_id) REFERENCES orders (order_id) ON UPDATE CASCADE,
  CONSTRAINT fk_order_items_products FOREIGN KEY (product_id) REFERENCES products (product_id) ON UPDATE CASCADE
)   ;

ALTER SEQUENCE order_items_seq RESTART WITH 11;

CREATE INDEX fk_order_items_products_idx ON order_items (product_id);
INSERT INTO order_items VALUES (1,4,4,3.74);
INSERT INTO order_items VALUES (2,1,2,9.10);
INSERT INTO order_items VALUES (2,4,4,1.66);
INSERT INTO order_items VALUES (2,6,2,2.94);
INSERT INTO order_items VALUES (3,3,10,9.12);
INSERT INTO order_items VALUES (4,3,7,6.99);
INSERT INTO order_items VALUES (4,10,7,6.40);
INSERT INTO order_items VALUES (5,2,3,9.89);
INSERT INTO order_items VALUES (6,1,4,8.65);
INSERT INTO order_items VALUES (6,2,4,3.28);
INSERT INTO order_items VALUES (6,3,4,7.46);
INSERT INTO order_items VALUES (6,5,1,3.45);
INSERT INTO order_items VALUES (7,3,7,9.17);
INSERT INTO order_items VALUES (8,5,2,6.94);
INSERT INTO order_items VALUES (8,8,2,8.59);
INSERT INTO order_items VALUES (9,6,5,7.28);
INSERT INTO order_items VALUES (10,1,10,6.01);
INSERT INTO order_items VALUES (10,9,9,4.28);

CREATE TABLE sql_store.order_item_notes (
  note_id INT NOT NULL,
  order_Id INT NOT NULL,
  product_id INT NOT NULL,
  note VARCHAR(255) NOT NULL,
  PRIMARY KEY (note_id));

INSERT INTO order_item_notes (note_id, order_Id, product_id, note) VALUES ('1', '1', '2', 'first note');
INSERT INTO order_item_notes (note_id, order_Id, product_id, note) VALUES ('2', '1', '2', 'second note');


DROP DATABASE IF EXISTS sql_hr;
CREATE DATABASE sql_hr;
\c sql_hr;


CREATE TABLE offices (
  office_id int NOT NULL,
  address varchar(50) NOT NULL,
  city varchar(50) NOT NULL,
  state varchar(50) NOT NULL,
  PRIMARY KEY (office_id)
)  ;
INSERT INTO offices VALUES (1,'03 Reinke Trail','Cincinnati','OH');
INSERT INTO offices VALUES (2,'5507 Becker Terrace','New York City','NY');
INSERT INTO offices VALUES (3,'54 Northland Court','Richmond','VA');
INSERT INTO offices VALUES (4,'08 South Crossing','Cincinnati','OH');
INSERT INTO offices VALUES (5,'553 Maple Drive','Minneapolis','MN');
INSERT INTO offices VALUES (6,'23 North Plaza','Aurora','CO');
INSERT INTO offices VALUES (7,'9658 Wayridge Court','Boise','ID');
INSERT INTO offices VALUES (8,'9 Grayhawk Trail','New York City','NY');
INSERT INTO offices VALUES (9,'16862 Westend Hill','Knoxville','TN');
INSERT INTO offices VALUES (10,'4 Bluestem Parkway','Savannah','GA');



CREATE TABLE employees (
  employee_id int NOT NULL,
  first_name varchar(50) NOT NULL,
  last_name varchar(50) NOT NULL,
  job_title varchar(50) NOT NULL,
  salary int NOT NULL,
  reports_to int DEFAULT NULL,
  office_id int NOT NULL,
  PRIMARY KEY (employee_id)
 ,
  CONSTRAINT fk_employees_managers FOREIGN KEY (reports_to) REFERENCES employees (employee_id),
  CONSTRAINT fk_employees_offices FOREIGN KEY (office_id) REFERENCES offices (office_id) ON UPDATE CASCADE
)  ;

CREATE INDEX fk_employees_offices_idx ON employees (office_id);
CREATE INDEX fk_employees_employees_idx ON employees (reports_to);
INSERT INTO employees VALUES (37270,'Yovonnda','Magrannell','Executive Secretary',63996,NULL,10);
INSERT INTO employees VALUES (33391,'Darcy','Nortunen','Account Executive',62871,37270,1);
INSERT INTO employees VALUES (37851,'Sayer','Matterson','Statistician III',98926,37270,1);
INSERT INTO employees VALUES (40448,'Mindy','Crissil','Staff Scientist',94860,37270,1);
INSERT INTO employees VALUES (56274,'Keriann','Alloisi','VP Marketing',110150,37270,1);
INSERT INTO employees VALUES (63196,'Alaster','Scutchin','Assistant Professor',32179,37270,2);
INSERT INTO employees VALUES (67009,'North','de Clerc','VP Product Management',114257,37270,2);
INSERT INTO employees VALUES (67370,'Elladine','Rising','Social Worker',96767,37270,2);
INSERT INTO employees VALUES (68249,'Nisse','Voysey','Financial Advisor',52832,37270,2);
INSERT INTO employees VALUES (72540,'Guthrey','Iacopetti','Office Assistant I',117690,37270,3);
INSERT INTO employees VALUES (72913,'Kass','Hefferan','Computer Systems Analyst IV',96401,37270,3);
INSERT INTO employees VALUES (75900,'Virge','Goodrum','Information Systems Manager',54578,37270,3);
INSERT INTO employees VALUES (76196,'Mirilla','Janowski','Cost Accountant',119241,37270,3);
INSERT INTO employees VALUES (80529,'Lynde','Aronson','Junior Executive',77182,37270,4);
INSERT INTO employees VALUES (80679,'Mildrid','Sokale','Geologist II',67987,37270,4);
INSERT INTO employees VALUES (84791,'Hazel','Tarbert','General Manager',93760,37270,4);
INSERT INTO employees VALUES (95213,'Cole','Kesterton','Pharmacist',86119,37270,4);
INSERT INTO employees VALUES (96513,'Theresa','Binney','Food Chemist',47354,37270,5);
INSERT INTO employees VALUES (98374,'Estrellita','Daleman','Staff Accountant IV',70187,37270,5);
INSERT INTO employees VALUES (115357,'Ivy','Fearey','Structural Engineer',92710,37270,5);


DROP DATABASE IF EXISTS sql_inventory;
CREATE DATABASE sql_inventory;
\c sql_inventory;


CREATE SEQUENCE products_seq;

CREATE TABLE products (
  product_id int NOT NULL DEFAULT NEXTVAL ('products_seq'),
  name varchar(50) NOT NULL,
  quantity_in_stock int NOT NULL,
  unit_price decimal(4,2) NOT NULL,
  PRIMARY KEY (product_id)
)   ;

ALTER SEQUENCE products_seq RESTART WITH 11;
INSERT INTO products VALUES (1,'Foam Dinner Plate',70,1.21);
INSERT INTO products VALUES (2,'Pork - Bacon,back Peameal',49,4.65);
INSERT INTO products VALUES (3,'Lettuce - Romaine, Heart',38,3.35);
INSERT INTO products VALUES (4,'Brocolinni - Gaylan, Chinese',90,4.53);
INSERT INTO products VALUES (5,'Sauce - Ranch Dressing',94,1.63);
INSERT INTO products VALUES (6,'Petit Baguette',14,2.39);
INSERT INTO products VALUES (7,'Sweet Pea Sprouts',98,3.29);
INSERT INTO products VALUES (8,'Island Oasis - Raspberry',26,0.74);
INSERT INTO products VALUES (9,'Longan',67,2.26);
INSERT INTO products VALUES (10,'Broom - Push',6,1.09);


