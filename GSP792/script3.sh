PROJECT_ID=$(gcloud config get-value project)

#cd GCP792

(gcloud firestore import gs://$PROJECT_ID/firebase/second/) & (gcloud functions deploy dialogflowFirebaseFulfillment --region=us-central1 \
--runtime=nodejs10 --source=./cloudfunction/1/ --allow-unauthenticated \
--trigger-http);

#cd ..
