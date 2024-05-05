from utils.try_install_package import check_and_install

check_and_install('psycopg2')
import psycopg2
from psycopg2 import sql

def create_connection():
    """ create a database connection to a PostgreSQL database """
    conn = None;
    try:
        conn = psycopg2.connect(
            dbname="DRIVERS_SCHOOL_DB",
            user="derek.wu",
            password="ltnATL2021",
            host="localhost",
            port="5432"
        )
        print('Successful connection')
    except psycopg2.Error as e:
        print(e)
    return conn

def init_db(conn, sql_file):
    """ initialize database using SQL script """
    try:
        cursor = conn.cursor()
        with open(sql_file, 'r') as file:
            cursor.execute(sql.SQL(file.read()))
        conn.commit()
        print('Database initialized')
    except psycopg2.Error as e:
        print(e)


def main():
    conn = create_connection()
    # Create a cursor object
    cur = conn.cursor()

    # Path to your SQL script file
    sql_file_path = 'db/test_data.sql'

    # Read the SQL script file
    with open(sql_file_path, 'r') as file:
        sql_script = file.read()

    # Execute the SQL script
    cur.execute(sql_script)

    # Commit the transaction
    conn.commit()

    # Close the cursor and connection
    cur.close()
    conn.close()

if __name__ == "__main__":
    main()
