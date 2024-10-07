FROM alpine:3.20.3
RUN apk update && \
    apk add --no-cache python3 py3-pip py3-requests git build-base && \
	git clone https://github.com/glinscott/fishtest.git --single-branch --branch master
CMD git -C /fishtest pull && \
    python3 /fishtest/worker/worker.py --concurrency $concurrency $username $password
