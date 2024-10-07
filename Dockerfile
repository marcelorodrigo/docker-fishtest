FROM alpine:3.20.3
RUN apk update && \
    apk add --no-cache g++ python3 git build-base make && \
	git clone https://github.com/official-stockfish/fishtest.git --single-branch --branch master
CMD git -C /fishtest pull && \
    python3 /fishtest/worker/worker.py --concurrency $concurrency $username $password
