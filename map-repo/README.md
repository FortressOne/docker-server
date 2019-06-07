Build map-repo:

```
docker build --tag=map-repo .
```


Run map-repo:

```sh
docker run map-repo
```


Stop map-repo:

```sh
docker container ls
docker container stop <hash>
```


Deploy map-repo:

```sh
docker tag map-repo fortressone/map-repo:latest
docker push fortressone/map-repo:latest
```
