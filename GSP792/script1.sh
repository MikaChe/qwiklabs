PROJECT_ID=$(gcloud config get-value project)

#cd GCP792

(gsutil mb gs://$PROJECT_ID;
gsutil -m cp -r ./firebase/ gs://$PROJECT_ID;
gcloud app create --region=us-central;
gcloud alpha firestore databases create --region=us-central) & (gcloud functions deploy dialogflowFirebaseFulfillment --region=us-central1 \
--runtime=nodejs10 --source=./cloudfunction/1/ --allow-unauthenticated \
--trigger-http);

#cd ..
