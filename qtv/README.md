Build qtv:

```
docker build --tag=qtv .
```


Run qtv:

```sh
docker run -p 80:80 qtv
```


Stop qtv:

```sh
docker container ls
docker container stop <hash>
```


Deploy qtv:

```sh
docker tag qtv fortressone/qtv:latest
docker push fortressone/qtv:latest
```
