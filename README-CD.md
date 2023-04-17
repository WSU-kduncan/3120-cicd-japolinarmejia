# CD Project Overview
- The first part of this project is to add semantic versioning to project 4 plus the automatization of using webhooks and a script that could pull a new image from Dockerhub. the tools to be used are Ubuntu in AWS, GitHub, Docker Hub and adnanh's webhook.


## Part 1 - Semantic Versioning

- This workflow will be activated when a cahnge is pushed to GitHub with the tag 'vX.X.X'. this will update gitHub and also create a new Docker image with the version 'v.X.X.X' and it will also update the image with the tag 'latest'.

- To enable Docker Hub to receive and create images using the same version 'vX.X.X' from the push to GitHub, the following changes are necessary.

	- Add the following to the 'on' section to activate the workflow when a tag starting with 'v*' is detected:
	'''
	on:
  	  workflow_dispatch:
  	  push:
    	    branches:
      	      - "master"
            tags:
              'v*'
	''' 

	- On the section for 'jobs/build/steps' add the following so that Docker Hub can receive the version number for the new image:
	'''
        name: Docker meta
        id: meta
        uses: docker/metadata-action@v4
        with:
          images: |
            ${{ secrets.DOCKERHUB_USERNAME }}/"the name of the repository"
          tags: |
            type=semver,pattern={{version}}
	'''

	- Finally, the build and push section will provide Docker Hub with the Dockerfile and the tag information necessary for the creation of the name of the image with the format 'vX.X.X':
	'''
	name: Build and push
        uses: docker/build-push-action@v4
        with:
          context: .
          file: ./Dockerfile
          push: ${{ github.event_name != 'push tag' }}
          tags: ${{ steps.meta.outputs.tags }}
          labels: ${{ steps.meta.outputs.labels }}
	'''

- How to generate a tag in git / GitHub
	- To generate a tag in GitHub, run the following command to commit the changes:
	'''
	git commit -a -m "name for update"
	''' 

	- The next step is to look into the next available version number with:
        '''
        git tag
        '''
	
	- After reviewing the list of version number, serach assign the next version number depending of the type of release. To create the nex version, type the following:
        '''
        git tag -a vX.X.X -m "name for update"
        '''

	- to push the new version to Git Hub, type: 
        '''
        git push origin vX.X.X
        '''

- If everything worked properlly, the new Docker image will be posted in [Docker Hub](https://hub.docker.com/r/juanapolinar001/my-website3/tags). 


## Part 2 - Deployment
- The first step is to install Docker Hub in the AWS instance.
	- To isntall Docker in Ubuntu, first update and upgrade the Ubuntu repositories by typing:
	'''
	sudo apt-get update && sudo apt-get upgrade -y
	'''
	
	- Next, ty pe the command to install Docker as:
	'''
	sudo apt install docker
	'''

	- To check if Docker is running, type:
	'''
	sudo systemctl status docker
	'''






























 


