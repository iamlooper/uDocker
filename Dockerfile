# Use Alpine as the base image for a lightweight and secure environment
FROM alpine:latest

# Set environment variables
ENV PIP_ROOT_USER_ACTION=ignore

# Install glibc compatibility layer and bash beforehand
RUN apk update && apk add --no-cache gcompat bash

# Set the working directory
WORKDIR /home

# Copy setup and start scripts
COPY setup.sh /home/setup.sh
COPY start.sh /home/start.sh

# Make scripts executable
RUN chmod +x /home/setup.sh /home/start.sh

# Run setup script
RUN /home/setup.sh

# Expose ports
EXPOSE 80 443 8000 8443 9000 9443

# Set the entrypoint to the start script
ENTRYPOINT ["/home/start.sh"]