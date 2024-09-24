WITH students AS (
    SELECT *
    FROM {{ ref('stg_students') }}
)

SELECT
    student_id,
    CONCAT(student_first_name, ' ', student_last_name) AS student_full_name,
    student_email,
    student_phone_number,
    student_registered_at
FROM students
