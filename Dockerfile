# Let's start from an official python docker image - feel free to update the tag
# as needed.
FROM python:3.13.6-trixie

# Configurations for virtual environment, no need to activate, this is it :)
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

# Install python packages here (comment/uncomment based on your workflow)
# Using a requirements.txt file (specifying lower bound values for versions):
COPY requirements.txt .
RUN pip3 install -r requirements.txt
# OR directly running:
# RUN pip3 install "matplotlib>=3.10.5" "numpy>=2.3.2" "pandas>=2.3.1" "pyarrow>=21.0.0" "seaborn>=0.13.2"

# Create group and user to avoid permissions issues with local user/group
# when editing files in and out of docker container.
# Note: GNU/Linux systems assign the default 1000 User Identifier (UID) and
# Group Identifier (GID) to the first account created during installation. It is
# possible that your local UID and GID on your machine may be different, in that
# case you should edit the values in the commands below.
# You can see your UID and GID(s) by executing: `id`
RUN addgroup --gid 1000 groupname
RUN adduser --disabled-password --gecos "" --uid 1000 --gid 1000 username
ENV HOME=/home/username
USER username