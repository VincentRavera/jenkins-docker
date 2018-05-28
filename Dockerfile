FROM ubuntu:trusty

LABEL maintainer Vincent RAVERA <ravera.vincent@gmail.com>

# Install java
COPY jre-8u161-linux-x64.tar.gz /opt/
RUN cd /opt/; tar -zxvf jre-8u161-linux-x64.tar.gz
ENV JAVA_HOME="/opt/jre1.8.0_161/"

RUN apt-get update

# Install requirements
RUN apt-get install -y wget apt-transport-https

# Begin Install Jenkins
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -

RUN echo deb https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list

RUN apt-get update

RUN apt-get install -y  jenkins

WORKDIR /home/

# Ports
EXPOSE 8080
EXPOSE 50000

# Docker
VOLUME /var/run/docker
VOLUME /var/run/docker.sock

# Run Jenkins
CMD $JAVA_HOME/bin/java -jar /usr/share/jenkins/jenkins.war --httpPort=8080
