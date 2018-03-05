#!/bin/bash
docker run --rm --name=gitdag -v files:/output -ti imiell/gitdags /convert_files.sh
