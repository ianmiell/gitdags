FROM ubuntu:14.04
RUN apt-get -y update && apt-get install -y wget 
RUN wget mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar xzf install-tl-unx.tar.gz
RUN ls
RUN ln -s install-tl-[0-9]* install-tl
WORKDIR install-tl
RUN apt-get install -y binutils-multiarch
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
WORKDIR /root/texmf/tex/latex
RUN git clone https://github.com/Jubobs/gitdags.git
RUN kpsewhich gitdags.sty
ADD dagfile_example.tex /root/dagfile_example.tex
WORKDIR /root
RUN pdflatex dagfile_example.tex
RUN apt install -y imagemagick
RUN convert -density 600x600 dagfile_example.pdf -quality 90 -resize 1080x800 dagfile_example.png
RUN mkdir -p /output
ADD README.md /output/README.md
ADD HELP.md /HELP.md
ADD convert_files.sh /convert_files.sh
WORKDIR /output
CMD ["cat","/HELP.txt"]
