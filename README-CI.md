# Part 1 - Dockerize it

## Overview




installing apache 2
docker run -d --name apache2-container -e TZ=UTC -p 8080:80 ubuntu/apache2:2.4-22.04_beta