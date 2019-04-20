FROM ubuntu:18.04
WORKDIR /fortressonesv
COPY . /fortressonesv
EXPOSE 27500
ENTRYPOINT ["./fteqw-sv64"]
CMD ["-heapsize 256000"]
