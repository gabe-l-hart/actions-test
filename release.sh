#!/usr/bin/env bash

# Get the tag for this release
tag=$(echo $REF | rev | cut -d'/' -f1 | rev)
echo "The tag is ${tag}!!"

# Parse the tag for prefix and suffix
release_type=$(echo $tag  cut -d'-' -f1)
version=$(echo $tag  cut -d'-' -f2)

# Dispatch to the various types of releases
if [ "$release_type" == "test" ]
then
    echo "Running a TEST release"
elif [ "$release_type" == "python" ]
then
    cd src/python
    docker build . \
        --target=publish \
        --build-arg PYTHON_RELEASE_VERSION=$version \
        --build-arg PYPI_TOKEN="test-value"
else
    echo "Unknown release type: [$release_type]"
    exit 1
fi
