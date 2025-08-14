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

We provide a [`Dockerfile`](./Dockerfile) and under
[`.devcontainer/`](.devcontainer/) the configurations for direct integration
with VS Code (see [guide
here](https://github.com/PoPETS-AEC/examples-and-other-resources?tab=readme-ov-file#vs-code-and-docker-integration)).

To manually build the image and launch the Docker container, follow the
instructions below:

1. Build the Docker image:
```bash
docker build -t choose-image-name:choose-tag-name .
```

2. Create and deploy the Docker container by mounting the current working
   directory, i.e., this repository with the code, as a volume to access from
   the container, specifying the working directory to be that volume, and giving
   us access to a bash terminal:
```bash
docker run --rm -it -v ${PWD}:/workspaces/choose-project-name \
    -w /workspaces/choose-project-name \
    --entrypoint bash choose-image-name:choose-tag-name
```

3. Then, you should be able to execute the example script:
```bash
python3 main.py
```
