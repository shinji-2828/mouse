FROM golang:1.20 as go120

# package
RUN apt-get update 
RUN apt-get install -y git pkg-config libaio-dev jq

# golang
ENV GOPATH=/go
ENV PATH=${PATH}:${GOPATH}/bin

# workspace
ENV REPOSITORY mouse
ARG WORKDIR=${GOPATH}/src/${REPOSITORY}
WORKDIR ${WORKDIR}

RUN go install golang.org/x/tools/cmd/goimports@latest


# RUN go install github.com/volatiletech/sqlboiler/v4@v4.10.2
# RUN go install github.com/volatiletech/sqlboiler/v4/drivers/sqlboiler-psql@v4.10.2
# RUN go get github.com/volatiletech/null/v8@v8.1.0

ENTRYPOINT [ "/usr/bin/tail","-f","/dev/null" ]

# ENTRYPOINT [ "sh","/go/src/mouse/tools/sqlboiler/codegen.sh" ]
# CMD [ "go","get","github.com/volatiletech/null/v8@v8.1.0" ]
# CMD ["go get github.com/volatiletech/null/v8@v8.1.0"]