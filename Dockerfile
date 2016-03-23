FROM phusion/baseimage

ENV DISTRO_DOWNLOAD_URL="http://archlinuxarm.org/os/" DISTRO_FILE_NAME="ArchLinuxARM-rpi-2-latest.tar.gz"

RUN mkdir /app
ADD Makefile /app/
WORKDIR /app

RUN apt-get update && apt-get install -y dosfstools parted make && apt-get clean

VOLUME /tmp/img

CMD make DISTRO_DOWNLOAD_URL=${DISTRO_DOWNLOAD_URL} DISTRO_FILE_NAME=${DISTRO_FILE_NAME}
