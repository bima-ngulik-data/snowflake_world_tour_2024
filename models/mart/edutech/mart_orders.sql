WITH orders AS (
    SELECT *
    FROM {{ ref('fct_orders') }}
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
    -- Order Information
    o.order_id,
    o.order_created_at,
    o.order_unit_price,
    o.order_discount,
    o.order_total_amount,
    o.order_type,

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
FROM orders o
JOIN students s ON o.student_id = s.student_id
JOIN products p ON o.product_id = p.product_id