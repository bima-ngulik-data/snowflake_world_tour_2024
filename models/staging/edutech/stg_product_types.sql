WITH source AS (
    SELECT *
    FROM {{ source('fivetran_edutech', 'product_types') }}
    WHERE _fivetran_deleted = FALSE
)

SELECT
    id AS product_type_id,
    type AS product_type,
    created_at AS product_type_created_at,
    updated_at AS product_type_updated_at
FROM source
