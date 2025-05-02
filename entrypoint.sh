#!/bin/sh

# Jalankan mosquitto di background
mosquitto -d

# Jalankan ngrok dan tunnel ke Mosquitto
exec ./ngrok tcp --authtoken "$NGROK_AUTH_TOKEN" --log=stdout --log-level=debug 127.0.0.1:1883
