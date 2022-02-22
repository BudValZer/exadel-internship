# This task was done using terraform 1.1.4
# AWS credentials and AWS region are stored in terraform cloud
# This file will mention tasks, the solution of which is not obvious or require some notes

# Step 1:Create EC2 Instance t2.micro
#        - Ubuntu
#        - CentOS

There is no CentOS releases in AWS that can fit into Free Tier usage, Amazon Linux 2 (amzn2) used instead

# Step 5: On EC2 Ubuntu install Docker, installation should be done according to the recommendation of the official Docker manuals 

Docs https://docs.docker.com/engine/install/ubuntu/ used for syntax, docker installation was complete due to instance initialization using User Data

# Step 7: EC2 CentOS should have outgoing and incoming access: ICMP, TCP/22, TCP/80, TCP/443, only to EC2 Ubuntu. 
# Step 8: On EC2 CentOS install nginx (note. Remember about step 7, the task can be done in any way, it is not necessary to use terraform)
# - Create a web page with the text “Hello World”. This page must be visible from the  EC2 Ubuntu.

Step 7 can be done on amzn2 without any problem, but step 8 is literally impossible.
According to Amazon documentation https://aws.amazon.com/ru/premiumsupport/knowledge-center/ec2-al1-al2-update-yum-without-internet/,
amzn2 distros are located in AWS S3 buckets in all regions. To enable access to repos, amzn2 should have some additional outbound rules in it`s security group.
To finish this task, I`ve swiched private host OS to Ubuntu-20.04 as an example.
Here are some steps that can be done to install nginx on Private instance without internet access:<br>
1. In User Data for private instance added tiny script that will allow apt use http and https proxy;
2. Directory "ubuntu" and it`s content must be copied to Bastion host (for example using cat);
3. We need to ssh to the Bastion instance using it`s public IP address;
4. While on Bastion, we need to edit public_script.sh (enter private instance private IP address - PIPIPA) and make this file executable (chmod +x);
5. Run public.script.sh and lean back while it doing all need actions :)
6. (optional) Run simple GET request from Bastion to Private to chect if everything is ok (for example, run curl PIPIPA).