#!/bin/sh

echo "You might be asked for your root password for the Docker deamon."

sudo docker run --rm -it -v $(pwd):/modularity:z -p 8080:8080 asamalik/fedora-docs-dev