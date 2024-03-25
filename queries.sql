# 1. Получить средний балл каждого студента, у которого средний балл больше 4
SELECT ID_of_student, AVG(mark) as average_mark
FROM curses_registration
GROUP BY ID_of_student
HAVING AVG(mark) > 4;

# 2. Получить количество студентов на каждом курсе, отсортированных по убыванию
SELECT curses.name, COUNT(curses_registration.ID_of_student) as student_count
FROM curses
JOIN curses_registration ON curses.ID = curses_registration.ID_of_curse
GROUP BY curses.name
ORDER BY student_count DESC;

# 3. Получить всех студентов, зарегистрированных на курсе с определенным преподавателем
SELECT students.*
FROM students
JOIN curses_registration ON students.ID = curses_registration.ID_of_student
JOIN curses ON curses_registration.ID_of_curse = curses.ID
WHERE curses.ID_of_tutor = 5;

# 4. Получить курсы, которые ведет преподаватель старше определенного возраста
SELECT curses.*
FROM curses
JOIN tutors ON curses.ID_of_tutor = tutors.ID
WHERE AGE(tutors.date_of_birth) > 20;

# 5. Получить студентов, которые зарегистрированы на более чем одном курсе
SELECT ID_of_student, COUNT(ID_of_curse) as curse_count
FROM curses_registration
GROUP BY ID_of_student
HAVING COUNT(ID_of_curse) > 1;

# 6. Получить преподавателей, которые ведут более одного курса
SELECT tutors.*, COUNT(curses.ID) as curse_count
FROM tutors
JOIN curses ON tutors.ID = curses.ID_of_tutor
GROUP BY tutors.ID
HAVING COUNT(curses.ID) > 1;

# 7. Получить студентов, у которых средний балл выше среднего балла всех студентов
SELECT ID_of_student, AVG(mark) as average_mark
FROM curses_registration
GROUP BY ID_of_student
HAVING AVG(mark) > (SELECT AVG(mark) FROM curses_registration);

# 8. Получить курсы, на которые зарегистрировано меньше 10 студентов
SELECT curses.*, COUNT(curses_registration.ID_of_student) as student_count
FROM curses
JOIN curses_registration ON curses.ID = curses_registration.ID_of_curse
GROUP BY curses.ID
HAVING COUNT(curses_registration.ID_of_student) < 10;

# 9. Получить студентов, которые зарегистрированы на курсе с наибольшим количеством кредитов
SELECT students.*
FROM students
JOIN curses_registration ON students.ID = curses_registration.ID_of_student
WHERE curses_registration.ID_of_curse = (SELECT ID FROM curses ORDER BY credits DESC LIMIT 1);

# 10. Получить преподавателей, которые ведут курсы с общим количеством кредитов больше 4
SELECT tutors.*, SUM(curses.credits) as total_credits
FROM tutors
JOIN curses ON tutors.ID = curses.ID_of_tutor
GROUP BY tutors.ID
HAVING SUM(curses.credits) > 4;

