import psycopg2
from datetime import date
import matplotlib.pyplot as plt

# Подключение к базе данных
conn = psycopg2.connect(
    dbname="test_db",
    user="root",
    password="root",
    host="127.0.0.1",
    port="5432"
)

# Создание курсора для выполнения SQL-запросов
cur = conn.cursor()

# Получение последнего ID_of_speciality из таблицы students
cur.execute("SELECT MAX(ID_of_speciality) FROM students")
last_id = cur.fetchone()[0]

if last_id is None:
    last_id = 0

# Добавление пяти строк в таблицу students
students_data = [
    ("Иван", "Иванов", date(2000, 1, 1), "М", "ivanov@mail.ru", 12),
    ("Петр", "Петров", date(2001, 2, 2), "М", "petrov@mail.ru", 12),
    ("Сергей", "Сергеев", date(2002, 3, 3), "М", "sergeev@mail.ru", 12),
    ("Анна", "Аннова", date(2003, 4, 4), "Ж", "annova@mail.ru", 13),
    # ("Ярополк", "Горемыслович", date(2020, 5, 5), "Ж", "marieva@mail.ru", last_id + 5)
]

for student in students_data:
    cur.execute(
        "INSERT INTO students (name, surname, date_of_birth, sex, mail, ID_of_speciality) VALUES (%s, %s, %s, %s, %s, "
        "%s)",
        student
    )

# Подтверждение изменений
conn.commit()

# Выполнение SQL-запроса для извлечения всех строк из таблицы students
cur.execute("SELECT * FROM students")

# Получение результатов запроса
rows = cur.fetchall()

# Вывод результатов в консоль
for row in rows:
    print(row)

# Выполнение SQL-запроса для извлечения всех строк из таблицы students
cur.execute("SELECT s.name, COUNT(*) FROM students st JOIN specials s ON st.ID_of_speciality = s.code GROUP BY s.name")
rows = cur.fetchall()

# Получение результатов запроса
specialities = [row[0] for row in rows]
counts = [row[1] for row in rows]

# Построение графика
plt.bar(specialities, counts)

plt.xlabel('Speciality')
plt.ylabel('Number of Students')
plt.title('Number of Students per Speciality')

# Поворот подписей оси X на 45 градусов для лучшей читаемости
plt.xticks(rotation=45, ha='right')

plt.tight_layout()
plt.show()


# Закрытие курсора и соединения
cur.close()
conn.close()
