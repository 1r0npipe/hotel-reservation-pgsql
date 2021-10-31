BEGIN;

CREATE TYPE gps AS (latitude real, longtitude real);

DROP TABLE IF EXISTS hotel CASCADE;
CREATE TABLE hotel (
	id INT GENERATED ALWAYS AS IDENTITY,
    hotel_id INT NOT NULL,
	hname  VARCHAR(100) NOT NULL,
	opened_at DATE,
	rating INTEGER NOT NULL,
	active BOOLEAN NOT NULL,
    loc gps UNIQUE NOT NULL,
    zip_code VARCHAR(12) NOT NULL,
	
	PRIMARY KEY(id)
);

DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer(
    id INT GENERATED ALWAYS AS IDENTITY,
    customer_id INT UNIQUE NOT NULL,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),

    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees(
    id INT GENERATED ALWAYS AS IDENTITY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    salary numeric CHECK(salary > 0),
    phone VARCHAR(20),
    email VARCHAR(50),
    
    PRIMARY KEY (id),
);

DROP TABLE IF EXISTS reservation CASCADE;
CREATE TABLE reservation (
    id INT GENERATED ALWAYS AS IDENTITY,
    customer_id INT REFERENCES customer (id),
    hotel_id INT REFERENCES hotel (id),
    resmanager_id INT REFERENCES employee (id),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    duration INT,
    guest_amount INT,

    PRIMARY KEY (id),
    constraint reference_customer_id FOREIGN KEY (customer_id) references customer (id) on delete restrict,
    constraint reference_hotel_id FOREIGN KEY (hotel_id) references hotel (id) on delete restrict,
    constraint reference_resmanager_id FOREIGN KEY (resmanager_id) references employee (id) on delete restrict        
);

COMMIT;