FROM python:3.6-slim as base

RUN echo "Hello World!"
ARG TEST_ARG

FROM base as next
ARG TEST_ARG
RUN echo "${TEST_ARG}"

FROM python:3.6-slim as restart
ARG TEST_ARG
RUN echo "${TEST_ARG}"
