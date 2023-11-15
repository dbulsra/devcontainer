FROM mcr.microsoft.com/devcontainers/go:1.21

RUN go install github.com/securego/gosec/v2/cmd/gosec@v2.16.0
RUN go install honnef.co/go/tools/cmd/staticcheck@v0.4.3
RUN go install golang.org/x/tools/cmd/godoc@latest
RUN apt-get -y update && apt-get -y install gettext python3-polib libsystemd-dev && apt-get clean
CMD ["python3", "-m", "polib"]

# needed by staticcheck
RUN mkdir -p /tmp/.cache/staticcheck ; chmod 1777 /tmp/.cache/staticcheck ; ln -s /tmp/.cache /.cache
