# Use a base image with bash installed
FROM debian:bookworm-slim

# Update package list and install necessary packages
RUN apt-get update && \
    apt-get -y install fortune-mod cowsay netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/games/cowsay /usr/bin/cowsay
RUN ln -s /usr/games/fortune /usr/bin/fortune

# Copy the script into the container
COPY wisecow.sh /wisecow.sh

# Make the script executable
RUN chmod +x /wisecow.sh

# Expose the port the application runs on
EXPOSE 4499

# Define the entrypoint to run the application 
CMD ["./wisecow.sh"]

