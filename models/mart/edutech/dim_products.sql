WITH products AS (
    SELECT *
    FROM {{ ref('stg_products') }}
),
categories AS (
    SELECT *
    FROM {{ ref('stg_categories') }}
),
product_types AS (
    SELECT *
    FROM {{ ref('stg_product_types') }}
)

SELECT
    p.product_id,
    p.product_title,
    p.product_description,
    p.product_status,
    p.product_price,
    c.category_name,
    t.product_type,
    p.product_created_at,
    p.product_published_at,
    p.product_archived_at
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id
LEFT JOIN product_types t ON p.type_id = t.product_type_id
