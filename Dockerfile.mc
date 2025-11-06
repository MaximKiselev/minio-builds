FROM registry.access.redhat.com/ubi9/ubi-minimal:latest AS certs

RUN microdnf update --nodocs --assumeyes \
    && microdnf install ca-certificates --nodocs --assumeyes

FROM registry.access.redhat.com/ubi9/ubi-micro:latest

LABEL maintainer="MinIO Inc <dev@min.io>"

# Copy TLS certificates from the builder image.
COPY --from=certs /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem /etc/pki/ca-trust/extracted/pem/

# Include license information from the upstream repository.
COPY mc-src/CREDITS /licenses/CREDITS
COPY mc-src/LICENSE /licenses/LICENSE

# Add the mc binary produced by the workflow.
COPY mc /usr/bin/mc

RUN chmod +x /usr/bin/mc

ENTRYPOINT ["mc"]
CMD ["--help"]
