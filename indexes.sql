CREATE INDEX idx_specials_code ON specials(code);
CREATE INDEX idx_students_speciality ON students(ID_of_speciality);
CREATE INDEX idx_curses_tutor ON curses(ID_of_tutor);
CREATE INDEX idx_history_change_curses_speciality ON history_change_curses(ID_of_speciality);
CREATE INDEX idx_curses_registration_curse ON curses_registration(ID_of_curse);
CREATE INDEX idx_curses_registration_student ON curses_registration(ID_of_student);
CREATE INDEX idx_history_change_marks_curse ON history_change_marks(ID_of_curse);
CREATE INDEX idx_history_change_marks_student ON history_change_marks(ID_of_student);