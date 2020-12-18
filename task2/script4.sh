gcloud beta compute instance-templates create europe-west1-template \
--machine-type=n1-standard-1 --subnet=default \
--network-tier=PREMIUM --metadata=startup-script-url=gs://cloud-training/gcpnet/httplb/startup.sh \
--maintenance-policy=MIGRATE --region=europe-west1 --tags=http-server \
--no-shielded-vtpm --no-shielded-integrity-monitoring --reservation-affinity=any

gcloud compute instance-groups managed create europe-west1-mig --base-instance-name=europe-west1-mig --template=europe-west1-template --size=1 --region=europe-west1 &&

gcloud beta compute instance-groups managed set-autoscaling "europe-west1-mig" --region=europe-west1 --cool-down-period "45" --max-num-replicas "5" --min-num-replicas "1" --target-cpu-utilization "0.8" --mode "on"

gcloud compute instance-groups managed set-named-ports "europe-west1-mig" --named-ports=http:80 --region=europe-west1

gcloud compute backend-services add-backend http-backend \
  --instance-group=europe-west1-mig \
  --instance-group-region=europe-west1 \
  --balancing-mode=utilization \
  --max-rate-per-instance=80 \
  --global \
  --capacity-scaler=1.0

echo "Script4.sh is finished - Instance templeates and instances"
#CHECK2
