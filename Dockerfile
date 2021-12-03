FROM gcr.io/google.com/cloudsdktool/cloud-sdk:alpine
LABEL maintainer="Engenharia Arquivei <engenharia@arquivei.com.br>"

ARG PACKER_VERSION=1.7.8

RUN addgroup -S packer && adduser -S packer -G packer

RUN apk add --update git bash wget openssl

RUN curl --output /tmp/packer.zip https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
    && unzip /tmp/packer -d /bin

# USER packer
WORKDIR /app

ENTRYPOINT ["/bin/packer"]
