default: up

up: 
	@vagrant up

stop: 
	@vagrant suspend

status:
	@vagrant status

resume:
	@vagrant resume

dependencies:
	@vagrant plugin install vagrant-hostsupdater
	@vagrant plugin install vagrant-vbguest

install: 
	@cd ansible && ansible-galaxy install -r requirements.yml

update: 
	@cd ansible && ansible-galaxy install -r requirements.yml --force

cluster: 
	@cd ansible && ansible-playbook -i inventories/local/inventory playbooks/kubernetes.yml 

reset: 
	@cd ansible && ansible-playbook -i inventories/local/inventory playbooks/reset-cluster.yml 
