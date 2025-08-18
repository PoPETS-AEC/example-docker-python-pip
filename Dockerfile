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
# RUN pip3 install matplotlib numpy pandas Pyarrow seaborn

# Create 1000 group and user to avoid permissions issues with local user/group
# when editing files in and out of docker container.
RUN addgroup --gid 1000 username
RUN adduser --disabled-password --gecos "" --uid 1000 --gid 1000 username
ENV HOME=/home/username
USER username