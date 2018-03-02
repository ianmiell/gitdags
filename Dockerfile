FROM ubuntu 14.04
RUN apt-get -y update && apt-get install -y wget
RUN wget mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar xzf install-tl-unx.tar.gz
cd install-tl-20150208
./install-tl

