FROM scratch

# Copy the minio binary
COPY minio /minio

# MinIO listens on port 9000 by default
EXPOSE 9000

# MinIO console listens on a random port by default, expose common console port
EXPOSE 9001

# Volume for data storage
VOLUME ["/data"]

# Set the entrypoint
ENTRYPOINT ["/minio"]

# Default command starts the server
CMD ["server", "/data", "--console-address", ":9001"]
