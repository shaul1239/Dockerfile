FROM node:10.15.2  

# setting up proxy
#ENV http_proxy=http://proxy.jfwtc.ge.com:8080 
#ENV https_proxy=http://proxy.jfwtc.ge.com:8080

#installing ng build
RUN set -xe \
    && npm install --unsafe-perm -g node-gyp webpack-dev-server rimraf webpack typescript @angular/cli \
    && rm -rf /var/cache/apk/* /tmp/*

EXPOSE 3000 4200 8080
# make a directory
RUN mkdir -p /opt/ng_build/edgeapp

#copy project
COPY local_project/* /opt/ng_build/edgeapp

#working directory
WORKDIR /opt/ng_build/
