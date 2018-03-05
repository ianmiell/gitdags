#!/bin/bash
docker run --rm --name=gitdag -v files:/files -ti imiell/gitdags /convert_files.sh
