
gcloud compute url-maps create http-lb --default-service=http-backend

gcloud compute target-http-proxies create http-lb-target-proxy --url-map=http-lb & gcloud compute target-http-proxies create http-lb-target-proxy-2 --url-map=http-lb

wait 2

gcloud compute forwarding-rules create http-lb-forwarding-rule --global --ports=80 --target-http-proxy=http-lb-target-proxy & gcloud compute forwarding-rules create http-lb-forwarding-rule-2 --global --ports=80 --ip-version=IPV6 --target-http-proxy=http-lb-target-proxy-2

wait 2

gcloud compute backend-services get-health http-backend --global

export IP_ADDRESS=$(gcloud compute forwarding-rules describe http-lb-forwarding-rule --global --format json | jq -r ".IPAddress")
echo $IP_ADDRESS

curl -s -I http://$IP_ADDRESS/

#CHECK3 - Load Balancer!
echo "Script5.sh is finished - Load Balancer is installed!"
