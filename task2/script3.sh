#sudo apt-get install google-cloud-sdk
#gcloud components install beta
#export PROJECT_ID=$(gcloud info --format='value(config.project)')

gcloud beta compute instance-templates create us-east1-template \
--machine-type=n1-standard-1 --subnet=default \
--network-tier=PREMIUM --metadata=startup-script-url=gs://cloud-training/gcpnet/httplb/startup.sh \
--maintenance-policy=MIGRATE --region=us-east1 --tags=http-server \
--no-shielded-vtpm --no-shielded-integrity-monitoring --reservation-affinity=any

gcloud compute instance-groups managed create us-east1-mig --base-instance-name=us-east1-mig --template=us-east1-template --size=1 --region=us-east1 &&

gcloud beta compute instance-groups managed set-autoscaling "us-east1-mig" --region=us-east1 --cool-down-period "45" --max-num-replicas "5" --min-num-replicas "1" --target-cpu-utilization "0.8" --mode "on"

gcloud compute instance-groups managed set-named-ports "us-east1-mig" --named-ports=http:80 --region=us-east1

gcloud compute backend-services add-backend http-backend \
  --instance-group=us-east1-mig \
  --instance-group-region=us-east1 \
  --balancing-mode=rate \
  --max-rate-per-instance=50 \
  --global \
  --capacity-scaler=1.0

echo "Script3.sh is finished - Instance templeates and instances"
