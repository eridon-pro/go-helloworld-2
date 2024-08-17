FROM golang:alpine as builder

COPY . /app
WORKDIR /app

RUN go install
#RUN go get


RUN go build -o helloworld
#RUN go build -o server


FROM alpine
#WORKDIR /app
#COPY --from=builder /app/server /app/
COPY --from=builder /app/helloworld /

#CMD ["/app/server"]
CMD ["/helloworld"]
