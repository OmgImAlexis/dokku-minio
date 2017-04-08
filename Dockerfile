FROM minio/minio

EXPOSE 5000

RUN adduser -D -u 1000 dokku
USER dokku
WORKDIR /home/dokku

CMD ["server", "--address", ":5000", "/home/dokku/minio/data"]
