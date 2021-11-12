@ECHO OFF

set path=%PATH%;c:\gstreamer\1.0\msvc_x86_64\bin
set GST_DEBUG=0

gst-launch-1.0.exe ^
rtmpsrc location=rtmp://192.168.5.11/lepton/live ^
! flvdemux ! h264parse ! mux. directsoundsrc ^
! queue leaky=1 ^
! audiorate ! audioconvert ^
! voaacenc bitrate=12800 ^
! aacparse ^
! flvmux streamable=true name=mux ^
! rtmpsink location=rtmp://192.168.5.11/shaxs/test sync=true