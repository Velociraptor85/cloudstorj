#Install gcloud and initiate account, you have to click 'enter', then 'n', then 'n'

curl https://sdk.cloud.google.com | bash ### Hit 'enter', 'no' to improve SDK, 'no' to continue
exec -l $SHELL
gcloud init ### Log in to your account, select project and remember the project name!, no default zone
