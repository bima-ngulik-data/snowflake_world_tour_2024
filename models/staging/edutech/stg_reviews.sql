WITH source AS (
    SELECT *
    FROM {{ source('fivetran_edutech', 'reviews') }}
    WHERE _fivetran_deleted = FALSE
)

SELECT
    id AS review_id,
    product_id,
    student_id,
    rating AS review_rating,
    created_at AS review_created_at
FROM source

