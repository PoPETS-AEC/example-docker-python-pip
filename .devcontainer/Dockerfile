FROM debian:trixie
ENV DEBIAN_FRONTEND=noninteractive
# Install apt packages here
RUN apt-get update && apt-get install -y python3 \
  python3-pip \
  python3-venv \
  black \
  git && \
  apt-get clean autoclean && \
  apt-get autoremove
# Configurations for virtual environment
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
# Install python packages here.
RUN pip3 install matplotlib numpy pandas Pyarrow seaborn
# Create 1000 group and user to avoid permissions issues with local user/group
# when editing files in and out of docker container
RUN addgroup --gid 1000 vscode
RUN adduser --disabled-password --gecos "" --uid 1000 --gid 1000 vscode
ENV HOME=/home/vscode
USER vscode