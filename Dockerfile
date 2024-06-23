FROM ubuntu:rolling

WORKDIR /app

# Install necessary packages
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    software-properties-common

# Add Node.js 20 repository and install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Add Google Chrome repository and install Google Chrome
RUN curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list' && \
    apt-get update && \
    apt-get install -y google-chrome-stable

# Run the bash script
CMD 
