from utils.try_install_package import check_and_install

check_and_install('psycopg2')
import psycopg2
from psycopg2 import sql, errors
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT
    
def database_exists(cur, db_name):
    try:
        cur.execute(
            "SELECT EXISTS(SELECT 1 FROM information_schema.schemata WHERE schema_name=%s)",
            (db_name,)
        )
        return not cur.fetchone()[0]
    except:
        print("except!")
        return False

def run_sql_file(filename, conn):
    file = open(filename, 'r')
    sql = file.read()
    cur = conn.cursor()
    cur.execute(sql)
    conn.commit()
    cur.close()

def create_db(db_name, conn):
    cur = conn.cursor()

    if not database_exists(cur, db_name):
        create_database_query = sql.SQL(
            "CREATE DATABASE {} WITH ENCODING 'UTF8'"
        ).format(sql.Identifier(db_name))
        print(create_database_query)        
        
        cur.execute(create_database_query)
        
        conn.commit()
    cur.close()

def main():
    conn = psycopg2.connect(
        dbname="postgres",
        user="derek.wu",
        password="ltnATL2021",
        host="localhost"
    )
    
    conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)
    
    db_name = 'DRIVERS_SCHOOL_DB'
    
    create_db(db_name, conn)

    conn.close()

    conn = psycopg2.connect(
        dbname=db_name,
        user="derek.wu",
        password="ltnATL2021",
        host="localhost"
    )
    
    run_sql_file('db/init_db.sql', conn)
    conn.close()

if __name__ == "__main__":
    main()
