WITH brand_data AS (
    SELECT
        brand_id,
        brand_name,
        brand_country,
        brand_industry
    FROM {{ ref('stg_pd__brand') }}
),

campaign_data AS (
    SELECT
        campaign_id,
        campaign_title,
        campaign_description,
        campaign_start_date,
        campaign_end_date,
        campaign_budget,
        campaign_target_influencer,
        campaign_status,
        campaign_fee,
        campaign_platform,
        campaign_brand_id
    FROM {{ ref('stg_pd__campaign') }}
),

influencer_data AS (
    SELECT
        influencer_id,
        influencer_name,
        influencer_tiktok_account,
        influencer_instagram_account,
        influencer_age,
        influencer_gender,
        influencer_tiktok_followers,
        influencer_instagram_followers,
        influencer_is_married,
        influencer_is_have_kids,
        influencer_country
    FROM {{ ref('stg_pd__influencer') }}
),

submission_data AS (
    SELECT
        submission_id,
        submission_campaign_id,
        submission_influencer_id,
        submission_status,
        submission_date,
        submission_approved_at,
        submission_completed_at,
        submission_like_count,
        submission_comment_count,
        submission_share_count,
        submission_view_count
    FROM {{ ref('stg_pd__submission') }}
)

SELECT
    -- Submission Data
    sub.submission_id,
    sub.submission_status,
    sub.submission_date,
    sub.submission_approved_at,
    sub.submission_completed_at,
    sub.submission_like_count,
    sub.submission_comment_count,
    sub.submission_share_count,
    sub.submission_view_count,

    -- Campaign Data
    camp.campaign_id,
    camp.campaign_title,
    camp.campaign_description,
    camp.campaign_start_date,
    camp.campaign_end_date,
    camp.campaign_budget,
    camp.campaign_target_influencer,
    camp.campaign_status,
    camp.campaign_fee,
    camp.campaign_platform,

    -- Brand Data (joined via campaign)
    brand.brand_id,
    brand.brand_name,
    brand.brand_country,
    brand.brand_industry,

    -- Influencer Data
    inf.influencer_id,
    inf.influencer_name,
    inf.influencer_tiktok_account,
    inf.influencer_instagram_account,
    inf.influencer_age,
    inf.influencer_gender,
    inf.influencer_tiktok_followers,
    inf.influencer_instagram_followers,
    inf.influencer_is_married,
    inf.influencer_is_have_kids,
    inf.influencer_country

FROM submission_data sub
LEFT JOIN campaign_data camp
    ON sub.submission_campaign_id = camp.campaign_id
LEFT JOIN brand_data brand
    ON camp.campaign_brand_id = brand.brand_id
LEFT JOIN influencer_data inf
    ON sub.submission_influencer_id = inf.influencer_id