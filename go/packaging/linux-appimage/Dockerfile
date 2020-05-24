FROM ubuntu:bionic
WORKDIR /opt
# RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list
# RUN apt-get clean
RUN apt-get update && \
apt-get install libglib2.0-0 curl file -y
RUN curl -LO https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage && \
chmod a+x appimagetool-x86_64.AppImage && \
./appimagetool-x86_64.AppImage --appimage-extract && \
mv squashfs-root appimagetool && \
rm appimagetool-x86_64.AppImage
ENV PATH=/opt/appimagetool/usr/bin:$PATH
