FROM haskell:latest

COPY src/ /home/dev

WORKDIR /home/dev

ENTRYPOINT ["bash"]
