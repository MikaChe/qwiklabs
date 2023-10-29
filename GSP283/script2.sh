DAGS_BUCKET=$(gsutil list | tail -n 1)
gsutil -m cp -r plugins/* ${DAGS_BUCKET}plugins
gsutil cp bq_copy_across_locations.py ${DAGS_BUCKET}dags
gsutil cp bq_copy_eu_to_us_sample.csv ${DAGS_BUCKET}dags
