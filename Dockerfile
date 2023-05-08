FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y ca-certificates gnupg wget

RUN echo "deb http://archive.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
RUN wget -q -O - https://ftp-master.debian.org/keys/archive-key-9-security.asc | apt-key add -
RUN apt-get update -y
RUN apt-get install -y libssl1.0-dev gcc g++ cmake zlib1g-dev genisoimage bbe git
RUN git clone https://github.com/planetbeing/libdmg-hfsplus.git
WORKDIR /libdmg-hfsplus
RUN cmake .
RUN make
RUN cp dmg/dmg /bin
WORKDIR /exploit

CMD ["/bin/bash"]
