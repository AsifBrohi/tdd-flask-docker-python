# pull official base image
FROM python:3.12.0-slim-bookworm

# set working directory
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

# set env variables 

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PYTHONPATH=/usr/src/app

# add install & requirments.text
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# add app

COPY . .

# run server 

CMD python manage.py run -h 0.0.0.0