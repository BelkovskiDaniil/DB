DROP TABLE IF EXISTS specials, curses, students, tutors, history_change_curses, curses_registration, history_change_marks;

CREATE TABLE IF NOT EXISTS specials (
 ID BIGSERIAL NOT NULL PRIMARY KEY,
 name VARCHAR(50) NOT NULL CHECK(LENGTH(name) >= 1),
 code BIGINT NOT NULL CHECK (code >= 0) UNIQUE,
 description VARCHAR(500) NOT NULL CHECK(LENGTH(description) >= 1)
);

CREATE TABLE IF NOT EXISTS students (
 ID BIGSERIAL NOT NULL PRIMARY KEY,
 name VARCHAR(50) NOT NULL CHECK(LENGTH(name) >= 1),
 surname VARCHAR(50) NOT NULL CHECK(LENGTH(surname) >= 1),
 date_of_birth DATE NOT NULL,
 sex VARCHAR(1) NOT NULL CHECK(LENGTH(sex) = 1),
 mail VARCHAR(320) NOT NULL CHECK(LENGTH(mail) >= 1),
 ID_of_speciality BIGINT NOT NULL CHECK (ID_of_speciality >= 0)
);

CREATE TABLE IF NOT EXISTS tutors (
 ID BIGSERIAL NOT NULL PRIMARY KEY,
 name VARCHAR(50) NOT NULL CHECK(LENGTH(name) >= 1),
 surname VARCHAR(50) NOT NULL CHECK(LENGTH(surname) >= 1),
 date_of_birth DATE NOT NULL,
 sex VARCHAR(1) NOT NULL CHECK(LENGTH(sex) = 1),
 mail VARCHAR(320) NOT NULL CHECK(LENGTH(mail) >= 1)
);

CREATE TABLE IF NOT EXISTS curses (
 ID BIGSERIAL NOT NULL PRIMARY KEY,
 name VARCHAR(50) NOT NULL CHECK(LENGTH(name) >= 1),
 ID_of_tutor BIGINT NOT NULL CHECK (ID_of_tutor >= 0) UNIQUE,
 credits BIGINT NOT NULL CHECK (credits >= 0),
 description VARCHAR(500) NOT NULL CHECK(LENGTH(description) >= 1)
);

CREATE TABLE IF NOT EXISTS history_change_curses (
 ID BIGSERIAL NOT NULL PRIMARY KEY,
 date DATE NOT NULL,
 new_name VARCHAR(50) NOT NULL CHECK(LENGTH(new_name) >= 1),
 old_name VARCHAR(50) NOT NULL CHECK(LENGTH(old_name) >= 1),
 new_description VARCHAR(500) NOT NULL CHECK(LENGTH(new_description) >= 1),
 old_description VARCHAR(500) NOT NULL CHECK(LENGTH(old_description) >= 1),
 ID_of_speciality BIGINT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS curses_registration (
 ID_of_curse BIGINT NOT NULL UNIQUE CHECK(ID_of_curse >= 0),
 ID_of_student BIGINT NOT NULL UNIQUE CHECK(ID_of_student >= 0),
 date DATE NOT NULL,
 mark INT NOT NULL CHECK(mark >= 0),
 semester INT NOT NULL CHECK(semester >= 0)
);

CREATE TABLE IF NOT EXISTS history_change_marks (
 ID_of_curse BIGINT NOT NULL UNIQUE CHECK(ID_of_curse >= 0),
 ID_of_student BIGINT NOT NULL UNIQUE CHECK(ID_of_student >= 0),
 date DATE NOT NULL,
 old_mark INT NOT NULL CHECK(old_mark >= 0),
 new_mark INT NOT NULL CHECK(new_mark >= 0)
);
