WITH submission_performance AS (
    SELECT
        sub.submission_influencer_id AS influencer_id,
        COUNT(sub.submission_id) AS total_submissions,
        SUM(sub.submission_like_count) AS total_likes,
        SUM(sub.submission_comment_count) AS total_comments,
        SUM(sub.submission_share_count) AS total_shares,
        SUM(sub.submission_view_count) AS total_views,
        AVG(sub.submission_like_count) AS average_likes_per_submission,
        AVG(sub.submission_comment_count) AS average_comments_per_submission,
        AVG(sub.submission_share_count) AS average_shares_per_submission,
        AVG(sub.submission_view_count) AS average_views_per_submission
    FROM {{ ref('stg_pd__submission') }} sub
    GROUP BY sub.submission_influencer_id
),

influencer_profile AS (
    SELECT
        inf.influencer_id,
        inf.influencer_name,
        inf.influencer_age,
        inf.influencer_gender,
        inf.influencer_country,
        inf.influencer_tiktok_followers,
        inf.influencer_instagram_followers
    FROM {{ ref('stg_pd__influencer') }} inf
)

SELECT
    profile.influencer_id,
    profile.influencer_name,
    profile.influencer_age,
    profile.influencer_gender,
    profile.influencer_country,
    profile.influencer_tiktok_followers,
    profile.influencer_instagram_followers,
    perf.total_submissions,
    perf.total_likes,
    perf.total_comments,
    perf.total_shares,
    perf.total_views,
    perf.average_likes_per_submission,
    perf.average_comments_per_submission,
    perf.average_shares_per_submission,
    perf.average_views_per_submission

FROM submission_performance perf
JOIN influencer_profile profile
    ON perf.influencer_id = profile.influencer_id
