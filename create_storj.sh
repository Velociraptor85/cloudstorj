### Easy script that starts google cloud VM, installs everything which is necessary on it,
### installs storj, and hosts a storj-client. 

### USAGE INSTRUCTIONS:
### Run: sh create_storj.sh PROJECT_NAME ETH_ADDRESS
### You will get some options, just enter the logical choice (most often Y)
### In the very end, you will arrive at a text editor: Write :wq and press enter

### Donations: 0x7D53b23e0f9004E3B15F5965ca2BBC56ED2E1Cc8 ###

#Create VM-container
gcloud beta compute --project "$1" instances create "storj" --zone "us-east1-b" --machine-type "n1-standard-1" --subnet "default" --maintenance-policy "MIGRATE" --service-account "898979010989-compute@developer.gserviceaccount.com" --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --min-cpu-platform "Automatic" --image "debian-9-stretch-v20180206" --image-project "debian-cloud" --boot-disk-size "510" --boot-disk-type "pd-standard" --boot-disk-device-name "storj" 

#Set up forwarding rule
gcloud compute --project=$1 firewall-rules create firewall-rule --direction=INGRESS --priority=1000 --network=default --action=ALLOW --rules=tcp:7000 --source-ranges=0.0.0.0/0

#Install prereqs, get storjshare-daemon, install, initiate.
gcloud compute ssh storj --command='sudo apt-get update && sudo apt-get install git python build-essential && git clone https://github.com/Storj/storjshare-daemon && wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash && export NVM_DIR="/home/erik/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && nvm install --lts && npm install --global storjshare-daemon && storjshare daemon && mkdir ~/storj && storjshare-create --storj $2 --storage=/storj --size=500GB --rpcport=7000 --manualforwarding -o /config && storjshare start --config=/config'
