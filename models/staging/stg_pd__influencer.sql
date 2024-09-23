WITH raw_influencer AS (
    SELECT
        id AS influencer_id,
        name AS influencer_name,
        tiktok_account AS influencer_tiktok_account,
        instagram_account AS influencer_instagram_account,
        age AS influencer_age,
        gender AS influencer_gender,
        tiktok_followers AS influencer_tiktok_followers,
        instagram_followers AS influencer_instagram_followers,
        is_married AS influencer_is_married,
        is_have_kids AS influencer_is_have_kids,
        country AS influencer_country
    FROM {{ source('fivetran_pd_influencers', 'influencer') }}
)

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
FROM raw_influencer
