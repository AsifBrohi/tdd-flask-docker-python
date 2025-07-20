# pull official base image
FROM python:3.12.0-slim-bookworm

# set working directory
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

# set env variables 

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH=/usr/src/app

# install system dependencies
RUN apt-get update \
  && apt-get -y install netcat-traditional gcc postgresql \
  && apt-get clean

  # add install & requirments.text
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# add app

COPY . .

# add entrypoint.sh

COPY ./entrypoint.sh .
RUN chmod +x /usr/src/app/entrypoint.sh