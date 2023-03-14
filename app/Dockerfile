FROM python:3.11-slim

RUN apt update && \
    apt install -y \
        nginx \
        supervisor

RUN pip3 install pipenv
RUN useradd nginx


WORKDIR /app
COPY ./Pipfile* ./
RUN pipenv install --system

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/gunicorn.conf /etc/nginx/conf.d/default.conf
COPY supervisor/supervisord.conf /etc/supervisord.conf
COPY src ./

EXPOSE 5000

ENV GUNICORN_CMD_ARGS = ""

ENTRYPOINT [ "/usr/bin/supervisord" ]
