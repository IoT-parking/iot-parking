FROM ghcr.io/foundry-rs/foundry:latest

USER root

WORKDIR /app

RUN forge init --force

RUN forge install OpenZeppelin/openzeppelin-contracts

COPY src/ src/
COPY script/ script/
COPY entrypoint.sh .

RUN chmod +x entrypoint.sh

EXPOSE 8545

ENTRYPOINT ["./entrypoint.sh"]