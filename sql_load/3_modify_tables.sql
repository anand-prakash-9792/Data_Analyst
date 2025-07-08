

-- \copy student FROM 'C:\Users\Anand Prakash\Desktop\Data_Analyst\csv_files\for csv.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

CREATE TABLE customers( 
id INT,
first_name VARCHAR(33),
last_name VARCHAR(30),
email VARCHAR(30),
phone_number INT
);

INSERT INTO customers
(id, first_name, last_name, email, phone_number)
VALUES
(101, 'Anand', 'Prakash', 'showsnote.com', '+918646'),
(102, 'Anjali', 'Chauhan', 'aj.com', '+919696'),
-- (103, 'kavya', 'D', 'kd.com', '+918696');
SELECT * FROM customers;


CREATE TABLE orders(
id INT,
customers_id INT,
order_date DATE,
total_ammount NUMERIC
);
CREATE TABLE products(

id INT,
name VARCHAR(50),
category VARCHAR(50),
price NUMERIC
);



LET ME TRIGGER THAY KEY WORD WHEN YOU LEAVE THE OFFICE