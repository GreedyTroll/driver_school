#Notes
postgresql supports chinese characters with VARCHAR
SQL
The number of bytes for a chinese character is 3 bytes, english is 1.
However, the n in postgresql's VARCHAR(n) is the number of characters instead of number for bytes. So no need to accomodate for the number of bytes. 

## create db
createdb chinese_books_db
the default encoding for creating a db is utf8. So it should be able to support multibytes characters such as traditional chinese.

## access the postgresql command prompt
psql

## access db
psql -d chinese_books_db

## create table
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255),
    publication_year INT
);

## insert data
INSERT INTO books (title, author, publication_year)
VALUES
    ('紅樓夢', '曹雪芹', 1791),
    ('西遊記', '吳承恩', 1592),
    ('三國演義', '羅貫中', 1522);


## Query data
SELECT title, author FROM books WHERE publication_year > 1600;

## postgresql exit prompt
\q, enter 
