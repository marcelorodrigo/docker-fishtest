FROM python:3.12.7-alpine3.20
RUN apk update && \
    apk add --no-cache g++ git build-base make && \
	git clone https://github.com/official-stockfish/fishtest.git --single-branch --branch master
CMD ["sh", "-c", "git -C /fishtest pull && python3 /fishtest/worker/worker.py --concurrency $concurrency $username $password"]