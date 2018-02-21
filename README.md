# cloudstorj
A few easy lines to start a storj farming on google cloud.

Want to start a Storj node but don't know how? Or lack the space yourself? This is an easy way to use your free google cloud credits
and host a Storj node sharing 500GB:s of storage. These few lines and a script will fix setting everything up, including firewalls, prerequisites and installations. 
This will in a few months time convert the 300$ given to you to maybe 30$, but these will
be in the form of a much more usable medium - Cryptocurrency. (Just wait a few years). Google cloud does not allow cryptocurrency 
mining during the free trial, but this is not mining - this is renting out your space for cryptocurrency, a very different thing.

How to use (Linux users):

1. Start a google cloud account, at cloud.google.com
2. Get an ethereum address, at www.myetherwallet.com (follow the instructions, and don't forget to write down the words!)

3. Run the following 3 commands in a terminal to initiate google cloud (just give reasonable answers to the questions)

```curl https://sdk.cloud.google.com | bash ```   
Note: hit 'enter', 'no' to improve SDK, 'no' to continue

```exec -l $SHELLR```
```gcloud init```    

Note: here you have to log into your account, then select a project. Select the available
project name (for instance, esoteric-cab-195717) and note it down! Also, make sure you enter the region 'us-east1-b'.

4. Now, you should have a public ETH address and a project name. Simply run

```sh create_storj.sh PROJECT_NAME ETH_ADDRESS```
Where PROJECT_NAME is the name you wrote down, and ETH_ADDRESS is your ethereum address,

and click the natural choices if prompted (typically 'y'). Congratulations, you are now a Storj node and 
all you have to do is wait for your money to come in! 

To check status, log in via ssh to your instance (log in to google cloud and find the virtual machine. Click on it and you should be given an option to connect) and type: storjshare status. After a month or so you should be sharing at least 200GB.

