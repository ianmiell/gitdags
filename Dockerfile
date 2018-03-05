FROM ubuntu:14.04
RUN apt-get -y update && apt-get install -y wget binutils-multiarch git imagemagick
RUN wget mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar xzf install-tl-unx.tar.gz
RUN ln -s install-tl-[0-9]* install-tl
WORKDIR install-tl
RUN echo I | ./install-tl
ENV PATH /usr/local/texlive/2017/bin/x86_64-linux:$PATH
RUN latex small2e
RUN tlmgr info pgf
WORKDIR cd $(kpsewhich -var-value=TEXMFHOME)
WORKDIR tex/latex
RUN git clone https://github.com/Jubobs/xcolor-solarized.git
WORKDIR /root/texmf/tex/latex
RUN git clone https://github.com/Jubobs/gitdags.git
ADD dagfile_example.tex /root/dagfile_example.tex
WORKDIR /root
RUN pdflatex dagfile_example.tex
RUN convert -density 600x600 dagfile_example.pdf -quality 90 -resize 1080x800 dagfile_example.png
ADD README.md /README.md
ADD HELP.txt /HELP.txt
ADD convert_files.sh /convert_files.sh
CMD ["cat","/HELP.txt"]
