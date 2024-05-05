-- Create a new table
CREATE TABLE IF NOT EXISTS Employees (
    ID VARCHAR(10) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(10),
    Email VARCHAR(50),
    Title VARCHAR(20),
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

CREATE TABLE IF NOT EXISTS Vehicles (
    ID VARCHAR(10) PRIMARY KEY,
    Make VARCHAR(20),
    Model VARCHAR(20),
    Owner VARCHAR(10),
    Type VARCHAR(20),
    CONSTRAINT fk_employee FOREIGN KEY (Owner)
        REFERENCES Employees (ID)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Courses (
    ID INT PRIMARY KEY,
    Name VARCHAR(20) NOT NULL,
    Required BOOLEAN
);

DO $$ BEGIN
    CREATE TYPE DAY AS ENUM(
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
    );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

CREATE TABLE IF NOT EXISTS Timeslots (
    Day DAY NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME,
    PRIMARY KEY(Day, StartTime) 
);

CREATE TABLE IF NOT EXISTS Schedule (
    Date DATE NOT NULL,
    Day DAY NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME,
    Course_ID INT,
    Student_ID  VARCHAR(10) NOT NULL,
    Employee_ID VARCHAR(10),
    CONSTRAINT fk_student FOREIGN KEY (Student_ID)
        REFERENCES Students (ID)
        ON DELETE CASCADE,
    CONSTRAINT fk_course FOREIGN KEY (Course_ID)
        REFERENCES Courses (ID)
        ON DELETE CASCADE,
    PRIMARY KEY(Student_ID, Course_ID)
);
