FROM golang:1.9
WORKDIR /go/src/github.com/bitly/oauth2_proxy
COPY . .
RUN go get gopkg.in/fsnotify/fsnotify.v1 && mv /go/src/gopkg.in/fsnotify/fsnotify.v1 /go/src/gopkg.in/fsnotify.v1
RUN go-wrapper download && go-wrapper install
#RUN ./test.sh
EXPOSE 4180
CMD ["oauth2_proxy", "-http-address=http://:4180"]
