-- Create a new table
CREATE TABLE IF NOT EXISTS Employees (
    ID VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(10),
    Email VARCHAR(50),
    PhoneNumber VARCHAR(10) CHECK (PhoneNumber ~ '^[0-9]+$'),
    Address TEXT
);

CREATE TABLE IF NOT EXISTS Students (
    ID VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(10),
    Email VARCHAR(50),
    PhoneNumber VARCHAR(10) CHECK (PhoneNumber ~ '^[0-9]+$'),
    Address TEXT,
    Term VARCHAR(5) CHECK (Term ~ '^[0-9]+[A-C]$')
);

CREATE TABLE IF NOT EXISTS Courses (
    ID INT PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    Required BOOLEAN
);

CREATE TYPE DAY AS ENUM(
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
);

CREATE TABLE IF NOT EXISTS Timeslots (
    Day DAY PRIMARY KEY,
    StartTime TEXT 
);
