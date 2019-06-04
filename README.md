# FortressOne docker compose

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

## To Do

- [ ] auto update qwprogs
- [ ] integrate with discord server bot
- [ ] qtv
- [ ] autorecord and mvd file server
- [ ] stats
