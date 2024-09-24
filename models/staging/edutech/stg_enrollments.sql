WITH source AS (
    SELECT *
    FROM {{ source('fivetran_edutech', 'enrollments') }}
    WHERE _fivetran_deleted = FALSE
)

SELECT
    id AS enrollment_id,
    student_id,
    product_id,
    enrollment_date,
    status AS enrollment_status,
    completed_at AS enrollment_completed_at
FROM source

