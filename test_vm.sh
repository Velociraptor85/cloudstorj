### Run as sh create_vm.sh 

#Create VM-container
gcloud beta compute instances create "storj" --zone "us-east1-b" --machine-type "n1-standard-1" --subnet "default" --maintenance-policy "MIGRATE" --service-account "898979010989-compute@developer.gserviceaccount.com" --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --min-cpu-platform "Automatic" --image "debian-9-stretch-v20180206" --image-project "debian-cloud" --boot-disk-size "510" --boot-disk-type "pd-standard" --boot-disk-device-name "storj" 

#Set up forwarding rule
gcloud compute firewall-rules create firewall-rule --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:7000 --source-ranges=0.0.0.0/0
