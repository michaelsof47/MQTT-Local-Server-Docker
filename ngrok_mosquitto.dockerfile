FROM alpine:latest

# Update apk dan install mosquitto + tool pendukung
RUN apk update && apk add --no-cache \
    curl \
    tar \
    mosquitto \
    mosquitto-clients

# Set Ngrok auth token
ARG NGROK_AUTH_TOKEN
ENV NGROK_AUTH_TOKEN=$NGROK_AUTH_TOKEN

# Pindah ke /app
WORKDIR /app

# Install ngrok
RUN curl -L -o ngrok.tgz https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz && \
    tar -xzf ngrok.tgz && chmod +x ngrok && rm ngrok.tgz

# Copy entrypoint
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
