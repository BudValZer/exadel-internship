sudo chmod 400 ./.ssh/key.pem
sudo cat ./private_script.sh | ssh -i ./.ssh/key.pem -R 8888:us.archive.ubuntu.com:80 ubuntu@'PIPIPA without quotes'