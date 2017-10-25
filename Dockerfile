# VERSION 1.0
# AUTHOR: Mathieu Bretaud
# DESCRIPTION: Simple Centos 7 image
# BUILD: docker build --build-arg HTTP_PROXY=${http_proxy} --build-arg HTTPS_PROXY=${https_proxy} --tag centos7:0.0.1 .
# SOURCE:

FROM docker.io/nimmis/java-centos:openjdk-7-jdk
MAINTAINER Mathieu Bretaud

### HTTP Proxy configuration
ARG HTTP_PROXY
ENV HTTP_PROXY ${HTTP_PROXY}
ENV http_proxy ${HTTP_PROXY}

### HTTPS Proxy configuration
ARG HTTPS_PROXY
ENV HTTPS_PROXY ${HTTPS_PROXY}
ENV https_proxy ${https_proxy}

ENV TZ Europe/Paris

WORKDIR /usr/share

#RUN yum -y update \
# && yum clean all \
RUN yum install -y authconfig \
 && yum install -y bind-utils \
 && yum install -y curl \
# && yum install -y epel-release \
 && yum install -y gcc \
 && yum install -y git \
 && yum install -y ipset \
 && yum install -y java-1.8.0-openjdk.x86_64 \
 && yum install -y kernel-devel \
 && yum install -y krb5-libs \
 && yum install -y krb5-workstation \
 && yum install -y libcgroup \
 && yum install -y libselinux-python \
 && yum install -y lsof \
 && yum install -y mailx \
 && yum install -y mlocate \
 && yum install -y mysql \
 && yum install -y nc \
 && yum install -y nmap \
 && yum install -y nmap-ncat \
 && yum install -y ntp \
 && yum install -y openssh \
 && yum install -y openssh-clients \
 && yum install -y pam_krb5 \
 && yum install -y postfix \
 && yum install -y socat \
 && yum install -y telnet \
 && yum install -y unzip \
 && yum install -y vim \
 && yum install -y wget \
 && yum install -y yum-utils

### Edit timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone