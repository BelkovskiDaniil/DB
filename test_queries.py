import pytest
import psycopg2


# Подключение к тестовой базе данных
def setup_module(module):
    global conn
    global cur
    conn = psycopg2.connect(
        dbname="test_db",
        user="root",
        password="root",
        host="127.0.0.1",
        port="5432"
    )
    cur = conn.cursor()


# Закрытие соединения после выполнения тестов
def teardown_module(module):
    cur.close()
    conn.close()


# Тестирование SQL-запросов из файла
def test_sql_queries():
    # Чтение SQL-запросов из файла
    with open('queries.sql', 'r') as file:
        sql_queries = file.read().split(';')

    for query in sql_queries:
        if query.strip() != '':
            cur.execute(query)
            rows = cur.fetchall()
            assert len(rows) > 0, f"Запрос не вернул результатов: {query}"
            print(f"Результаты запроса '{query}':")
            for row in rows:
                print(row)
