Build server-qwprogs:

```
docker build --tag=server-qwprogs .
```


Run server-qwprogs:

```sh
docker run server-qwprogs
```


Stop server-qwprogs:

```sh
docker container ls
docker container stop <hash>
```


Deploy server-qwprogs:

```sh
docker tag server-qwprogs fortressone/server-qwprogs:latest
docker push fortressone/server-qwprogs:latest
```
