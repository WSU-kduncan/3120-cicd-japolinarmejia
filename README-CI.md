# Part 1 - Dockerize it

installing apache 2
docker run -d --name apache2-container -e TZ=UTC -p 8080:80 ubuntu/apache2:2.4-22.04_beta

## CI Project Overview
This project's pupose is to design create a deployable docker image with an imbedded website using the Apache httpd docker image. Creating docker images for websites, and other applications, simplifies the deployment of these applications across multiple hosts in a network. This project requires the following tools:  
 - WSL2
 - Docker Desktop
 - GitHub Desktop

If performing this lab in a local Windows Machine, follow these steps:
 - Open the Microsoft Store and search for WSL2 and click Install on Ubuntu 22.04.2 LTS. wait until WSL2 is fully installed before continuing to the following step.
 - After installing WSL2, browse to the [Docker website](https://docs.docker.com/desktop/install/windows-install/) and install Docker by clicking on `Desktop for Windows`. reboot the system when the installation is complete
 - Proceed to install Github Desktop and link it to the repo for this project

To build an image from the `Dockerfile`: 
 - Create the Dockerfile in the same folder for the GitHub repo.
 - Add the following to the Dockerfile:
    ```  
    FROM httpd:2.4

    COPY ./website/ /usr/local/apache2/htdocs/
    ```
 - Save the Dockerfile
 - To create the docker image that is named `website` and that it also uses the Dockerfile, run the following command:
    ```  
    docker build -t my-apache2 .
    ```
 - To ensure that the image has been created, type the following:
    ```  
    docker images
    ```
 - The image with the name `website` should appear
 - To create a container named `my-website` and with the image `website`, type the following:
    ```   
    docker run -d --name my-website -p 8080:80 website
    ```
 - To see if the image has been succesfully created and running, type the following comman:
    ```   
    docker ps
    ```
 - To test the website, open a web browser and type:
    ```
    127.0.0.1:8080
    ```

# Part 2 - GitHub Actions and DockerHub
Follow these steps to create public repo in DockerHub:
- Naviage to [Docker](https://hub.docker.com/signup)and enter your account information. click Sign Up
- On the page for `Choose a Plan`, click on `Continue with Free`





- How to authenticate with DockerHub via CLI using Dockerhub credentials
  - what credentials would you recommend providing?
- How to push container image to Dockerhub (without GitHub Actions)
- Configuring GitHub Secrets
  - How to set a secret
  - What secret(s) are set for this project
    - Note: do not copy paste your secrets into your documentation
- Behavior of GitHub workflow
  - what does it do and when
  - what variables in workflow are custom to your project
    - think may need to be changed if someone else is going to use it or you reuse it

# Part 3 - GitHub Actions and DockerHub

Include a diagram (or diagrams) of the continuous integration process.  A good diagram will label tools used and how things connect.  This diagram would probably look best near your project description.