# owncloud for GCE deployment
This project contain terraform script and ansible playbooks for deploy owncloud on GCE
## Terraform
### Prerequisites
- google cloud engine account
- created project
- installed gcloud && terraform 
- ```terraform init``` in the ```terraform``` directory
### Using
- go to ```terraform``` directory
- create your own terraform.tfvars based on terraform.tfvars.example
- run ```terraform apply```
### Expected results
- google compute instance will be created
- google static IP (premium) will be created
- google vompute firewall rules will be created (80, 443 and 22 tcp)
## Ansible
### Prerequisites
- ansible environment
- terraform-inventory (https://github.com/adammck/terraform-inventory)
### Using
- go to ```ansible``` directory
- create your own vars.yml based on vars.yml.example
- run ```ansible-playbook playbooks/infra.yml```
- run ```ansible-playbook playbooks/deploy.yml```
### Expected results
- docker and docker-compose will be installed on the host instance
- owncloud will be installed
- nginx as a proxy will be installed
## post-install
- create A type of DNS record
- ensure that you can see you instance by ```ping example.org```
- go to the host using command: ```ssh username@example.org -i ~/.ssh/username``` (You must use ssh_user_name from terraform/terraform.tfvars)
- execute initial script for lets encrypt: ```./init-letsencrypt.sh```
## To do
- remove constant from ansible/roles/docker/tasks/config_docker.yml (name: username)

Used resource or/and projects:
- https://github.com/owncloud-docker/server/blob/master/docker-compose.yml
- https://medium.com/@pentacent/nginx-and-lets-encrypt-with-docker-in-less-than-5-minutes-b4b8a60d3a71

