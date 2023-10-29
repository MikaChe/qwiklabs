SELECT
    w1mpro_ep,
    mjd,
    load_id,
    frame_id
FROM
    `bigquery-public-data.wise_all_sky_data_release.mep_wise`
ORDER BY
    mjd ASC
LIMIT 500
