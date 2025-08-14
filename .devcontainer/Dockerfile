#
FROM debian:latest
#
ENV DEBIAN_FRONTEND=noninteractive
# Install apt packages here
RUN apt-get update && apt-get install -y python3 \
  python3-pip \
  git && \
  apt-get clean autoclean && \
  apt-get autoremove
# Install python packages here. Note the `--break-system-packages` option being
# passed to be able to install with pip (Debian prevents it otherwise as they
# now require the use of a virtual environment).
RUN pip3 install --break-system-packages --upgrade pip && \
  pip3 install --break-system-packages black matplotlib numpy pandas Pyarrow seaborn
# Creation of a group and user of gid and uid 1000 to match local gid and uid
# and avoid running into permissions issues when editing the files in or out of
# the docker container.
RUN addgroup --gid 1000 vscode
RUN adduser --disabled-password --gecos "" --uid 1000 --gid 1000 vscode
ENV HOME=/home/vscode
USER vscode