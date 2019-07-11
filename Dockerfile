FROM golang:1.8 
ENV SOURCE=/go/src/github.com/viglesiasce/gke-info \
    GLIDE_VERSION=v0.12.3
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
RUN wget -q https://github.com/Masterminds/glide/releases/download/${GLIDE_VERSION}/glide-${GLIDE_VERSION}-linux-amd64.tar.gz \
    && tar zxfv glide-${GLIDE_VERSION}-linux-amd64.tar.gz \
    && mv linux-amd64/glide /usr/local/bin
COPY ./glide* $SOURCE/
RUN cd $SOURCE && glide install
COPY . $SOURCE
WORKDIR $SOURCE/cmd/gke-info
RUN go build -o gke-info
CMD ./gke-info
