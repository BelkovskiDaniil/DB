CREATE OR REPLACE FUNCTION average_student_age()
RETURNS numeric AS $$
DECLARE
    result numeric;
BEGIN
    SELECT AVG(EXTRACT(YEAR FROM AGE(date_of_birth))) INTO result FROM students;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

SELECT average_student_age();

CREATE OR REPLACE FUNCTION count_gender() RETURNS TABLE (sex VARCHAR(1), count INTEGER) AS $$
BEGIN
  RETURN QUERY
  SELECT tutors.sex, CAST(COUNT(*) AS INTEGER)
  FROM tutors
  GROUP BY tutors.sex;
END; $$
LANGUAGE plpgsql;

SELECT * FROM count_gender();

CREATE OR REPLACE FUNCTION most_popular_course() RETURNS TABLE (ID_of_curse BIGINT, count INTEGER) AS $$
BEGIN
  RETURN QUERY
  SELECT curses_registration.ID_of_curse, CAST(COUNT(*) AS INTEGER)
  FROM curses_registration
  GROUP BY curses_registration.ID_of_curse
  ORDER BY COUNT(*) DESC
  LIMIT 1;
END; $$
LANGUAGE plpgsql;

SELECT * FROM most_popular_course();



