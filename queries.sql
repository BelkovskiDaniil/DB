
SELECT ID_of_student, AVG(mark) as average_mark
FROM curses_registration
GROUP BY ID_of_student
HAVING AVG(mark) > 4;


SELECT curses.name, COUNT(curses_registration.ID_of_student) as student_count
FROM curses
JOIN curses_registration ON curses.ID = curses_registration.ID_of_curse
GROUP BY curses.name
ORDER BY student_count DESC;


SELECT students.*
FROM students
JOIN curses_registration ON students.ID = curses_registration.ID_of_student
JOIN curses ON curses_registration.ID_of_curse = curses.ID
WHERE curses.ID_of_tutor = 5;


SELECT curses.*
FROM curses
JOIN tutors ON curses.ID_of_tutor = tutors.ID
WHERE EXTRACT(YEAR FROM AGE(tutors.date_of_birth)) > 20;


SELECT ID_of_student, COUNT(ID_of_curse) as curse_count
FROM curses_registration
GROUP BY ID_of_student
HAVING COUNT(ID_of_curse) >= 1;


SELECT tutors.*, COUNT(curses.ID) as curse_count
FROM tutors
JOIN curses ON tutors.ID = curses.ID_of_tutor
GROUP BY tutors.ID
HAVING COUNT(curses.ID) >= 1;


SELECT ID_of_student, AVG(mark) as average_mark
FROM curses_registration
GROUP BY ID_of_student
HAVING AVG(mark) > (SELECT AVG(mark) FROM curses_registration);


SELECT curses.*, COUNT(curses_registration.ID_of_student) as student_count
FROM curses
JOIN curses_registration ON curses.ID = curses_registration.ID_of_curse
GROUP BY curses.ID
HAVING COUNT(curses_registration.ID_of_student) < 10;


SELECT students.*
FROM students
JOIN curses_registration ON students.ID = curses_registration.ID_of_student
WHERE curses_registration.ID_of_curse = (SELECT ID FROM curses ORDER BY credits DESC LIMIT 1);


SELECT tutors.*, SUM(curses.credits) as total_credits
FROM tutors
JOIN curses ON tutors.ID = curses.ID_of_tutor
GROUP BY tutors.ID
HAVING SUM(curses.credits) > 4;

