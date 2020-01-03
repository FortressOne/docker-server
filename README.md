# FortressOne docker compose

Set up:

```sh
docker-compose up -d
```

List containers:

```sh
docker ps
```

Tail logs:

```sh
docker-compose logs -f
```

Attach to interactive shell:

```sh
docker attach <container>
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
export STORAGE_AWS_SECRET_ACCESS_KEY="klasjdlkjlkjaksjdj3ij2l34lk2jk432jlk4j32"
export STORAGE_AWS_ACCESS_KEY_ID="KDJSAAJSDJSDKALJDLKA"
```

This will fire up servers on ports 27500-27504.


## Create a new server instance with docker-machine

E.G. I used this for Tokyo AWS:
```
docker-machine create --driver amazonec2 --amazonec2-access-key <AWS_ACCESS_KEY> --amazonec2-secret-key <AWS_SECRET_KEY> --amazonec2-root-size 30 --amazonec2-region ap-northeast-1 --amazonec2-open-port 27500/udp --amazonec2-open-port 27501/udp --amazonec2-open-port 27502/udp --amazonec2-open-port 27503/udp --amazonec2-open-port 27504/udp tokyo
```

This for Stockholm (where default instance t2.micro isn't available):
```
docker-machine create --driver amazonec2 --amazonec2-instance-type t3.micro --amazonec2-access-key <AWS_ACCESS_KEY> --amazonec2-secret-key <AWS_SECRET_KEY> --amazonec2-root-size 30 --amazonec2-region eu-north-1 --amazonec2-open-port 27500/udp --amazonec2-open-port 27501/udp --amazonec2-open-port 27502/udp --amazonec2-open-port 27503/udp --amazonec2-open-port 27504/udp stockholm
```

This for California (where zone a isn't available):
```
docker-machine create --driver amazonec2 --amazonec2-access-key <AWS_ACCESS_KEY> --amazonec2-secret-key <AWS_SECRET_KEY> --amazonec2-root-size 30 --amazonec2-region us-west-1 --amazonec2-zone b --amazonec2-open-port 27500/udp --amazonec2-open-port 27501/udp --amazonec2-open-port 27502/udp --amazonec2-open-port 27503/udp --amazonec2-open-port 27504/udp california
```

I used this for Dallas Linode:
```
docker-machine create --driver linode --linode-token <LINODE_API_TOKEN> --linode-instance-type g6-nanode-1 --linode-region us-central dallas
```


## To Do

- [x] auto update maps
- [x] auto update qwprogs
- [x] sane default config
- [x] autorecord and mvd file server
- [x] integrate with discord server bot
- [ ] qtv
- [ ] stats
