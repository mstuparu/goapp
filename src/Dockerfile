FROM golang:latest
MAINTAINER mstuparu

COPY app.go /app/

WORKDIR /app

RUN go build -o app .

EXPOSE 8484

CMD /app/app
