This task was done using Amazon Web Services

Lint to the webpage on EC2 instance (Route53 A-record was applied):
http://webserver.budvalzer.net
(if there is no connection to the webpage - ping me, instance can be in "stopped" state to
free some resources)

Link to screenshot hosted on S3 bucket:
https://budvalzer-exadel.s3.eu-central-1.amazonaws.com/webpage_screen.png

1. Sign up for AWS, familiarize yourself with the basic elements of the AWS Home Console GUI.
2. Explore AWS Billing for checking current costs. 
3. Create two EC2 Instance t2.micro with different operating systems (Amazon linux / Ubuntu ...).
Try to stop them, restart, delete, recreate.
4. Make sure there is an SSH connection from your host to the created EC2. What IP EC2 used for it?
5. Make sure  ping and SSH are allowed from one instance to another in both ways.
Configure SSH connectivity between instances using SSH keys.

To establish an SSH connection, I need to make sure that Security Group added
to instance contains "allow TCP 22" inbound rule with my public IP address as a source.
We are using Public IPs of instances while connecting to them from the internet,
also we can use their private IP if we are connecting from another instance in the same subnet
on the same VPC or from another instance in different VPC if VPC peering configured.

6. Install web server (nginx/apache) to one instance; 
    - Create a web page with the text “Hello World” and additional information about OS version,
    free disk space,  free/used memory in the system and about all running processes;
    - Make sure your web server is accessible from the internet and you can see your web page in your browser; 
    - Make sure on the instance without nginx/apache you also maysee the content
    of your webpage from instance with nginx/apache.

Bash file contains all needed steps for nginx installation with additional information.

EXTRA (optional): 
    - Run steps 3-6 with instances created in different VPC. (connectivity must be both external and internal IP)	
    - Write BASH script for installing web server (nginx/apache) and creating web pages with text 
    “Hello World”, and information about OS version
    - Run step.6 without “manual” EC2 SSH connection.

For connectivity between different VPC`s we can use VPC peering (additional cost based on traffic intencity, 0.01$/Gb)
and manualy modify route tables for both VPC so they can communicate.
To run step 6 without "manual" EC2 SSH connection, we can copy the .\bash file content into "User Data" field
on "Step 3: Configure Instance Details" when creating instance.

EXTRA (optional optional):
    - Make a screenshot only of your web page сontent from your browser.
    - Create your S3 bucket and place your screenshot there.
    - Make your screenshot visible on the internet for everyone and make sure it works.

Link to my screenshot in s3 is at the top of this README.md file.