# GoApp 


#### Tools used:

 * https://www.terraform.io/ (install this)
 * https://www.ansible.com/ (install this)
 * https://circleci.com/
 * https://hub.docker.com/

#### Bootstrap project 

###### 1. Environment variables:

```bash
export AWS_ACCESS_KEY_ID=XXXXXXXXXX
export AWS_SECRET_ACCESS_KEY=XXXXXXXXXX
export TF_VAR_aws_access_key=$AWS_ACCESS_KEY_ID
export TF_VAR_aws_secret_key=$AWS_SECRET_ACCESS_KEY
export TF_VAR_aws_ssh_pub_key="XXXXXXXXXX"
```

###### 2. Terraform - Provision AWS infrastructure
```bash
cd terraform
terraform apply
```

###### 3. Ansible - Deploy application
(use the ssh private key corespondent to the one used in step 1)
```bash
cd ansible
ansible-playbook deploy.yml
```

###### 4. CI/CD Pipeline

Integration configured with Circle CI. Every branch is tested for each commit. Pull requests that pass tests and get merged into master get tested and then deployed using the ansible playbook

###### 5. Further improvments

 * Store terraform state file in remote S3/Atlas for colaboration
 * Extend tests to cover terraform and ansible files

