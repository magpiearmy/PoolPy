FROM python:3-alpine

RUN apk update && \
    apk add \
        nginx \
        supervisor && \
    apk add --no-cache --virtual .build-deps gcc musl-dev postgresql-dev && \
    apk add --no-cache postgresql-libs

RUN pip3 install pipenv

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
