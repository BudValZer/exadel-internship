# This file will mention tasks, the solution of which is not obvious or require some notes

# EXTRA 1. Write a playbook for installing Docker and one of the (LAMP/LEMP stack, Wordpress, ELK, MEAN - GALAXY do not use) in Docker.

I\`ve prepared a simple LEMP stack for this task, all needed source files are stored in /roles/deploy_lemp/files. Executing shell commands
isn\`t the optimal solution but module <a href="https://docs.ansible.com/ansible/latest/collections/community/docker/docker_compose_module.html">community.docker.docker_compose</a> is outdated at this time and doesn\`t support docker-compose v2.0.0 or newer for now.

# EXTRA 3. For the execution of playbooks, dynamic inventory must be used (GALAXY can be used).

The `ansible-playbook` command must be executed with `-i eu_central_1_staging_aws_ec2.yml` flag.