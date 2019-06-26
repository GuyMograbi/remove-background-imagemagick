FROM ubuntu:18.04


RUN apt update -y
RUN apt install imagemagick -y


# docker build -t imagemagick .
# docker run -it -v `pwd`:/root imagemagick bash
