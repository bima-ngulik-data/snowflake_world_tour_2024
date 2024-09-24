WITH enrollments AS (
    SELECT *
    FROM {{ ref('stg_enrollments') }}
),
students AS (
    SELECT *
    FROM {{ ref('stg_students') }}
),
products AS (
    SELECT *
    FROM {{ ref('stg_products') }}
)

SELECT
    e.enrollment_id,
    e.enrollment_date,
    e.enrollment_status,
    e.enrollment_completed_at,
    p.product_id,
    p.product_title,
    p.product_price,
    s.student_id,
    s.student_first_name,
    s.student_last_name,
    s.student_email
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN products p ON e.product_id = p.product_id
