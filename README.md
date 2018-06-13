# Running Vagrant


## Further setup
```
# build
vagrant up

# move into machine
vagrant ssh

# set up ssh
ssh-keygen -t rsa -b 2048

# set up ansible
ansible-playbook /vagrant/playbooks/ssh-addkey.yml --ask-pass


```

## AWS creds
You need to specify a region as well

```
.aws/credentials

[default]
aws_access_key_id=
aws_secret_access_key=
region=us-east
```
And lastly, Set your `LAMBDA_ARN` [here](/playbooks/deploy-lambda-function.yml#L11)


## Installing packages
AWS [requires](https://docs.aws.amazon.com/lambda/latest/dg/lambda-python-how-to-create-deployment-package.html) that all packages are in the same dir as the .py files.

```
pip3 install package -t /home/vagrant/app/ 
```

## Deploy

```
deploy
```