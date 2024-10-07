FROM ubuntu:22.04
ENV concurrency=1
ENV username=yourusername
ENV password=yourpassword
WORKDIR /
RUN apt update && \
    apt install --yes wget python3 python3-pip python3-requests git build-essential && \
    pip3 install updater && \
	git clone https://github.com/glinscott/fishtest.git --branch master && \
    rm -rf /var/lib/apt/lists/*
CMD git -C /fishtest pull && \
    python3 /fishtest/worker/worker.py --concurrency $concurrency $username $password
