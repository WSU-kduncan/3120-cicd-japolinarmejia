#! /bin/bash
sudo docker stop site
sudo docker rm site
sudo docker pull juanapolinar001/my-website3:latest
sudo docker run -d -p 80:80 --name site juanapolinar001/my-website3:latest
