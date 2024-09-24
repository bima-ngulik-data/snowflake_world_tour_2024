WITH source AS (
    SELECT *
    FROM {{ source('fivetran_edutech', 'students') }}
    WHERE _fivetran_deleted = FALSE
)

SELECT
    id AS student_id,
    first_name AS student_first_name,
    last_name AS student_last_name,
    email AS student_email,
    phone_number AS student_phone_number,
    registered_at AS student_registered_at
FROM source