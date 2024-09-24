WITH raw_brand AS (
    SELECT
        id AS brand_id,
        name AS brand_name,
        country AS brand_country,
        created_at AS brand_created_at,
        updated_at AS brand_updated_at,
        industry AS brand_industry
    FROM {{ source('fivetran_pd_influencers', 'brand') }}
)

SELECT
    brand_id,
    brand_name,
    brand_country,
    brand_created_at,
    brand_updated_at,
    brand_industry
FROM raw_brand
