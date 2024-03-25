# Вспомогательные файлы

[Ссылка на схему в Lucidchart](https://lucid.app/lucidchart/b3550436-ae48-4727-8a00-f6c06a66d13f/edit?viewport_loc=-2139%2C-869%2C3195%2C1357%2C0_0&invitationId=inv_586a7a3d-c61e-40ca-8d48-8a1e37e6dc15)

[Ограничения полей](https://docs.google.com/document/d/1elhATyTcNRyXTrb4_ca8rJcRsudPJfbc9631PelvNL0/edit?usp=sharing)

# Структура базы данных

## Таблица: Specials

| Поле | Тип | Описание |
| --- | --- | --- |
| ID | BIGSERIAL | Уникальный идентификатор специальности |
| name | VARCHAR(50) | Название специальности |
| code | BIGINT | Код специальности |
| description | VARCHAR(500) | Описание специальности |

## Таблица: Students

| Поле | Тип | Описание |
| --- | --- | --- |
| ID | BIGSERIAL | Уникальный идентификатор студента |
| name | VARCHAR(50) | Имя студента |
| surname | VARCHAR(50) | Фамилия студента |
| date_of_birth | DATE | Дата рождения студента |
| sex | VARCHAR(1) | Пол студента |
| mail | VARCHAR(320) | Электронная почта студента |
| ID_of_speciality | BIGINT | Идентификатор специальности студента |

## Таблица: Tutors

| Поле | Тип | Описание |
| --- | --- | --- |
| ID | BIGSERIAL | Уникальный идентификатор преподавателя |
| name | VARCHAR(50) | Имя преподавателя |
| surname | VARCHAR(50) | Фамилия преподавателя |
| date_of_birth | DATE | Дата рождения преподавателя |
| sex | VARCHAR(1) | Пол преподавателя |
| mail | VARCHAR(320) | Электронная почта преподавателя |

## Таблица: Curses

| Поле | Тип | Описание |
| --- | --- | --- |
| ID | BIGSERIAL | Уникальный идентификатор курса |
| name | VARCHAR(50) | Название курса |
| ID_of_tutor | BIGINT | Идентификатор преподавателя курса |
| credits | BIGINT | Количество кредитов за курс |
| description | VARCHAR(500) | Описание курса |

## Таблица: History_change_curses

| Поле | Тип | Описание |
| --- | --- | --- |
| ID | BIGSERIAL | Уникальный идентификатор изменения курса |
| date | DATE | Дата изменения курса |
| new_name | VARCHAR(50) | Новое название курса |
| old_name | VARCHAR(50) | Старое название курса |
| new_description | VARCHAR(500) | Новое описание курса |
| old_description | VARCHAR(500) | Старое описание курса |
| ID_of_speciality | BIGINT | Идентификатор специальности курса |

## Таблица: Curses_registration

| Поле | Тип | Описание |
| --- | --- | --- |
| ID_of_curse | BIGINT | Идентификатор курса |
| ID_of_student | BIGINT | Идентификатор студента |
| date | DATE | Дата регистрации на курс |
| mark | INT | Оценка за курс |
| semester | INT | Семестр курса |

## Таблица: History_change_marks

| Поле | Тип | Описание |
| --- | --- | --- |
| ID_of_curse | BIGINT | Идентификатор курса |
| ID_of_student | BIGINT | Идентификатор студента |
| date | DATE | Дата изменения оценки |
| old_mark | INT | Старая оценка |
| new_mark | INT | Новая оценка |
