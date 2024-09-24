WITH source AS (
    SELECT *
    FROM {{ source('fivetran_edutech', 'orders_external') }}
    WHERE _fivetran_deleted = FALSE
)

SELECT
    id AS external_order_id,
    student_id,
    product_id,
    created_at AS order_created_at,
    unit_price AS order_unit_price,
    discount AS order_discount,
    total_amount AS order_total_amount,
    platform_id
FROM source

