--Триггер для проверки возраста тьютора
DROP TRIGGER IF EXISTS check_tutor_age_trigger ON tutors;
CREATE OR REPLACE FUNCTION check_tutor_age() RETURNS TRIGGER AS $$
BEGIN
   IF (EXTRACT(YEAR FROM AGE(NEW.date_of_birth)) < 26) THEN
      RAISE EXCEPTION 'Тьютор должен быть старше 26 лет';
   END IF;
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_tutor_age_trigger
BEFORE INSERT ON tutors
FOR EACH ROW
EXECUTE FUNCTION check_tutor_age();


--Триггер для проверки, что новый студент старше 18 лет, при добавлении в таблицу students
DROP TRIGGER IF EXISTS check_age_trigger ON students;
CREATE OR REPLACE FUNCTION check_age() RETURNS TRIGGER AS $$
BEGIN
   IF (EXTRACT(YEAR FROM AGE(NEW.date_of_birth)) < 18) THEN
      RAISE EXCEPTION 'Студент должен быть старше 18 лет';
   END IF;
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_age_trigger
BEFORE INSERT ON students
FOR EACH ROW
EXECUTE FUNCTION check_age();

--Триггер для проверки, что оценка не превышает 5, при добавлении или обновлении в таблице curses_registration
DROP TRIGGER IF EXISTS check_mark_trigger ON curses_registration;
CREATE OR REPLACE FUNCTION check_mark() RETURNS TRIGGER AS $$
BEGIN
   IF (NEW.mark > 5) THEN
      RAISE EXCEPTION 'Оценка не может быть больше 5';
   END IF;
   RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_mark_trigger
BEFORE INSERT OR UPDATE ON curses_registration
FOR EACH ROW
EXECUTE FUNCTION check_mark();
