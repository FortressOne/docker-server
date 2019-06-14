Build demo-serve:

```
docker build --tag=demo-serve .
```


Run demo-serve:

```sh
docker run -p 80:80 demo-serve
```


Stop demo-serve:

```sh
docker container ls
docker container stop <hash>
```


Deploy demo-serve:

```sh
docker tag demo-serve fortressone/demo-serve:latest
docker push fortressone/demo-serve:latest
```
