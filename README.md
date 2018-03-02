# gitdags

Based on:

http://chrisfreeman.github.io/gitdags_install.html

and

https://github.com/Jubobs/gitdags

See also:

https://stackoverflow.com/questions/1057564/pretty-git-branch-graphs

![example](https://i.stack.imgur.com/Tg7Kn.png)

## Docker Image

```
host $ docker run --rm --name=gitdag -ti imiell/gitdags
docker $ cd /output
docker $ vi yourdagfile.tex
docker $ pdflatex yourdagfile.tex
docker $ convert -density 600x600 dagfile_example.pdf -quality 90 -resize 1080x800 yourdagfile.png
docker $ exit
host $ docker cp gitdag:/output/yourdagfile.png .
```

png is then in output folder co-located with this repo (and .gitignored).

