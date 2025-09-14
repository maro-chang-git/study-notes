SQL = Structed Query Language -> Relational Database

Example of a query
```sql
SELECT DISTINCT column, AGG_FUNC(_column_or_expression_), … 
FROM mytable 
JOIN another_table 
	ON mytable.column = another_table.column 
	WHERE _constraint_expression_ 
	GROUP BY column 
	HAVING _constraint_expression_ 
	ORDER BY _column_ ASC/DESC 
	LIMIT _count_ OFFSET _COUNT_;
```

## SELECT
It's the basic statement ***what data*** we're looking for. 

```sql
SELECT * FROM mytable;

SELECT column_name, col_a, col_b FROM mytable;
```

#### AS
New name for a selected column
```sql
SELECT column AS better_column_name;

SELECT name AS employees;

SELECT particle_speed /2.0 AS half_particle_speed
FROM physics_data
WHERE ABS(particle_position) * 10.0 > 500;
```

#### Aggregate Functions
##### COUNT( * )
##### COUNT(column)
##### MIN(col)
##### MAX(col)
##### AVG(col)
##### SUM(col)
```sql
SELECT COUNT/ MIN /MAX / AVG / SUM (col)
FROM table_name;
```

##### GROUP BY column
Grouping rows that have the same value

```sql
--For each grade, count the total students
SELECT COUNT(students)
FROM scores_report
GROUP BY grade

-- Grouping Apple stock by year, month
SELECT year, month, COUNT(*) AS count 
FROM tutorial.aapl_historical_stock_price 
GROUP BY year, month
```

##### HAVING 
***Additional condition for the group***, after ***WHERE*** condition
```sql
SELECT group_by_column, AGG_FUNC(_column_expression_) AS aggregate_result_alias, … 
FROM mytable 
WHERE _condition_ 
GROUP BY column 
HAVING _group_condition_;

--Grouping Apple stock by year, month, where HAVING max price > 400
SELECT year, month, MAX(high) AS month_high 
FROM tutorial.aapl_historical_stock_price 
GROUP BY year, month 
HAVING MAX(high) > 400 
ORDER BY year, month
```

## FROM
select data ***from which table***.
Use ***JOIN*** to combine tables

```sql
SELECT * FROM a_table;

SELECT old_col AS new_col_name
FROM a_long_table_name AS short_table
INNER JOIN sales
	ON short_table.id = sales.id;
```

## WHERE
Find the data matching with ***condition***.

```sql
SELECT col, col_a, col_b
FROM mytable
WHERE condition
	AND/OR another_condition
	AND/OR ...;
```

#### Numbers

|                           |                                            |                               |
| ------------------------- | ------------------------------------------ | ----------------------------- |
| Operator                  | Condition                                  | SQL Example                   |
| ***=, !=, <, <=, >, >=*** |                                            | col_name != 4                 |
| ***BETWEEN … AND …***     | within range of two values (inclusive)     | col_name BETWEEN 1.5 AND 10.5 |
| ***NOT BETWEEN … AND …*** | not within range of two values (inclusive) | col_name NOT BETWEEN 1 AND 10 |
| ***IN (…)***              | exists                                     | col_name IN (2, 4, 6)         |
| ***NOT IN (…)***          | does not exist                             | col_name NOT IN (1, 3, 5)     |
|                           |                                            |                               |
```sql
SELECT Title, Year
FROM movies
WHERE YEAR BETWEEN 2000 AND 2010
	AND Director = "Peter Docter"

-- if the number is even
WHERE YEAR % 2 = 0
```

#### ROUND(), FLOOR(), CEIL()
Làm tròn số

|Use it when you want to...|Function|
|---|---|
|Round normally (up or down based on decimal)|`ROUND()`|
|Always round **down** to the next lower integer|`FLOOR()`|
|Always round **up** to the next higher integer|`CEIL()` or `CEILING()`|
```sql
SELECT ROUND(123.456);  -- returns 123
SELECT FLOOR(3.4);  -- returns 3
```
#### Strings
|                  |                                                                                                       |                                                                         |
| ---------------- | ----------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| Operator         | Condition                                                                                             | Example                                                                 |
| ***=***          | Case sensitive exact string comparison (_notice the single equals_)                                   | col_name = 'abc'                                                        |
| ***!= or <>***   | Case sensitive exact string inequality comparison                                                     | col_name != 'abcd'                                                      |
| ***LIKE***       | Case insensitive exact string comparison                                                              | col_name LIKE 'ABC'                                                     |
| ***NOT LIKE***   | Case insensitive exact string inequality comparison                                                   | col_name NOT LIKE 'ABCD'                                                |
| ***%***          | Used anywhere in a string to match a sequence of zero or more characters (only with LIKE or NOT LIKE) | col_name LIKE '%AT%'  <br>(matches 'AT', 'ATTIC', 'CAT' or even 'BATS') |
| ***_***          | Used anywhere in a string to match a single character (only with LIKE or NOT LIKE)                    | col_name LIKE 'AN_'  <br>(matches 'AND', but not 'AN')                  |
| ***IN (…)***     | String exists in a list                                                                               | col_name IN ('A', 'B', 'C')                                             |
| ***NOT IN (…)*** | String does not exist in a list                                                                       | col_name NOT IN ('D', 'E', 'F')                                         |

when compare text, should use ***LIKE*** instead of = 
```sql

SELECT * FROM universities
WHERE Name LIKE "%Technology%"
	OR LOWER(Name) LIKE "%language%";
```

#### IS / IS NOT NULL
```sql
SELECT column, another_column, … 
FROM mytable 
WHERE column IS/IS NOT NULL
AND/OR _another_condition_ ;
```


#### LOWER() / UPPER()
```sql
SELECT DISTINCT city 
FROM crime_scene_report 
WHERE LOWER(city) ='sql city';
```


## Filtering & Sorting

#### DISTINCT
remove duplicate rows
```sql
SELECT DISTINCT column, another_column, … 
FROM mytable 
WHERE condition(s);
```

#### ASC/DESC
***ASC (default)*** = ascending  small -> large
***DESC*** = descending large -> small

```sql
SELECT column, another_column, … 
FROM mytable 
WHERE _condition(s)_ 
ORDER BY column ASC/DESC;
```

#### LIMIT OFFSET
The ***LIMIT*** will limit the results, and ***OFFSET*** will specify **where to begin counting** the number rows from. 

```sql
SELECT column, another_column, … 
FROM mytable 
WHERE _condition(s)_ 
ORDER BY column ASC/DESC 
LIMIT num_limit OFFSET num_offset;
```

- Use ***LIMIT 5*** when looking for the first 5 movies
- Use ***OFFSET 5*** when looking for the next 5 movies
```sql
SELECT DISTINCT Title 
FROM movies 
ORDER BY Year DESC
LIMIT 5 (OFFSET 5);
```

## Multi-tables JOIN

![SQL Join types](images/image001.SQLTypes.png)


#### Type of JOINS
- ***INNER JOIN / JOIN*** (default)
- FULL JOIN
- OUTER JOIN
- LEFT JOIN
- RIGHT JOIN

```sql
SELECT column, another_table_column, … 
FROM mytable 
INNER / LEFT / RIGHT / FULL JOIN another_table 
	ON mytable.id = another_table.id;
```

```sql
-- Join 2 tables, where international sales > domestic sales, order by rating
SELECT title, domestic_sales, international_sales
FROM movies
  JOIN boxoffice
    ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales
ORDER BY boxoffice.rating DESC;
```


```sql
-- Join 3 tables, find the similarities between high earners. Primary key is the ssn (social security number).
SELECT name, annual_income as income, 
gender, eye_color as eyes, hair_color as hair
FROM income i
JOIN person p
  ON i.ssn = p.ssn 
JOIN drivers_license dl
  ON p.license_id = dl.id
WHERE annual_income > 450000
```

