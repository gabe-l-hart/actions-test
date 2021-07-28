FROM python:3.6-slim as tests

# This image is only for building, so we run as root
WORKDIR /src

# Install build, test, and publish dependencies
RUN true && \
    pip install pip --upgrade && \
    pip install twine && \
    true

# Copy in everything
COPY . /src

# Run tests
RUN ./ci/run-tests.sh

# Publish
FROM tests as publish
ARG PYPI_TOKEN
ARG PYTHON_RELEASE_VERSION
RUN ./ci/publish.sh
