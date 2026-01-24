select 

    cast(id as bigint) as id,

    cast(
        replace(_timestamp, ' Z', ' Zulu')
        as timestamptz
    ) as timestamp,

    coalesce(like_count, 0) as like_count,
    coalesce(comment_count, 0) as comment_count,
    coalesce(video_photo_saved, 0) as saved_count,

    coalesce(video_photo_shares, 0)
      + coalesce(reel_shares, 0)
      + coalesce(carousel_album_shares, 0) as share_count

FROM {{source('raw_data', 'media_insights')}}
ORDER BY id, timestamp
