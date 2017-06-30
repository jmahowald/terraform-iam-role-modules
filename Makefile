ALL: get_deps

# HT http://stackoverflow.com/questions/13068152/grep-exit-codes-in-makefile
# Do away with this hack when this is resolved
# https://github.com/hashicorp/terraform/issues/4390
# (can't get the account id from terraform) 
# so instead have make insert it in.
get_deps:
	if grep 'account_id =' terraform.tfvars; \
	then echo "already has account id"; \
	else ./output_account_id_var.sh >> terraform.tfvars; \
	fi

plan: .terraform get_deps
	terraform plan -var-file terraform.tfvars --module-depth 1 -out terraform.tfplan

apply: plan
	terraform apply -var-file terraform.tfvars

.terraform: main.tf
	terraform get

destroy:
	terraform plan -destroy -var-file terraform.tfvars -out terraform.tfplan
	terraform destroy 
