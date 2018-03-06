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
host $ cd examples
host $ docker run --rm --name=gitdag -v $(pwd):/files -ti imiell/gitdags /convert_files.sh
host $ ls files
.tex a.png
```

## Notes

To change the PDF to "fit" the diagram rather than be a full page sheet, change the document class to:

```
\documentclass[preview]{standalone}
```

Converting the image from pdf to png using:

```
convert -density 300 dagfile.pdf -quality 90 dagfile.png
```
