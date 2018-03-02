FROM ubuntu:14.04
RUN apt-get -y update && apt-get install -y wget
RUN wget mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar xzf install-tl-unx.tar.gz
WORKDIR install-tl-20180301
RUN echo I | ./install-tl
ENV PATH /usr/local/texlive/2017/bin/x86_64-linux:$PATH
RUN latex small2e
RUN ls
RUN tlmgr info pgf
RUN kpsewhich -var-value=TEXMFHOME
WORKDIR cd $(kpsewhich -var-value=TEXMFHOME)
WORKDIR tex/latex
RUN apt install -y git
RUN git clone https://github.com/Jubobs/xcolor-solarized.git
RUN kpsewhich xcolor-solarized.sty

