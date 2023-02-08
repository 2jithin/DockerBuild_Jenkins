# Use an existing image as the base image
FROM centos:7

# Install Apache HTTP server
RUN yum update -y && \
    yum install httpd -y

# Make port 80 available to the host
EXPOSE 100

# Start the Apache service when the container starts
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
