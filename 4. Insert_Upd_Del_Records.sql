-- Database: test

-- DROP DATABASE IF EXISTS test;

CREATE DATABASE test
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'en-US'
    LC_CTYPE = 'en-US'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;



-- INSERT DATA INTO A TABLE

/*

INSERT INTO tablename (columnname1, columnname2, columnname3)
VALUES ('value1', 'value2', value3);

*/

INSERT INTO examples (first_name, last_name, email, nationality, age)
VALUES ('David', 'Mitchell', 'dmitch@gmail.com', 'GBR', 43);

INSERT INTO examples (first_name, last_name, email, nationality, age)
VALUES  ('Emily', 'Watson', 'ewatson@gmail.com', 'USA', 29),
		('Theo', 'Scott', 'tscott@gmail.com', 'AUS', 33),
		('Emily', 'Smith', 'esmith@gmail.com', 'GBR', 29),
		('Jim', 'Burr', 'jburr@gmail.com', 'USA', 54);

SELECT * FROM examples;

-- UPDATE DATA IN A TABLE

/*

UPDATE tablename
SET columnname = 'newvalue'
WHERE columnname = 'value';

*/

UPDATE examples
SET email = 'davidmitchell@gmail.com'
WHERE email = 'dmitch@gmail.com';

SELECT * FROM examples;

UPDATE examples
SET nationality =  'CAN'
WHERE nationality = 'USA';

UPDATE examples
SET first_name = 'James', age = 55
WHERE example_id = 5;

-- DELETE DATA IN A TABLE

/*

DELETE FROM tablename
WHERE columnname = 'value';

*/

DELETE FROM examples
WHERE example_id = 2;
SELECT * FROM examples;


DELETE FROM examples
WHERE nationality = 'GBR';
SELECT * FROM examples;

DELETE FROM examples;
SELECT * FROM examples;