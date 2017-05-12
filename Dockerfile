# scala
FROM centos/s2i-base-centos7

# Labels used in OpenShift to describe the builder image
LABEL summary="testing docker"

# Install Java, SBT, and openshift client
RUN yum update -y && \
    yum install -y java-1.8.0-openjdk && \
    curl https://bintray.com/sbt/rpm/rpm | tee /etc/yum.repos.d/bintray-sbt-rpm.repo && \
    yum install -y sbt

# Cache SBT dependencies and plugins from test app
RUN cd /opt/test-app-root && \
    ./sbt compile