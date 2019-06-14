FROM ubuntu:18.04
WORKDIR /demo-serve
RUN mkdir pub/ pug/ quad/ duel/
RUN apt-get update && apt-get install -y python3
CMD ["python3", "-m", "http.server", "80"]
