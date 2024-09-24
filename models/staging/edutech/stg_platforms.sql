WITH source AS (
    SELECT *
    FROM {{ source('fivetran_edutech', 'platforms') }}
    WHERE _fivetran_deleted = FALSE
)

SELECT
    id AS platform_id,
    name AS platform_name,
    fee AS platform_fee,
    unit AS platform_unit,
    created_at AS platform_created_at,
    updated_at AS platform_updated_at
FROM source
