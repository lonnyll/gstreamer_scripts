@ECHO OFF

:: This is not optimized and generates lots of clock/latency warnings but the video output is nice ;)

set path=%PATH%;c:\gstreamer\1.0\msvc_x86_64\bin
set GST_DEBUG=0

gst-launch-1.0.exe ^
gdiscreencapsrc monitor=0 ^
! videoconvert ^
! nvh264enc rc-mode=2 min-force-key-unit-interval=100 preset=4 vbv-buffer-size=4000 gop-size=-1 bitrate=1024 zerolatency=true ^
! h264parse ^
! "video/x-h264,level=(string)4.1,profile=high" ^
! mux. directsoundsrc ^
! queue leaky=1 ^
! audiorate ! audioconvert ^
! voaacenc bitrate=12800 ^
! aacparse ^
! flvmux streamable=true name=mux ^
! rtmpsink location=rtmp://192.168.5.11/shaxs/test sync=true

:: for AMD accelerated encoding 
:: ! mfh264enc rc-mode=0 min-force-key-unit-interval=100 adaptive-mode=0 vbv-buffer-size=4000 gop-size=-1 bitrate=1024 low-latency=true ^

:: for x264enc
:: ! x264enc pass=cbr key-int-max=100 tune=zerolatency vbv-buf-capacity=4000 intra-refresh=false byte-stream=true bitrate=1024 ^
