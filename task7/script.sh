gcloud auth revoke --all
gcloud init < a

gcloud config set compute/region us-central1
gcloud config set compute/zone us-central1-a

cd gke-security-scenarios-demo

sed -i 's/f1-micro/n1-standard-1/g' terraform/variables.tf

make setup-project

cat terraform/terraform.tfvars

make create
