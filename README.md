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
vi .aws/credentials

```
Set your LAMBDA_ARN [here](/playbooks/deploy-lambda-function.yml#L11)


## Install

```
pip3 install package -t /home/vagrant/app/ 
```

## Deploy

```
deploy
```