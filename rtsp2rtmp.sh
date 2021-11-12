#!/bin/sh
while true; do

#ULaw PCM audio with Wyzecam v2 open source firmware https://github.com/EliasKotlyar/Xiaomi-Dafang-Hacks
#gst-launch-1.0 -e rtspsrc location=rtsp://192.168.5.43:8554/unicast name=r ! queue ! rtppcmudepay ! mulawdec ! voaacenc ! flvmux streamable=true name=m r. ! queue ! rtph264depay ! m. m. ! rtmpsink location=rtmp://192.168.5.11/worf/live

#Wyze CAM V3 with Wyze beta rtsp firmware, ALaw PCM audio https://www.amazon.com/gp/product/B08R59YH7W
#gst-launch-1.0 -e rtspsrc location=rtsp://admin:admin@192.168.0.181/live name=r ! queue ! rtppcmadepay ! alawdec ! voaacenc ! flvmux streamable=true name=m r. ! queue ! rtph264depay ! m. m. ! rtmpsink location=rtmp://127.0.0.1/cam1/live

#ALaw PCM audio with SV3C 1080P WiFi Wireless Security Cam Outdoor https://www.amazon.com/gp/product/B07KWD1HWX
gst-launch-1.0 -e rtspsrc location=rtsp://192.168.5.12:554/11 name=r ! queue ! rtppcmadepay ! alawdec ! voaacenc ! flvmux streamable=true name=m r. ! queue ! rtph264depay ! m. m. ! rtmpsink location=rtmp://192.168.5.11/worf/live

sleep 5
done
