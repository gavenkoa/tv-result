
# Base deps

Without following `makepkg-mingw` cannot work:

```
pacman -S base-devel
```

# Preexisting deps

```
pacman -S mingw-w64-x86_64-libusb
pacman -S mingw-w64-x86_64-opus
pacman -S mingw-w64-x86_64-ffmpeg
```

Search for them by:

```
pacman -Ss libusb
pacman -Ss opus
pacman -Ss avco
```

# Git repos

https://github.com/fsphil/hacktv
