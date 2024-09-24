WITH raw_submission AS (
    SELECT
        id AS submission_id,
        campaign_id AS submission_campaign_id,
        influencer_id AS submission_influencer_id,
        status AS submission_status,
        submission_at AS submission_date,
        approved_at AS submission_approved_at,
        completed_at AS submission_completed_at,
        like_count AS submission_like_count,
        comment_count AS submission_comment_count,
        share_count AS submission_share_count,
        view_count AS submission_view_count
    FROM {{ source('fivetran_pd_influencers', 'submission') }}
)

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
FROM raw_submission
