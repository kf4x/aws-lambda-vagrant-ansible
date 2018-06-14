# Welcome

This will (hopefully) make it easy to deploy a python 3.6 lambda to AWS.


## Initial Setup
```bash
# build
vagrant up

# move into machine
vagrant ssh

# set up ssh
ssh-keygen -t rsa -b 2048

# set up ansible
ansible-playbook /vagrant/playbooks/ssh-addkey.yml --ask-pass
```

## AWS

###  Credentials
You need to specify a region as well

file: `.aws/credentials`
```
[default]
aws_access_key_id=
aws_secret_access_key=
region=
```

### Lambda
You will need to edit:

1. `LAMBDA_ARN` [here](/playbooks/deploy-lambda-function.yml#L11)
2. `name` [here](/playbooks/deploy-lambda-function.yml#L14)
3. `description` [here](/playbooks/deploy-lambda-function.yml#L20)


## Installing packages
When deploying,AWS-Lambda [requires](https://docs.aws.amazon.com/lambda/latest/dg/lambda-python-how-to-create-deployment-package.html) that all packages are in the same dir as the .py files.

```
pip3 install package -t /home/vagrant/app/ 
```

## Deploy
Calls an ansible playbook to zip and send up to aws

```bash
deploy
```