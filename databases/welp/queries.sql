CREATE TABLE reviews (
id INTERGER PRIMARY KEY,
stars INT,
comment VARCHAR(255),
business_id INT,
user_id INT,
FOREIGN KEY (business_id) REFERENCES business(id),
FOREIGN KEY (user_id) REFERENCES users(id)
);
