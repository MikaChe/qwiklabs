gcloud compute health-checks create tcp http-health-check --check-interval=5 --timeout=5 --unhealthy-threshold=2 --healthy-threshold=2 --port-name=http --port=80

gcloud compute backend-services create http-backend \
  --global \
  --health-checks=http-health-check\
  --protocol=HTTP \
  --port-name=http \
  --connection-draining-timeout=60

echo "Script2 is finished"
