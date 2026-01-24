with base as (
    select
        id,
        timestamp,

        like_count,
        comment_count,
        saved_count,
        share_count,

        lag(like_count) over (
            partition by id
            order by timestamp
        ) as prev_like_count,

        lag(comment_count) over (
            partition by id
            order by timestamp
        ) as prev_comment_count,

        lag(saved_count) over (
            partition by id
            order by timestamp
        ) as prev_saved_count,

        lag(share_count) over (
            partition by id
            order by timestamp
        ) as prev_share_count

    from {{ref('staging_media_insight')}}
)

select
    id,
    timestamp,
    like_count,
    prev_like_count,
    case
        when prev_like_count is null then 0
        when like_count - prev_like_count > 0 then 0
        else like_count - prev_like_count
    end as unlike,

    comment_count,
    prev_comment_count,
    case
        when prev_comment_count is null then 0
        when comment_count - prev_comment_count > 0 then 0
        else comment_count - prev_comment_count
    end as uncomment,

    saved_count,
    prev_saved_count,
    case
        when prev_saved_count is null then 0
        when saved_count - prev_saved_count > 0 then 0
        else saved_count - prev_saved_count
    end as unsave,

    share_count,
    prev_share_count,
    case
        when prev_share_count is null then 0
        when share_count - prev_share_count > 0 then 0
        else share_count - prev_share_count
    end as unshare
from base 
