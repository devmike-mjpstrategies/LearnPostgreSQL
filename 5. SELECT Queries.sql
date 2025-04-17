/* __  __ ___ _  __ _____ 
|  \/  |_ _| |/ /| ____|
| |\/|  | |  ' / |  _|  
| |  | || |  . \ | |___ 
|_|  |_|___|_|\_\|_____|
*/                        

/*
THIS IS WHAT YOU ARE GOING TO LEARN:
	1. Retrieve data from a table using SELECT queries
	2. Learn how to use WHERE clauses and logical operators (<, <=, >, >=)
	3. Learn how to use IN/NOT IN, LIKE, and BETWEEN
	4. Other filters like % and _
	5. Order the data (ORDER BY), LIMIT the data, and retrieving DISTINCT data
	6. Learn how to deal with NULL values
	7. Set column name alias and use concatenation (CONCAT)
*/

-- BASIC SELECT QUERY
-- You can simply select all records from the table.
SELECT * FROM directors;

-- Or you can select a particular column from the table.
SELECT first_name FROM directors;

-- Or you can select multiple columns from the table.
SELECT first_name, last_name FROM directors;

-- And you can keep this chain going by listing columns separated by commas.
SELECT first_name, last_name, nationality FROM directors;


-- Retrieving data with a WHERE clause

/*
SELECT columnname FROM tablename
WHERE columnname = 'value';
*/

-- You can filter your table by adding a WHERE statement.
SELECT * FROM movies
WHERE age_certificate = '15';

-- You can chain statements using AND to make a finer-grained filter.
SELECT * FROM movies
WHERE age_certificate = '15'
AND movie_lang = 'Chinese';

SELECT * FROM movies
WHERE movie_lang = 'English'
AND age_certificate = '15'
AND director_id =27;

-- You can chain statements using OR to make a larger-grained filter.
SELECT * FROM movies
WHERE age_certificate = '15'
OR movie_lang = 'Chinese';


-- Using logical operators (>, >=, <, <=)

--I think these are entirely self-explanatory...
SELECT movie_name, movie_length FROM movies
WHERE movie_length < 120;

SELECT movie_name, movie_length FROM movies
WHERE movie_length <= 120;

SELECT * FROM movies
WHERE release_date > '1999-12-31'; 

SELECT * FROM movies
WHERE release_date < '1999-12-31';

-- When you use them on strings, the return is based on alphabetical order.
SELECT * FROM movies
WHERE movie_lang <= 'English';


--CHALLENGE

--1. Select the movie_name and release_date of every movie.
SELECT movie_name, release_date FROM movies;

--2. Select the first and last names of all American directors.
SELECT first_name, last_name, nationality FROM directors
WHERE nationality = 'American';

--3. Select all male actors born after the 1st of January 1970.
SELECT * from actors
WHERE gender = 'M'
AND date_of_birth > '1970-01-01';

--4. Select the names of all movies which are over 90-  minutes long and movie languge is English.
SELECT movie_name FROM movies
WHERE movie_length > 90
AND movie_lang = 'English';


-- Using IN and NOT IN

/*
SELECT columnname1, columnname2 FROM tablename
WHERE columnname3 IN ('value1'), ('value2');
*/

-- If you want to have "chains of WHERE's", use the syntax above. Note that '=' is replaced with 'IN'.
-- Also note that you have to put your list in parens.
-- Also note that strings are wrapped in single quotes while integers aren't.

SELECT  first_name, last_name FROM actors
WHERE first_name = 'Bruce';

SELECT  first_name, last_name FROM actors
WHERE first_name IN ('Bruce', 'John');

SELECT  first_name, last_name FROM actors
WHERE first_name IN ('Bruce', 'John', 'Peter');

SELECT  first_name, last_name FROM actors
WHERE first_name NOT IN ('Bruce', 'John', 'Peter');

SELECT actor_id, first_name, last_name FROM actors
WHERE actor_id IN (2,3,4,5,6,8);

SELECT actor_id, first_name, last_name FROM actors
WHERE actor_id NOT IN (2,3,4,5,6,8);


-- Using LIKE with % and _

/*
SELECT columnname FROM table
WHERE columnname LIKE '%pattern%';

SELECT columnname FROM table
WHERE columnname LIKE '_pattern_';
*/

-- Use % if the total length is unknown. 
-- Use _ if you want to specify exactly a number of characters.

-- Any first name starting with 'P'.
SELECT * FROM actors
WHERE first_name LIKE 'P%';

-- Any actor's first name of exactly three letters that starts with 'Pe'.
SELECT * FROM actors
WHERE first_name LIKE 'Pe_';

-- Any actor's first name that ends in 'r'.
SELECT * FROM actors
WHERE first_name LIKE '%r';

-- Any actor's first name that contains an 'r'.
SELECT * FROM actors
WHERE first_name LIKE '%rl%';

-- etc.
SELECT * FROM actors
WHERE first_name LIKE '__rl__';


-- Selecting data where a column is between 2 values

/*
SELECT columname1, columnname2 FROM tablename
WHERE columname3 BETWEEN value1 AND value2;
*/

SELECT * from movies;

SELECT movie_name, release_date FROM movies
WHERE release_date BETWEEN '1995-01-01' AND '1999-12-31';

SELECT movie_name, movie_length FROM movies
WHERE movie_length BETWEEN 90 AND 120;

SELECT movie_name, movie_lang FROM movies
WHERE movie_lang BETWEEN 'Eo' AND 'P';


--CHALLENGE

--1. Select the movie names and movie language of all movies with a movie language of English, Spanish or Korean.

SELECT movie_name, movie_lang FROM movies
WHERE movie_lang IN ('English', 'Spanish', 'Korean');

--2. Select the first and last names of the actors whose last name begins with M and were born betwen 01/01/1940 and 31/12/1969.
SELECT * FROM actors;

SELECT first_name, last_name FROM actors
WHERE last_name LIKE 'M%'
AND date_of_birth BETWEEN '01/01/1940' AND '12/31/1969';

--3. Select the first and last names of the directors with nationality of British, French or German born between 01/01/1950 and 31/12/1980.
SELECT * FROM directors;

SELECT first_name, last_name FROM directors
WHERE nationality IN ('British', 'French', 'German')
AND date_of_birth BETWEEN '01/01/1950' AND '12/31/1980';


-- Ordering the results returned

/*
SELECT columnname1, columnname2 FROM tablename
ORDER BY columnname3;
*/

SELECT * FROM actors;

-- Order naturally in ascending ('ASC') order (unstated)
SELECT first_name, last_name, date_of_birth FROM actors
ORDER BY first_name;

-- Stated in descending ('DESC') order
SELECT first_name, last_name, date_of_birth FROM actors
ORDER BY first_name DESC;

-- Works on integers, too!
SELECT actor_id, first_name, last_name, date_of_birth FROM actors
ORDER BY actor_id DESC;

-- Add as many WHERE clauses as you need
SELECT actor_id, first_name, last_name, date_of_birth FROM actors
WHERE gender = 'F'
ORDER BY date_of_birth DESC;


-- Limiting the number of records returned

/*
SELECT columnname1, columnname2 FROM tablename
LIMIT N;
*/

SELECT * FROM movie_revenues
ORDER BY revenue_id
LIMIT 5;


SELECT * FROM movie_revenues
ORDER BY revenue_id
LIMIT 5 OFFSET 5;

-- Using Fetch

/*
SELECT column1 FROM table1
FETCH FIRST 1 ROW ONLY;
*/

SELECT movie_id, movie_name FROM movies
FETCH FIRST ROW ONLY;

SELECT movie_id, movie_name FROM movies
FETCH FIRST 1 ROW ONLY;

SELECT movie_id, movie_name FROM movies
FETCH FIRST 10 ROW ONLY;

--When using FETCH and OFFSET together, make sure you set the OFFSET first.
SELECT movie_id, movie_name FROM movies
OFFSET 8
FETCH FIRST 10 ROW ONLY;

-- Distinct Values

/*
SELECT DISTINCT columnname FROM tablename;
*/

SELECT DISTINCT movie_lang FROM movies
ORDER BY movie_lang;

SELECT DISTINCT movie_lang, age_certificate FROM movies
ORDER BY movie_lang;

SELECT DISTINCT * FROM movies
ORDER BY movie_lang;


-- CHALLENGE

--1. Select the American directors ordered from oldest to youngest.
SELECT * FROM directors
WHERE nationality = 'American'
ORDER BY date_of_birth;

--2. Return the distinct nationalities from the directors table.
SELECT DISTINCT nationality FROM directors;

--3. Return the first names, last names and date of births of the 10 youngest female actors.
SELECT first_name, last_name, date_of_birth FROM actors
WHERE gender = 'F'
ORDER BY date_of_birth DESC
-- FETCH FIRST 10 ROW ONLY;
LIMIT 10;

-- Dealing with NULL values

/*
SELECT * FROM tablename
WHERE columname is NULL;

SELECT * FROM tablename
WHERE columnname IS NOT NULL;
*/

SELECT * FROM actors
WHERE date_of_birth is NULL;

SELECT * FROM actors
WHERE date_of_birth IS NOT NULL;

SELECT * FROM movie_revenues
WHERE domestic_takings IS NOT NULL
ORDER BY domestic_takings DESC;

SELECT * FROM movie_revenues
WHERE international_takings IS NULL;

-- Setting a column name alias

/*
SELECT columname AS new_columnname FROM tablename;
*/

SELECT last_name AS surname FROM directors;

SELECT last_name AS surname FROM directors
WHERE last_name = 'Anderson'; -- 'surname' alias doesn't work!


SELECT last_name AS surname FROM directors
WHERE last_name LIKE 'A%'
ORDER BY surname; 
 
-- But you can use it in an ORDER BY clause. This relates to the order in which Postgres
-- executes steps. WHERE clauses are executed before the alias is applied. ORDER BY clauses 
-- are executed after.
-- Using concatenate

/*
SELECT 'string1' || 'string2' AS new_string;

SELECT CONCAT(column1, column2) AS new_column FROM tablename;

SELECT CONCAT_WS(' ', column1, column2) AS new_column FROM tablename;
*/

--You can use double-pipes '||' to concatenate strings:
SELECT 'concat' || 'together' AS new_string;
SELECT 'concat' || ' ' || 'together' AS new_string;

-- But more usefully, the CONCAT command applies to columns:
SELECT CONCAT(first_name, last_name) AS full_name FROM actors;

SELECT CONCAT(first_name,' : ', last_name) AS full_name FROM actors;

SELECT CONCAT_WS(' ', first_name, last_name, date_of_birth) AS full_name FROM actors;

-- CHALLENGE
--1. Return the top 3 movies with the highest international takings.
SELECT * FROM movie_revenues
WHERE international_takings IS NOT NULL
ORDER BY international_takings DESC
LIMIT 3;

--2. Concatenate the first and last names of the directors, separated by a space, and this new column full_name.
SELECT CONCAT_WS(' ', first_name, last_name) AS full_name FROM directors;

--3. Return the actors with missing first_names or missing date_of_births.
SELECT * FROM actors
WHERE first_name IS NULL
OR date_of_birth IS NULL;

