-- Insert some data into the table
INSERT INTO Employees (ID, FirstName, LastName)
VALUES ('B123456789', 'DEREK', 'WU'),
       ('A123454677', 'DERRICK','WOO'),
       ('E123958439', '紅樓夢', '曹雪芹')
ON CONFLICT (ID)
DO NOTHING;

-- Select data from the table to confirm
SELECT * FROM Employees;
