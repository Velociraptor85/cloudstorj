### USAGE INSTRUCTIONS:
### Run: sh create_storj.sh EXTERNAL_IP ETH_ADDRESS
### You will get some options, just enter the logical choice (most often Y)
### In the very end, you will arrive at a text editor: Write :wq and press enter

#Install prereqs
gcloud compute ssh storj --command='sudo apt-get -y update && sudo apt-get -y upgrade && sudo apt-get -y install git python build-essential'

#get nvm, npm, storjshare-daemon
gcloud compute ssh storj --command='wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash '
gcloud compute ssh storj --command='nvm install --lts && npm install --global storjshare-daemon'
gcloud compute ssh storj --command='nvm alias default \'lts/*\''

#prepare storage location 
gcloud compute ssh storj --command='sudo mkdir /home/storj && sudo chmod 777 /home/storj'

#start storj
gcloud compute ssh storj --command='storjshare daemon && storjshare-create --storj '$2' --storage=/home/storj --size=500GB --rpcport=7000 --rpcaddress='$1' --manualforwarding -o ~/config && storjshare start --config ~/config'

#maybe add watchdog script also
