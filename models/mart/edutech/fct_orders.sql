WITH internal_orders AS (
    SELECT 
        internal_order_id AS order_id,
        student_id,
        product_id,
        order_created_at,
        order_unit_price,
        order_discount,
        order_total_amount,
        'internal' AS order_type
    FROM {{ ref('stg_orders_internal') }}
),

external_orders AS (
    SELECT 
        external_order_id AS order_id,
        student_id,
        product_id,
        order_created_at,
        order_unit_price,
        order_discount,
        order_total_amount,
        'external' AS order_type
    FROM {{ ref('stg_orders_external') }}
)

SELECT *
FROM internal_orders
UNION ALL
SELECT *
FROM external_orders
