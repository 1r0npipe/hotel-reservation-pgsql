BEGIN;

DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees(
    id INT GENERATED ALWAYS AS IDENTITY,
    fname VARCHAR(50) NOT NULL,
    lname VARCHAR(50) NOT NULL,
    salary numeric CHECK(salary > 0),
    phone VARCHAR(120),
    email VARCHAR(150),
    
    PRIMARY KEY (id)
);


INSERT INTO employees(fname,lname,salary, email, phone) VALUES
('Toto','Agassi',35000,'q@q.ru','05556678'),
('Onore','Sholts',45000,'a@q.ru','0123556678'),
('Canandu','Peten',75000,'b@q.ru','0551231256678'),
('Bobby','Voque',45000,'c@q.ru','0552334556678'),
('Clots','Buben',175000,'d@q.ru','05334556678'),
('Fra','Bernands',15000,'e@q.ru','053344556678'),
('Shandor','Gretsky',55000,'f@q.ru','053345556678'),
('Vudy','Remmington',49000,'g@q.ru','05533456678'),
('Gi','Bonapart',87000,'h@q.ru','05334556678'),
('Ji','Gegemon',145000,'i@q.ru','3345463'),
('Andrey','Galyano',15000,'k@q.ru','34526');

COMMIT;