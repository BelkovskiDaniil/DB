-- Представление для таблицы students
DROP VIEW IF EXISTS students_view;
CREATE VIEW students_view AS
SELECT * FROM students;
SELECT * FROM students_view;

-- Представление для таблицы tutors
DROP VIEW IF EXISTS tutors_view;
CREATE VIEW tutors_view AS
SELECT * FROM tutors;
SELECT * FROM tutors_view;

-- Представление для таблицы curses
DROP VIEW IF EXISTS curses_view;
CREATE VIEW curses_view AS
SELECT * FROM curses;
SELECT * FROM curses_view;

-- Представление для таблицы history_change_curses
DROP VIEW IF EXISTS history_change_curses_view;
CREATE VIEW history_change_curses_view AS
SELECT * FROM history_change_curses;
SELECT * FROM history_change_curses_view;

-- Представление для таблицы curses_registration
DROP VIEW IF EXISTS curses_registration_view;
CREATE VIEW curses_registration_view AS
SELECT * FROM curses_registration;
SELECT * FROM curses_registration_view;

-- Представление для таблицы history_change_marks
DROP VIEW IF EXISTS history_change_marks_view;
CREATE VIEW history_change_marks_view AS
SELECT * FROM history_change_marks;
SELECT * FROM history_change_marks_view;
