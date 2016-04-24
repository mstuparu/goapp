FROM golang:latest
MAINTAINER mstuparu

COPY src /app/

WORKDIR /app

RUN go build -o app .

EXPOSE 8484

CMD /app/app
