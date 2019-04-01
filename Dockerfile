FROM centos:7

RUN yum update -y && \
yum install -y wget && \
yum install -y java-1.7.0-openjdk java-1.7.0-openjdk-devel && \
yum clean all && \
yum install groovy -y && \
yum install maven -y && \
yum install git -y && \
wget -O /etc/yum.repos.d/cloudfoundry-cli.repo https://packages.cloudfoundry.org/fedora/cloudfoundry-cli.repo && \
yum install cf-cli -y && \
wget http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/sonar-runner-dist-2.4.zip && \
yum install unzip -y && \
unzip sonar-runner-dist-2.4.zip && \
yum install which -y && \
yum install gcc openssl-devel bzip2-devel -y && \
cd /usr/src && \
wget https://www.python.org/ftp/python/3.6.8/Python-3.6.8.tgz && \
tar xzf Python-3.6.8.tgz && \
cd Python-3.6.8 && \
./configure --enable-optimizations && \
yum install make -y && \
make altinstall && \
rm /usr/src/Python-3.6.8.tgz

# Set environment variables.
ENV HOME /root
ENV PATH "$PATH:/sonar-runner-2.4/bin"

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
