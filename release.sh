#!/usr/bin/env bash

# Get the tag for this release
tag=$(echo $HTML_URL | rev | cut -d'/' -f1 | rev)
echo "The tag is ${tag}!!"
