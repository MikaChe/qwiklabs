PROJECT_ID=$(gcloud config get-value project)

#cd GCP792

gcloud firestore import gs://$PROJECT_ID/firebase/first/
gcloud firestore import gs://$PROJECT_ID/firebase/second/

#cd ..
