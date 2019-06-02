Set up:

```sh
docker swarm init && docker stack deploy -c docker-compose.yml fortressone
```


Tail log:

```sh
docker-compose logs
```


Pull down:

```sh
docker stack rm fortressone && docker swarm leave --force
```
