Use students;
SELECT 
    student_id,
    age_of_enrollment,
    gender_id,
    students_outcomes_id
FROM students;

select * from admission;

SELECT 
    so.target,
    COUNT(*) AS total_students
FROM students s
JOIN students_outcomes so 
    ON s.students_outcomes_id = so.students_outcomes_id
GROUP BY so.target;

SELECT 
    g.gender,
    COUNT(*) AS total,
    SUM(CASE WHEN so.target = 'D' THEN 1 ELSE 0 END) AS dropouts,
    ROUND(
        SUM(CASE WHEN so.target = 'D' THEN 1 ELSE 0 END) / COUNT(*) * 100,
        2
    ) AS dropout_percentage
FROM students s
JOIN gender g ON s.gender_id = g.gender_id
JOIN students_outcomes so 
    ON s.students_outcomes_id = so.students_outcomes_id
GROUP BY g.gender;

SELECT 
    so.target,
    AVG(a.admission_grade) AS avg_admission_grade
FROM admission a
JOIN students s ON a.student_id = s.student_id
JOIN students_outcomes so ON s.students_outcomes_id = so.students_outcomes_id
GROUP BY so.target;

SELECT 
    s.student_id,
    a.application_mode,
    a.attendance_type,
    a.previous_qualification,
    a.admission_grade
FROM students s
JOIN admission a 
    ON s.student_id = a.student_id;
    
    SELECT 
    s.student_id,
    s.age_of_enrollment,
    g.gender,
    so.target AS outcome,
    fs.debtor,
    fs.scholarship_holder,
    fs.tution_fees_upto_date
FROM students s
LEFT JOIN gender g ON s.gender_id = g.gender_id
LEFT JOIN students_outcomes so ON s.students_outcomes_id = so.students_outcomes_id
LEFT JOIN financial_status fs ON s.financial_status_id = fs.financial_status_id;
