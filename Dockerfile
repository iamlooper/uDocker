# Use Ubuntu as the base image for broad compatibility
FROM ubuntu:latest

# Environmental variables
ENV DEBIAN_FRONTEND=noninteractive \
    PIP_ROOT_USER_ACTION=ignore

# Set the working directory
WORKDIR /home

# Copy setup and start scripts
COPY setup.sh /home/setup.sh
COPY start.sh /home/start.sh

# Make scripts executable
RUN chmod +x /home/setup.sh /home/start.sh

# Run setup script
RUN /home/setup.sh

# Expose all ports
EXPOSE 1-65535

# Set the entrypoint to the start script
ENTRYPOINT ["/home/start.sh"]