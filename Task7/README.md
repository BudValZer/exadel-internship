# This file will mention tasks, the solution of which is not obvious or require some notes

# 1.2.1 Install Zabbix agents on previously prepared servers or VM.
# EXTRA 1.2.2: Complete 1.2.1 using ansible

Due to some temporary issues with AWS, servers were started on the local home server, no dynamic inventories were used.
Zabbix agents were installed with previously modified configs, so agents can send their hostnames to Zabbix-server machine to perform autoregistration.
Zabbix agent config on the docker host machine was also added with additional UserParameter to keep "docker ps -a" result as a text for Zabbix-server custom dashboard.
See the ansible directory for ansible-playbook source code (note that docker host real hostname is `jenkins` because of the main purpose of that server was to run containerized jenkins).

# EXTRA 2.4: Set up filters on the Logstash side (get separate docker_container and docker_image fields from the message field)

Actually, all the work for this task was done even before data reaches Logstash due to this approach is more flexible. Filebeat was configured with 2 processors: first processor `add_docker_metadata` can grab some additional info about container using docker daemon and container ID (which is known from path to container logs); second one, `decode_json_fields`, decompose all data that usually get to Logstash in `message` field. This approach will allow us to pass data not only to Logstash, but directly to Elasticsearch if needed. Another approach would be using `grok filter plugin` in Logstash\`s filters, but that would limit us to only use Logstats in between of Elasticsearch and Beats. See filebeat directory for sample config.

# 2.5 Configure monitoring in ELK, get metrics from your running containers

Metricbeat was configured to use `docker` module (see metricbeat directory for configs).