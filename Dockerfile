# Use a minimal base image with Alpine Linux
FROM alpine:latest

# Install dependencies
RUN apk add --no-cache curl

# Download the latest PocketBase release
RUN curl -L -o /pocketbase.zip https://github.com/pocketbase/pocketbase/releases/latest/download/pocketbase_linux_amd64.zip \
    && unzip /pocketbase.zip -d /pocketbase \
    && rm /pocketbase.zip

# Set working directory
WORKDIR /pocketbase

# Expose PocketBase port
EXPOSE 8090

# Run PocketBase
CMD ["./pocketbase", "serve", "--dir", "/pb_data"]
