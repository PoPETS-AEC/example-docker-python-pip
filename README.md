# example-docker-python-pip

Example of a Dockerized python application using pip to install python packages.
Feel free to reuse and adapt it for your own software artifact or project. No
attribution needed as this is released into the public domain (see [The
Unlicense](LICENSE)).

## Getting Started

**Software requirements:**
- [Docker Engine](https://docs.docker.com/engine/install/)
- [git](https://git-scm.com/downloads)

1. Clone this repository:
   - `git clone git@github.com:PoPETS-AEC/example-docker-python-pip.git` (SSH)
   - `git clone https://github.com/PoPETS-AEC/example-docker-python-pip.git` (HTTPS)

A `Dockerfile` is provided under `.devcontainer/` (for direct integration with
[VS Code](https://gist.github.com/yohhaan/b492e165b77a84d9f8299038d21ae2c9)). To
manually build the image and launch the Docker container, follow the
instructions below:

2. Build the Docker image:
```bash
docker build -t choose-image-name:choose-tag-name .devcontainer/
```

3. Create and deploy the Docker container:
```bash
docker run --rm -it -v ${PWD}:/workspaces/choose-project-name \
    -w /workspaces/choose-project-name \
    --entrypoint bash choose-image-name:choose-tag-name
```

4. Execute the example script
```bash
python3 main.py
```
