# FortressOne docker compose

Set up:

```sh
docker swarm init && docker stack deploy -c docker-compose.yml fortressone
```

Or

```sh
docker-compose up
```

Tail logs:

```sh
docker container ls
docker logs -f <name>
```

Pull down:

```sh
docker stack rm fortressone && docker swarm leave --force
```

Or

```sh
docker-compose down --volumes
```

## To Do

- [x] auto update maps
- [x] auto update qwprogs
- [x] sane default config
- [x] autorecord and mvd file server
- [x] integrate with discord server bot
- [ ] qtv
- [ ] stats
