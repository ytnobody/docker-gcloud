# ytnobody/gcloud

Google Cloud SDK in Docker Container

## REQUIRES

* A Service Account of Google Cloud Platform (PRIVATE KEY in JSON Format and Email Address)

* Project-ID of Google Cloud Platform

## SYNOPSIS

### 1. Build and run your Service-Account Container

This is an example Dockerfile of your Service-Account Container.

    FROM busybox
    RUN mkdir /opt/gcloud
    
    # Add Private Key
    ADD your-privkey.json /opt/gcloud/your-privkey.json
    
    # Add Email Address
    RUN echo 'your-service-account@developer.gserviceaccount.com' > /opt/gcloud/account.txt
    
    # Add Project-ID
    RUN echo 'your-project-id-12345' > /opt/gcloud/project_id.txt
    
    # export your /opt
    VOLUME /opt
    
    # for daemonize
    CMD ["/bin/sh"]

Then, build and run it.

    $ sudo docker build -t yourname/gcloud-account ./
    $ sudo docker run --name gcloud-account -dt yourname/gcloud-accout

### 2. Pull and Run gcloud container

    $ sudo docker pull ytnobody/gcloud
    $ sudo docker run --name gcloud --volumes-from gcloud-account -dt ytnobody/gcloud

### 3. Enjoy gcloud!

    $ sudo docker exec gcloud bq query 'select ... ;'


