FROM centos:7

RUN yum update -y && \
yum install groovy -y


# Set environment variables.
ENV HOME /root
ENV PATH "$PATH:/sonar-runner-2.4/bin"

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
