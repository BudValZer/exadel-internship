# This task was done using Docker version 20.10.12, build e91ed57
# and Docker Compose version v2.2.3
# This file will mention tasks, the solution of which is not obvious or require some notes

# 3.2. Add an environment variable "DEVOPS=<username> to your docker image 
# EXTRA 3.2.1. Print environment variable with the value on a web page
# (if environment variable changed after container restart - the web page must be updated with a new value)

For extra step of this task I`ve been using <a href="http://nginx.org/en/docs/http/ngx_http_ssi_module.html">ngx_http_ssi_module</a> module
which process SSI (Server Side Includes) commands in responses passing through it. This module allows us to
access a variable directly from .html file using `<!--# command parameter1=value1 parameter2=value2 ... -->` syntax.
I also used `envsubst` to parse .template files in nginx to allow webserver catch new environment variable
on every restart. `docker-entrypoint.sh` and `20-envsubst-on-templates.sh` scripts are taken from <a href="https://github.com/nginxinc/docker-nginx">docker-nginx</a> repository.

# 5.  Create docker-compose file. Deploy a few docker containers via one docker-compose file. 
# first image - your docker image from the previous step. 5 nodes of the first image should be run;
# second image - any java application;
# last image - any database image (mysql, postgresql, mongo or etc.).
# Second container should be run right after a successful run of a database container.
#	EXTRA 5.1. Use env files to configure each service.

Project <a href="https://github.com/spring-projects/spring-petclinic">spring-petclinic</a> used as a java application for this task.
I`ve made some small changes to the original progect:
    - removed original docker-compose.yml file from project directory
    - added Dockerfile file to project directory to prepare it to be containerized
    - provided all necessary data about dependant containers in docker-compose.yml file in Task4 root directory

Originaly, spring-petclinic starts it\`s databases as a containers inside the `./mvnw spring-boot:run` process, but in the task I should
run MySQL and\or PostgreSQL container already, so I\`ve decided to change spring-petclinic\`s behavior a little.