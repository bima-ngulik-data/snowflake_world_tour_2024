WITH source AS (
    SELECT *
    FROM {{ source('fivetran_edutech', 'categories') }}
    WHERE _fivetran_deleted = FALSE

)

SELECT
    id AS category_id,
    name AS category_name,
    created_at AS category_created_at,
    updated_at AS category_updated_at
FROM source
