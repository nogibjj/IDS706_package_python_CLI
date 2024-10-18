from mylib.extract import extract
import os
from dotenv import load_dotenv
import mysql.connector
from mylib.query import query


def test_extract():
    extract()
    assert os.path.getsize("data/adult.data")


def test_transform_load():
    load_dotenv()

    db_config = {
        "user": os.getenv("DB_USER"),
        "password": os.getenv("DB_PASS"),
        "host": os.getenv("DB_HOST"),
        "database": os.getenv("DB_NAME"),
        "autocommit": True,
    }

    required_tables = ["personal_info", "employment_info", "income_info"]

    try:
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor()

        cursor.execute(
            """
            SELECT TABLE_NAME 
            FROM INFORMATION_SCHEMA.TABLES 
            WHERE TABLE_SCHEMA = %s;
        """,
            (db_config["database"],),
        )

        tables = cursor.fetchall()
        table_names = {table[0] for table in tables}

        for table in required_tables:
            assert table in table_names, f"table'{table}' do not exist"

    except Exception as e:
        print(f"{e}")
    finally:
        if "cursor" in locals() and cursor:
            cursor.close()
        if "conn" in locals() and conn.is_connected():
            conn.close()


def test_query():
    result1 = query("query1")
    assert result1 is not None
    assert result1[0][1] == "Prof-school"
    result2 = query("query2")
    assert result2 is not None
    assert result2[0][0] == "India"
