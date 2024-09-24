WITH enrollments AS (
    SELECT *
    FROM {{ ref('fct_enrollments') }}
),
students AS (
    SELECT *
    FROM {{ ref('dim_students') }}
),
products AS (
    SELECT *
    FROM {{ ref('dim_products') }}
)

SELECT
    -- Enrollment Information
    e.enrollment_id,
    e.enrollment_date,
    e.enrollment_status,
    e.enrollment_completed_at,
    
    -- Student Information
    s.student_id,
    s.student_full_name,
    s.student_email,
    s.student_phone_number,
    s.student_registered_at,

    -- Product Information
    p.product_id,
    p.product_title,
    p.product_description,
    p.product_status,
    p.product_price,
    p.product_created_at,
    p.product_published_at,
    p.product_archived_at
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN products p ON e.product_id = p.product_id
