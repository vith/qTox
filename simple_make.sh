#!/usr/bin/env bash

if which apt-get; then
    sudo apt-get install \
        git build-essential qt5-qmake qt5-default qttools5-dev-tools \
        libqt5opengl5-dev libqt5svg5-dev libopenal-dev libavdevice-dev \
        libxss-dev qrencode libqrencode-dev libtool autotools-dev \
        automake checkinstall check libopus-dev libvpx-dev libsodium-dev \
        libglib2.0-dev libgdk-pixbuf2.0-dev libgtk2.0-dev \
        libsqlcipher-dev
elif which pacman; then
    sudo pacman -S --needed \
        git base-devel qt5 openal libxss qrencode opus libvpx libsodium
elif which dnf; then
    sudo dnf group install \
        "Development Tools"
    sudo dnf install \
        git qt-devel qt-doc qt-creator qt5-qtsvg  openal-soft-devel \
        libXScrnSaver-devel qrencode-devel opus-devel libvpx-devel \
        qt5-qttools-devel glib2-devel gdk-pixbuf2-devel gtk2-devel \
        libsodium-devel
elif which zypper; then
    sudo zypper in \
        git patterns-openSUSE-devel_basis libqt5-qtbase-common-devel \
        libqt5-qtsvg-devel libqt5-linguist libQt5Network-devel \
        libQt5OpenGL-devel libQt5Concurrent-devel libQt5Xml-devel \
        libQt5Sql-devel openal-soft-devel qrencode-devel \
        libXScrnSaver-devel libQt5Sql5-sqlite libffmpeg-devel \
        libsodium-devel libvpx-devel libopus-devel patterns-openSUSE-devel_basis \
        sqlcipher-devel
else
    echo "Unknown package manager, attempting to compile anyways"
fi

./bootstrap.sh
if [ -e /etc/redhat-release -o -e /etc/zypp ]; then
    qmake-qt5
else
    qmake
fi
make
