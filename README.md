# FortressOne docker compose

Set up:

```sh
docker-compose up -d
```

Tail logs:

```sh
docker-compose logs
```

Pull down:

```sh
docker-compose down
```

## Fire up a local server

Create a .env file like this:

```
export FO_IP="220.123.456.789"
export FO_HOSTNAME="FortressOne Woop Woop"
export FO_RCON_PASSWORD=rc0n_p4$$w0rd
export FO_ADMINPWD=adm1n_p4$$w0rd
export FO_PASSWORD=serv3r_p4$$w0rd
```

This will fire up servers on ports 27500-27504.


## Create a new server instance with docker-machine

E.G. I used this for Tokyo:

```
docker-machine create --driver amazonec2 --amazonec2-access-key <AWS_ACCESS_KEY> --amazonec2-secret-key <AWS_SECRET_KEY> --amazonec2-root-size 30 --amazonec2-region ap-northeast-1 --amazonec2-open-port 27500/udp --amazonec2-open-port 27501/udp --amazonec2-open-port 27502/udp --amazonec2-open-port 27503/udp --amazonec2-open-port 27504/udp tokyo
```


## Deploy progs to staging:

- Install [docker](https://docs.docker.com/install/), [docker-compose](https://docs.docker.com/compose/install/) [docker-machine](https://docs.docker.com/machine/install-machine/) and [machine-share](https://github.com/bhurlow/machine-share)
- Get credentials for server at: https://docs.zoho.com/home#folder/f7owk1b9278d83c644ad2ab83d58fcff11231
- Import credentials
    ```sh
    machine-import <machine-name>.zip
    ```
- Configure current shell session to use docker-machine
    ```sh
    eval $(docker-machine env <machine-name>)
    ```
- scp the files
    ```sh
    docker-machine scp server-qwprogs/qwprogs.dat <machine-name>:/home/ubuntu/fortressone_progs/staging
    docker-machine scp server-qwprogs/csprogs.dat <machine-name>:/home/ubuntu/fortressone_progs/staging
    docker-machine scp server-qwprogs/menu.dat <machine-name>:/home/ubuntu/fortressone_progs/staging
    ```
- optionally restart the server
    ```sh
    docker-compose restart
    ```

## To Do

- [x] auto update maps
- [x] auto update qwprogs
- [x] sane default config
- [x] autorecord and mvd file server
- [x] integrate with discord server bot
- [ ] qtv
- [ ] stats
