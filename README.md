Set up:

```sh
$ docker swarm init
$ docker stack deploy -c docker-compose.yml fortressone
```

Pull down:

```sh
$ docker stack rm fortressone
$ docker swarm leave --force
```
