FROM ubuntu:18.04
WORKDIR /fortressonesv
COPY . /fortressonesv
EXPOSE 27500
CMD ["./fteqw-sv64 -heapsize 256000"]
