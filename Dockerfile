#FROM golang:alpine AS builder
FROM golang:1.19-buster AS builder

COPY . /app
WORKDIR /app

#RUN go install
#RUN go get
RUN GOOS=linux GOARCH=arm go install
RUN GOOS=linux GOARCH=arm go build -o helloworld



#RUN go build -o helloworld
#RUN go build -o server


FROM alpine
#WORKDIR /app
#COPY --from=builder /app/server /app/
COPY --from=builder /app/helloworld /

#CMD ["/app/server"]
CMD ["/helloworld"]
