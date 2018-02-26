### USAGE INSTRUCTIONS:
### Run: sh create_storj.sh EXTERNAL_IP ETH_ADDRESS
### You will get some options, just enter the logical choice (most often Y)
### In the very end, you will arrive at a text editor: Write :wq and press enter

#Install prereqs, get storjshare-daemon, install, initiate.
gcloud compute ssh storj --command='sudo apt-get update && sudo apt-get install git python build-essential && git clone https://github.com/Storj/storjshare-daemon && wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash && export NVM_DIR="/home/erik/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && nvm install --lts && npm install --global storjshare-daemon && storjshare daemon && sudo mkdir /home/storj && sudo chmod 777 /home/storj && storjshare-create --storj '$2' --storage=/home/storj --size=500GB --rpcport=7000 --rpcaddress='$1' --manualforwarding -o ~/config && storjshare start --config ~/config'
