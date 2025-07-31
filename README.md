#  Minimal Health Check Container

This container is a tiny HTTP health endpoint built with Go and based on the scratch image (0 dependencies, ~1–2 MB image size).

It listens on the port specified by the PORT environment variable and responds to root / requests with a JSON payload indicating health.


##  What It Does

* Listens on a configurable TCP port
* Returns HTTP 200 OK with body:
        `{"status":"healthy"}`

* Designed for minimal resource usage and fast startup


## Usage

1. Build the image

```bash
docker build -t healthcheck .
```

2. Run the Container

```bash
docker run -e PORT=3000 -p 3000:3000 healthcheck
```

3. Test the Endpoint

```bash
curl http://localhost:3000
```

# Environment Variables

You can change the exposed port by modifying the PORT environment variable.
For example, to run on port 8080:

```bash
docker run -e PORT=8080 -p 8080:8080 healthcheck
```


## Use Cases

* Kubernetes livenessProbe or readinessProbe
* Docker Compose health checks
* Lightweight health status for any containerized service


