FROM ubuntu:latest

# Add deadsnakes PPA and install Python 3.10
RUN apt-get update && apt-get install -y \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update && apt-get install -y \
    python3.10 \
    python3.10-distutils \
    python3-pip \
    git \
    && apt-get clean

# Ensure pip3 is available for Python 3.10
RUN python3.10 -m ensurepip

# Debug steps to check installation
RUN python3.10 --version
RUN pip3 --version

RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]



# FROM ubuntu:latest

# RUN apt-get update && apt-get install -y \
#     python3.10 \
#     python3-pip \
#     git

# # Debug steps to check installation
# RUN python3.10 --version
# RUN pip3 --version

# RUN pip3 install PyYAML

# COPY feed.py /usr/bin/feed.py

# COPY entrypoint.sh /entrypoint.sh

# ENTRYPOINT ["/entrypoint.sh"]
