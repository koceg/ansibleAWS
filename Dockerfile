FROM python:3.8.1-slim-buster

RUN apt-get update \
    && apt-get install -y git openssh-client curl libffi-dev \
    libssl-dev build-essential \
    && adduser --gecos '' --home /home/ansible --uid 1000 ansible \
    && cd /tmp \
    && curl -O https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz \
    && tar xvf oc.tar.gz \
    && ./oc adm release extract --command openshift-install registry.svc.ci.openshift.org/origin/release:4.4.0-0.okd-2020-03-10-214705 \
    && mv openshift-install /usr/bin/ \
    && pip3 install boto boto3 ansible

USER ansible

VOLUME /playbooks

# docker run -it -v $PWD:/playbooks --rm ansible:aws bash
