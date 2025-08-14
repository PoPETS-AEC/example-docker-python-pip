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
docker build -t example-docker-python-pip:main .
```

2. Create and deploy the Docker container by mounting the current working
   directory, i.e., this repository with the code, as a volume to access from
   the container, specifying the working directory to be that volume, and giving
   us access to a bash terminal:
```bash
docker run --rm -it -v ${PWD}:/workspaces/example-docker-python-pip \
    -w /workspaces/example-docker-python-pip \
    --entrypoint bash example-docker-python-pip:main
```

3. Then, you should be able to execute the example script:
```bash
python3 main.py
```

## GitHub Workflow

We have also configure a GitHub workflow to automatically build and push the
Docker image to GitHub's Container Registry every time a commit modifies the
`Dockerfile` or the `requirements.txt` file (this can easily be configured to
trigger at every commit on the repository). See under
[`.github/workflows`](.github/workflows/) for more details.

This means that the building step can be skipped locally and the image can
be pulled and used from the Container Registry (verify that the package's
visibility is set to `Public`):

```bash
docker pull ghcr.io/popets-aec/example-docker-python-pip:main

docker run --rm -it -v ${PWD}:/workspaces/example-docker-python-pip \
    -w /workspaces/example-docker-python-pip \
    --entrypoint bash ghcr.io/popets-aec/example-docker-python-pip:main
```

Similarly, it is also possible to push the image to the DockerHub, we defer to
the documentation provided by GitHub
[here](https://docs.github.com/en/actions/tutorials/publish-packages/publish-docker-images).
Note that for DockerHub, an account is required and a token should be generated,
they will have to be provided as a repository variable and a secret,
respectively, for the workflow to be able to use them.