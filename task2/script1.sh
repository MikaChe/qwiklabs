export PROJECT_ID=$(gcloud info --format='value(config.project)')

gcloud compute firewall-rules create default-allow-http --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:80 --source-ranges=0.0.0.0/0 --target-tags=http-server & gcloud compute firewall-rules create default-allow-health-check --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp --source-ranges=130.211.0.0/22,35.191.0.0/16 --target-tags=http-server &

gcloud compute instances create siege-vm --zone=us-west1-c --tags http-server \
--metadata startup-script='#! /bin/bash
# Installs apache and a custom homepage
sudo su -
apt-get update
apt-get install -y siege
'

gcloud compute security-policies create denylist-siege --project=$PROJECT_ID

export EXTERNAL_IP=$(gcloud compute instances describe siege-vm --zone=us-west1-c --format='get(networkInterfaces[0].accessConfigs[0].natIP)')

gcloud compute security-policies rules create 1000 --project=$PROJECT_ID --action='deny-403' --security-policy=denylist-siege --src-ip-ranges=$EXTERNAL_IP

gcloud compute security-policies rules create 2147483647 --action=allow --project=$PROJECT_ID --security-policy=denylist-siege --description="Default rule, higher priority overrides it" --src-ip-ranges=\*

echo "Script1 is finished - sieger-vm and deny rule"
#CHECK1&4
