Set up:

```sh
$ docker swarm init
$ docker stack deploy -c docker-compose.yml fortressonesv
```

Pull down:

```sh
$ docker stack rm fortressonesv
$ docker swarm leave --force
```
