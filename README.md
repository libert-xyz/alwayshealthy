#  Minimal Health Check Container

##  What It Does

This container is a tiny HTTP health endpoint built with Go and based on the scratch image (0 dependencies, ~3–5 MB image size).

It listens on the port specified by the PORT environment variable and responds to root / requests with a JSON payload indicating health.

* Listens on a configurable TCP port
* Returns HTTP 200 OK with body:
        `{"status":"healthy"}`
* Designed for minimal resource usage and fast startup

## Usage

### 🐳 Quick Start: Use the Prebuilt Image from GitHub Container Registry

You can use the prebuilt multi-architecture image published to GitHub Container Registry (GHCR):

```bash
docker pull ghcr.io/libert-xyz/alwayshealthy:latest
docker run -e PORT=3000 -p 3000:3000 ghcr.io/libert-xyz/alwayshealthy
```

### 🛠️ Or Build Your Own Image


1. **Build the image locally**

```bash
docker build -t alwayshealthy .
```

2. **Run the container**

```bash
docker run -e PORT=3000 -p 3000:3000 alwayshealthy
```

3. **Test the endpoint**

```bash
curl http://localhost:3000
```

## Environment Variables

You can change the exposed port by modifying the PORT environment variable.
For example, to run on port 8080:

```bash
docker run -e PORT=8080 -p 8080:8080 alwayshealthy
```


## Use Cases

* Kubernetes livenessProbe or readinessProbe
* Docker Compose health checks
* Lightweight health status for any containerized service
