#!/bin/bash
docker run --rm --name=gitdag -v $(pwd):/files -ti imiell/gitdags /convert_files.sh
