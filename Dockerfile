FROM ubuntu:12.10

# Volumes
RUN mkdir /data
VOLUME ["/data"]
VOLUME ["/opt/ghost/content/images"]

#install dependencies
RUN apt-get install -y python g++ make software-properties-common
RUN add-apt-repository ppa:chris-lea/node.js
RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN apt-get update -y

#Install nodejs and unzip
RUN apt-get install -y nodejs unzip

# Add Ghost zip to image
ADD ./ghost-0.4.2.zip /tmp/

# Unzip Ghost zip to /data/ghost
RUN unzip -uo /tmp/ghost-0.4.2.zip -d /opt/ghost

# Install Ghost with NPM
RUN cd /opt/ghost/ && npm install --production

# Add custom config js to /data/ghost
ADD ./config.js /opt/ghost/config.js

#change workdir to opt/ghost
WORKDIR /opt/ghost

# Expose port 2368
EXPOSE 2368

# Run Ghost
ENV NODE_ENV production
RUN pwd
RUN echo $NODE_ENV
ENTRYPOINT ["/usr/bin/npm","start"]
