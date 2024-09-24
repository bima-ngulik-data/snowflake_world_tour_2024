WITH source AS (
    SELECT *
    FROM {{ source('fivetran_edutech', 'products') }}
    WHERE _fivetran_deleted = FALSE
)

SELECT
    id AS product_id,
    title AS product_title,
    description AS product_description,
    status AS product_status,
    price AS product_price,
    category_id,
    type_id,
    created_at AS product_created_at,
    published_at AS product_published_at,
    archived_at AS product_archived_at
FROM source
