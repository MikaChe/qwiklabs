PROJECT_ID=$(gcloud info --format='value(config.project)')
gsutil mb gs://$PROJECT_ID
export GCS_BUCKET=gs://$PROJECT_ID
export PROJECT=$PROJECT_ID
export REGION='us-central1'

#gcloud services enable ml.googleapis.com
#gcloud services disable ml.googleapis.com
#gcloud services enable ml.googleapis.com

(JOBNAME=housing_$(date -u +%y%m%d_%H%M%S);

gcloud ai-platform jobs submit training $JOBNAME \
   --region=$REGION \
   --module-name=trainer.task \
   --package-path=./trainer \
   --job-dir=$GCS_BUCKET/$JOBNAME \
   --runtime-version 1.15 \
   --config config.yaml \
   -- \
   --output_dir=$GCS_BUCKET/$JOBNAME/output) && sleep 1 &&

(JOBNAME=housing_$(date -u +%y%m%d_%H%M%S);

gcloud ai-platform jobs submit training $JOBNAME \
   --region=$REGION \
   --module-name=trainer.task \
   --package-path=./trainer \
   --job-dir=$GCS_BUCKET/$JOBNAME \
   --runtime-version 1.15 \
   --scale-tier=STANDARD_1 \
   -- \
   --output_dir=$GCS_BUCKET/$JOBNAME/output) && sleep 1 &&

(JOBNAME=housing_$(date -u +%y%m%d_%H%M%S);

gcloud ai-platform jobs submit training $JOBNAME \
   --region=$REGION \
   --module-name=trainer.task \
   --package-path=./trainer \
   --job-dir=$GCS_BUCKET/$JOBNAME/ \
   --runtime-version 1.15 \
   -- \
   --output_dir=$GCS_BUCKET/$JOBNAME/output) && sleep 1 &&

(JOBNAME=housing_$(date -u +%y%m%d_%H%M%S);

gcloud ai-platform jobs submit training $JOBNAME \
   --region=$REGION \
   --module-name=trainer.task \
   --package-path=./trainer \
   --job-dir=$GCS_BUCKET/$JOBNAME \
   --runtime-version 1.15 \
   --scale-tier=BASIC_GPU \
   -- \
   --output_dir=$GCS_BUCKET/$JOBNAME/output) 
