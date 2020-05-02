FROM alpine:3.11.6

RUN apk update && \
    apk add \
        nginx \
        python3 \
        supervisor

RUN pip3 install pipenv

WORKDIR /app
COPY ./Pipfile* ./
RUN pipenv install

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/gunicorn.conf /etc/nginx/conf.d/default.conf

COPY supervisor/supervisord.conf /etc/supervisord.conf
COPY supervisor/conf.d/gunicorn.conf /etc/supervisor/conf.d/gunicorn.conf
COPY supervisor/conf.d/nginx.conf /etc/supervisor/conf.d/nginx.conf

COPY src ./

EXPOSE 5000

ENV GUNICORN_CMD_ARGS = ""

ENTRYPOINT [ "/usr/bin/supervisord" ]
