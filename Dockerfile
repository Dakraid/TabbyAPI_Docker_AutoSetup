# Version 1.0.3
# Use an official CUDA runtime with Ubuntu as a parent image
FROM nvidia/cuda:12.4.1-runtime-ubuntu22.04

ENV ADMIN_KEY=setMe
ENV API_KEY=setMe

ENV DOWNLOAD_MODEL=true
ENV MODEL_REPO=gghfez/Writer-Large-2411-v2.1-exl2-4.5bpw
ENV MODEL_NAME=gghfez_Writer-Large-2411-v2.1-exl2-4.5bpw

ENV ALWAYS_FETCH_CONFIG=true
ENV CONFIG_URL=https://raw.githubusercontent.com/Dakraid/TabbyAPI_Docker_Config/main/config.yml

ENV LOAD_CUSTOM_JINJA=true
ENV JINJA_URL=https://raw.githubusercontent.com/Dakraid/TabbyAPI_Docker_Config/refs/heads/main/custom.jinja

ARG DO_PULL=true
ARG GIT_REPO=https://github.com/theroyallab/tabbyAPI

ENV DO_PULL=$DO_PULL

# Set the working directory in the container
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    ca-certificates \
    python3.11 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Update repo
RUN if [ ${DO_PULL} ]; then \
    git init && \
    git remote add origin $GIT_REPO && \
    git fetch origin && \
    git pull origin main && \
    echo "Pull finished"; fi


#RUN if [ ${ALWAYS_FETCH_CONFIG} ]; then \
#    curl -o config.yml "$CONFIG_URL"

#RUN if [ ${LOAD_CUSTOM_JINJA} ]; then \
#    curl -o templates/custom.jinja "$JINJA_URL"

# Upgrade pip
RUN pip3 install --no-cache-dir --upgrade pip

# Install
RUN pip3 install --no-cache-dir huggingface-hub hf-transfer

# Install packages specified in pyproject.toml cu121
RUN pip3 install --no-cache-dir .[cu121]

# Copy files
COPY entry.sh entry.sh
RUN chmod +x entry.sh

# Make port 5000 available to the world outside this container
EXPOSE 5000

# Set the entry point
ENTRYPOINT ["bash"]

# Run main.py when the container launches
CMD ["entry.sh"]
