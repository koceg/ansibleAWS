FROM python:3.8.1-alpine

RUN apk add libffi-dev openssl-dev build-base \
    && adduser -g '' -h /home/ansible -u 1000 -D -s /sbin/nologin ansible

USER ansible

RUN pip3 install --user boto boto3 ansible

VOLUME /playbookRepo

# docker run -it -v $PWD:/playbookRepo --rm ansible:aws
