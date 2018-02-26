# cloudstorj
A few easy lines to start a storj farming on google cloud.

Want to start a Storj node but don't know how? Or don't have any free storage? This is an easy way to use your free google cloud credits to host a Storj node sharing 500GB:s of storage. Follow these instructions and a script will set everything up, including firewalls, prerequisites and installations. 
This will in a few months time convert the 300$ google cloud credits given to you into real, spendable cash - tokens on a blockchain. I don't know how much you will get from it, but my guess is around 30$. Google cloud does not allow cryptocurrency 
mining during the free trial, but this is not mining - this is renting out your space for cryptocurrency, a very different thing.

How to use (Linux users):

1. Get a free google cloud account, at cloud.google.com
2. Get an ethereum address, at www.myetherwallet.com (follow the instructions, and don't forget to write down the words!)
3. Now, download this repository and navigate to the folder (will also install git if you don't have it:

   ```sudo apt-get install git && git clone https://github.com/Pampyz/cloudstorj && cd cloudstorj ```
4. Run the following 3 commands in a terminal to initiate google cloud:

   ```curl https://sdk.cloud.google.com | bash ```

   ```exec -l $SHELLR``` 

   ```gcloud init```    

   Answer the questions reasonably, after the first command, the answers for me were: 'enter' (for default path), 'no' (to improve SDK), 'no', (to continue with "modifying the profile")
   After the last command, you will have to have to log into your account, and select a project. Select the available
   project name (for instance, esoteric-cab-195717) and note it down! Also, make sure you enter the region 'us-east1-b'.

5. Now, run
   
   ```sh create_vm.sh PROJECT_NAME```
   Where PROJECT_NAME is the project name you just noted down. You will have to press 'y'. When the command is done, you will see a table with an entry       called 'External IP'. Write this down. This looks like 32.302.14.203 or something.

6. Now, you should have a public ETH address and an external ip. Simply run:

   ```sh create_storj.sh EXTERNAL_IP ETH_ADDRESS```
   Where EXTERNAL_IP is the name you wrote down, and ETH_ADDRESS is your ethereum address,

   and click the natural choices if prompted (typically 'y' to continue). In the very last step, you will be shown a text editor with a lot  of text - here you write :wq and press enter. Congratulations, you are now a Storj node and 
all you have to do is wait for your money to roll in! 

To check status, log in via ssh to your instance (log in to google cloud and find the virtual machine. Click on it and you should be given an option to connect) and type: storjshare status. After a month or so you should be sharing at least 200GB.

