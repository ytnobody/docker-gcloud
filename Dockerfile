FROM ytnobody/base:wheezy
MAINTAINER ytnobody <ytnobody@gmail.com>

RUN apt-get update && apt-get install python -y && apt-get clean

WORKDIR /usr/local
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > google-cloud-sdk.tar.gz
RUN tar zxf google-cloud-sdk.tar.gz && rm google-cloud-sdk.tar.gz
RUN ./google-cloud-sdk/install.sh

ADD gcloud_auth /bin/gcloud_auth
ADD run /bin/run

ENV PATH /usr/local/google-cloud-sdk/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

CMD ["/bin/run"]
