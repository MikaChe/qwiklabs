gcloud auth revoke --all
gcloud init < a

gcloud container clusters create simplecluster --zone=us-central1-a \
--num-nodes 2 --metadata=disable-legacy-endpoints=false
kubectl version

echo "CHECK1 - Create a simple GKE cluster"
read anykeystrike

kubectl apply -f hostpath.yaml
kubectl get pod

echo "CHECK2 - Create a simple GKE cluster"
read anykeystrike

kubectl delete pod hostpath

gcloud beta container node-pools create second-pool --cluster=simplecluster \
--zone=us-central1-a --num-nodes=1 --metadata=disable-legacy-endpoints=true \
--workload-metadata-from-node=SECURE

echo "CHECK3 - Deploy a second node pool"
read anykeystrike

kubectl create clusterrolebinding clusteradmin --clusterrole=cluster-admin \
--user="$(gcloud config list account --format 'value(core.account)')"

kubectl apply -f prodsecuritypolicy.yaml

kubectl apply -f clusterrole.yaml

kubectl apply -f rolebinding.yaml

echo "CHECK4 - Deploy PodSecurityPolicy objects"
read anykeystrike

gcloud beta container clusters update simplecluster --zone=us-central1-a --enable-pod-security-policy
#apply this first time

gcloud iam service-accounts create demo-developer

MYPROJECT=$(gcloud config list --format 'value(core.project)')

gcloud projects add-iam-policy-binding "${MYPROJECT}" --role=roles/container.developer \
--member="serviceAccount:demo-developer@${MYPROJECT}.iam.gserviceaccount.com"

gcloud iam service-accounts keys create key.json \
--iam-account "demo-developer@${MYPROJECT}.iam.gserviceaccount.com"

gcloud auth activate-service-account --key-file=key.json

gcloud container clusters get-credentials simplecluster --zone=us-central1-a 

kubectl apply -f hostpathnew.yaml

kubectl get pod hostpath -o=jsonpath="{ .metadata.annotations.kubernetes\.io/psp }"

kubectl get pods

echo "CHECK5 - Deploy a blocked pod that mounts the host filesystem"
read anykeystrike

