PROJECT_ID=$(gcloud info --format='value(config.project)')
gsutil mb gs://$PROJECT_ID

gcloud services enable notebooks.googleapis.com compute.googleapis.com oslogin.googleapis.com

export INSTANCE_NAME="tensorflow2020"
export VM_IMAGE_PROJECT="deeplearning-platform-release"
#export VM_IMAGE_FAMILY="tf2-2-2-cpu"
#export VM_IMAGE_FAMILY="tf-latest-cpu"
export VM_IMAGE_FAMILY="tf-1-15-cpu"
export MACHINE_TYPE="n1-standard-4"
export LOCATION="us-central1-b"

gcloud beta notebooks instances create $INSTANCE_NAME \
--vm-image-project=$VM_IMAGE_PROJECT \
--vm-image-family=$VM_IMAGE_FAMILY \
--machine-type=$MACHINE_TYPE --location=$LOCATION 
