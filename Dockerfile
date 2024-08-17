FROM golang:alpine AS builder

COPY . /app
WORKDIR /app

#RUN go install
RUN go get


RUN go build -o helloworld


FROM alpine
COPY --from=builder /app/helloworld /

CMD ["/helloworld"]
