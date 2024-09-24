WITH reviews AS (
    SELECT *
    FROM {{ ref('fct_reviews') }}
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
    -- Review Information
    r.review_id,
    r.review_rating,
    r.review_created_at,

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
FROM reviews r
JOIN students s ON r.student_id = s.student_id
JOIN products p ON r.product_id = p.product_id
