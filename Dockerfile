FROM python:3.8.1-slim-buster

ENV OKD_VERSION=4.4.0-0.okd-2020-03-24-091256
ENV OKD_URL=registry.svc.ci.openshift.org/origin/release
ENV OC_CLI=https://mirror.openshift.com/pub/openshift-v4/clients/oc/latest/linux/oc.tar.gz

RUN apt-get update \
    && apt-get install -y git curl libffi-dev \
    libssl-dev build-essential \
    && adduser --gecos '' --home /home/ansible --uid 1000 ansible \
    && cd /tmp \
    && curl -O  $OC_CLI \
    && tar xvf oc.tar.gz \
    && ./oc adm release extract --command openshift-install \
    $OKD_URL:$OKD_VERSION \
    && mv openshift-install /usr/bin/ \
    && rm -f /tmp/* \
    && pip3 install boto boto3 ansible \
    && apt-get autoremove -y curl build-essential --purge

USER ansible

VOLUME /playbooks

# docker run -it -v $PWD:/playbooks --rm ansible:aws bash
