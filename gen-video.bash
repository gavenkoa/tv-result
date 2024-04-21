#!/bin/bash

# gm convert -list font
# Fails with: gm convert: Unable to read font (/usr/share/fonts/type1/gsfonts/n022003l.pfb) [No such file or directory].
# gm convert -size 800x600 xc:skyblue -fill yellow -draw "rectangle 0,0 800,300" -family italic -pointsize 72 -fill darkred -stroke magenta -draw "text 1,1 Achilles" -fill darkred -stroke magenta ua.png

# convert -list font
convert -size 800x600 xc:skyblue -fill yellow -draw "rectangle 0,0 800,300" \
  -font DejaVu -pointsize 200 -fill darkred -stroke magenta \
  -draw "text 10,200 Achilles" -draw "text 10,500 HackTV" ua.png

# https://en.wikipedia.org/wiki/Television_channel_frequencies
# https://uk.wikipedia.org/wiki/Частоти_телевізійних_каналів
# https://ru.wikipedia.org/wiki/Частоты_телевизионных_каналов
# https://github.com/steeviebops/hacktv-gui/blob/main/src/com/steeviebops/resources/fsphil/Modes.ini
# https://en.wikipedia.org/wiki/Ultra_high_frequency UHF 300M-3G
# https://en.wikipedia.org/wiki/Very_high_frequency  VHF 30M-300M

sox -V -r 48000 -n -b 16 -c 2 ua-10s.ogg synth 1 sin 1000+2000 repeat 10 vol -25dB
ffmpeg -framerate .1 -pattern_type glob -i '*.png' -i ua-10s.ogg -c:a copy -shortest -c:v libx264 -r 30 -pix_fmt yuv420p -y ua-10s.mp4
# hacktv.exe -f 591250000 -g 30 -m pal-k -s 9700000 -r ua-10s.mp4

# sox -V -r 48000 -n -b 16 -c 2 ua-1s.ogg synth 1 sin 1000 vol -20dB
# ffmpeg -framerate 1 -pattern_type glob -i '*.png' -i ua-1s.ogg -c:a copy -shortest -c:v libx264 -r 30 -pix_fmt yuv420p -y ua-1s.mp4
# hacktv -s 16000000 -o ua-1s.bin -m ntsc-i ua-1s.mp4


# hacktv.exe --list-modes
# hacktv.exe -f 591250000 -g 30 -m pal-k -s 9700000 -r ua-10s.mp4
# hacktv.exe -f 591250000 -g 30 -m pal-k -s 9700000 -r ua-10s.mp4
# hacktv.exe -m pal-k -s 9700000 ua-1s.mp4 -t float -o file:ua-1s.cfile
# hacktv.exe -m pal-k -s 9700000 ua-10s.mp4 -t float -o file:ua-10s.cfile

# 591.25MHz is channel 36
# hacktv.exe -f 591250000 -g 30 -m pal-k -s 9700000 -r ua-10s.mp4