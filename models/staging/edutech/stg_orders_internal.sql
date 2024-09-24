WITH source AS (
    SELECT *
    FROM {{ source('fivetran_edutech', 'orders_internal') }}
    WHERE _fivetran_deleted = FALSE
)

SELECT
    id AS internal_order_id,
    student_id,
    product_id,
    created_at AS order_created_at,
    unit_price AS order_unit_price,
    discount AS order_discount,
    total_amount AS order_total_amount
FROM source

