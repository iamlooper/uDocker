FROM python:3.12.0

# Environmental variables.
ENV LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive \
    GOOGLE_CHROME_BIN=/usr/bin/google-chrome-stable \
    GOOGLE_CHROME_DRIVER=/usr/bin/chromedriver

# Setup essentials.
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/iamlooper/Docker/main/setup.sh)"

# Expose ports.
EXPOSE 80 8000 8080 443

# Start command.
CMD bash -c "$(curl -fsSL https://raw.githubusercontent.com/iamlooper/Docker/main/start.sh)"