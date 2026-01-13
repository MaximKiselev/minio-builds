# MinIO Community Edition Builds

> **Automated nightly builds of MinIO Community Edition binaries and Docker images**

## Why This Exists

MinIO no longer provides pre-compiled binaries for the Community Edition as of early October 2025. The official distribution model now requires users to build from source or use commercial releases.

This repository automatically builds the latest MinIO Community Edition releases nightly, providing:

- **Docker images** (multi-architecture: amd64/arm64)
- **Standalone binaries** (Linux amd64/arm64/windows)
- **Automated builds** from official MinIO source code
- **Transparent build process** using GitHub Actions

## Quick Start

### Docker (Recommended)

Pull and run the latest MinIO build:

```bash
# Pull the image (works on both amd64 and arm64)
docker pull ghcr.io/maximkiselev/minio:latest

# Run MinIO server
docker run -p 9000:9000 -p 9001:9001 \
  -v /path/to/data:/data \
  --name minio \
  ghcr.io/maximkiseklev/minio:latest

# Access the console at http://localhost:9001
# Default credentials: minioadmin / minioadmin
```

### Binary Installation

Download the binary for your platform from the [latest release](https://github.com/golithus/minio-builds/releases/latest):

```bash
# Linux AMD64
wget https://github.com/golithus/minio-builds/releases/latest/download/minio-linux-amd64
chmod +x minio-linux-amd64
sudo mv minio-linux-amd64 /usr/local/bin/minio

# Linux ARM64
wget https://github.com/golithus/minio-builds/releases/latest/download/minio-linux-arm64
chmod +x minio-linux-arm64
sudo mv minio-linux-arm64 /usr/local/bin/minio

# Windows
powershell -Command "Invoke-WebRequest -Uri 'https://github.com/MaximKiselev/minio-builds/releases/download/RELEASE.2025-10-15T17-29-55Z/minio-windows-amd64.exe' -OutFile 'minio.exe'"
 

# Verify the installation
minio --version
```


## Available Images & Binaries

### Docker Images

Multi-architecture Docker images are published to GitHub Container Registry:

```bash
# Latest release
ghcr.io/golithus/minio:latest

# Specific version
ghcr.io/golithus/minio:RELEASE.2025-01-15T12-00-00Z
```

**Supported Architectures:**
- `linux/amd64` (x86_64)
- `linux/arm64` (aarch64)

Docker automatically selects the correct architecture for your system.

### Binary Downloads

Each release includes:
- `minio-linux-amd64` - Linux x86_64 binary
- `minio-linux-arm64` - Linux ARM64 binary
- `*.sha256sum` - SHA256 checksums for verification

## Disclaimer

These builds are provided as-is, without warranty. While we strive for reliability and accuracy, this is a community service project. For production workloads requiring SLA-backed support, consider:

## Contributing

Suggestions and improvements welcome! Please open an issue or pull request.

### Build Your Own

Want to run these builds yourself? Fork this repository and:

1. Enable GitHub Actions
2. Ensure you have access to ARM64 runners (or modify the workflow)
3. Update repository owner references in the workflow
4. Trigger the workflow manually or wait for the schedule

---

thanks 
- [MinIO AIStor](https://www.min.io/product/aistor) (official enterprise edition)
- [Lithus](https://github.com/golithus/minio-builds/) ( binaries)
- [georgmangold](https://github.com/georgmangold/console) (panel)

