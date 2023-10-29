PROJECT_ID=$(gcloud info --format='value(config.project)')
gsutil mb -l US gs://$PROJECT_ID-us
gsutil mb -l EU gs://$PROJECT_ID-eu
bq mk nyc_tlc_EU
gcloud composer environments create composer-advanced-lab --location us-central1
