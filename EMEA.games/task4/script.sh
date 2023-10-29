gcloud auth revoke --all
gcloud init < a

gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-a

gcloud services enable compute.googleapis.com
gcloud services enable container.googleapis.com
gcloud services enable cloudbuild.googleapis.com
cd gke-network-policy-demo
