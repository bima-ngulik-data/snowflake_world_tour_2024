WITH reviews AS (
    SELECT *
    FROM {{ ref('stg_reviews') }}
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
    r.review_id,
    r.product_id,
    p.product_title,
    r.student_id,
    s.student_first_name,
    s.student_last_name,
    r.review_rating,
    r.review_created_at
FROM reviews r
JOIN students s ON r.student_id = s.student_id
JOIN products p ON r.product_id = p.product_id
