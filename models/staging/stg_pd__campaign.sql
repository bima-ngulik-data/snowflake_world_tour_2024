WITH raw_campaign AS (
    SELECT
        id AS campaign_id,
        title AS campaign_title,
        description AS campaign_description,
        created_at AS campaign_created_at,
        updated_at AS campaign_updated_at,
        brand_id AS campaign_brand_id,
        start_date AS campaign_start_date,
        end_date AS campaign_end_date,
        budget AS campaign_budget,
        target_influencer AS campaign_target_influencer,
        status AS campaign_status,
        fee AS campaign_fee,
        platform AS campaign_platform
    FROM {{ source('fivetran_pd_influencers', 'campaign') }}
)

SELECT
    campaign_id,
    campaign_title,
    campaign_description,
    campaign_created_at,
    campaign_updated_at,
    campaign_brand_id,
    campaign_start_date,
    campaign_end_date,
    campaign_budget,
    campaign_target_influencer,
    campaign_status,
    campaign_fee,
    campaign_platform
FROM raw_campaign
