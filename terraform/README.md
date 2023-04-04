![Scheme](logo/Readme-image.png)



## **Foundersnetwork AWS Cloud Resource Setup**

This tutorial demonstrates how to create and manage resources on AWS Cloud with Terraform.
With Terraform, many of your resources such as VPC, Subnets, IAM policies and AWS Amplify can be managed,
versioned, andeasily recreated for your organization or teams.


## **Objectives**
Create a IAM user to Authenticate terrafom and Configure the remote state in Cloud Storage.
We are going to create Amplify App and Webhook with this terraform code.
We will use existing VPC and Subnet.


## **Usage**

This tutorial assumes that you already have a AWS Cloud account set up for your organization and that you are allowed to make organization-level. changes in the account. 
Commands in this tutorial outside of Terrafrom are run with the AWS CLI. 
This tutorial assumes that you have the AWS CLi tool installed and authorized to work with your account according to the documentation.

 **Replace these value (#ACCOUNT_NAME #ACCESS_KEY_ID #SECRET_ACCESS_KEY) and run below commands.**

    $ apt install awscli
    $ aws configure profile #ACCOUNT_NAME
    $ aws configure aws_access_key_id #ACCESS_KEY_ID
    $ aws configure aws_secret_access_key #SECRET_ACCESS_KEY


 **Add/Create/Replace this value PERSONAL_ACCESS_TOCKEN in dev.tfvars file, you can get this from Git**

This tutorial requires Terraform v1.4.4 and aws provider v4.58.0 version . 



### Now you can switch to the terraform code.

```
cd terraform
``` 

## Next, initialize the terraform module and backend:

```
terraform init
```

## Create the Terraform workspace:

```
#Below commands are used only first time when we create the new git and terraform repository.

terraform workspace list
terraform workspace new dev
terraform workspace new qa 
terraform workspace new stage
terraform workspace new production
```

```
# Run the below command to setup AWS resource in dev environment

terraform workspace list
terraform workspace select dev
```


## Preview the Terraform changes:

```
terraform plan -var-file="../dev-env/dev.tfvars"        #For Dev Environment
terraform plan -var-file="../qa-env/qa.tfvars"          #For QA Environment
terraform plan -var-file="../stage-env/stage.tfvars"    #For Stage Environment
terraform plan -var-file="../prod-env/prod.tfvars"      #For Production Environment
```

## Apply the Terraform changes:

```
terraform apply -var-file="../dev-env/dev.tfvars"        #For Dev Environment
terraform apply -var-file="../qa-env/qa.tfvars"          #For QA Environment
terraform apply -var-file="../stage-env/stage.tfvars"    #For Stage Environment
terraform apply -var-file="../prod-env/prod.tfvars"      #For Production Environment
```



## **Cleaning up (DO NOT RUN THESE COMMANDS UNLESS YOU WANT TO REMOVE RESOURCES)**
First, permanently delete the resources created by Terraform:

```
terraform destroy -var-file="../dev-env/dev.tfvars"        #For Dev Environment
terraform destroy -var-file="../qa-env/qa.tfvars"          #For QA Environment
terraform destroy -var-file="../stage-env/stage.tfvars"    #For Stage Environment
terraform destroy -var-file="../prod-env/prod.tfvars"      #For Production Environment

```


## Authors

- [@Devendra Joshi](https://www.github.com/oedeven)

