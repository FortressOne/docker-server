# FortressOne Server Suite

## Dependencies

Install [Docker Engine](https://docs.docker.com/compose/install/) and
[Docker Compose](https://docs.docker.com/compose/install/)


## Configuration

Edit the `.env.example` and rename it to `.env`.


## Usage

### Start server

This will run five local servers on ports 27500-27504, and automatically pull
down the required assets.

```sh
docker-compose up -d
```

### Tail logs

```sh
docker-compose logs -f
```

### List containers

```sh
docker ps
```

### Attach to interactive shell

```sh
docker attach <container>
```

### Stop

```sh
docker-compose down
```


## Create a new server instance in the cloud

Install [Docker Machine](https://docs.docker.com/v17.09/machine/install-machine/)

E.G. I used this for Tokyo AWS:
```
docker-machine create \
--driver amazonec2 \
--amazonec2-access-key <AWS_ACCESS_KEY> \
--amazonec2-secret-key <AWS_SECRET_KEY> \
--amazonec2-root-size 30 \
--amazonec2-region ap-northeast-1 \
--amazonec2-open-port 27500/udp \
--amazonec2-open-port 27501/udp \
--amazonec2-open-port 27502/udp \
--amazonec2-open-port 27503/udp \
--amazonec2-open-port 27504/udp \
tokyo
```

This for Stockholm (where default instance t2.micro isn't available):
```
docker-machine create \
--driver amazonec2 \
--amazonec2-instance-type t3.micro \
--amazonec2-access-key <AWS_ACCESS_KEY> \
--amazonec2-secret-key <AWS_SECRET_KEY> \
--amazonec2-root-size 30 \
--amazonec2-region eu-north-1 \
--amazonec2-open-port 27500/udp \
--amazonec2-open-port 27501/udp \
--amazonec2-open-port 27502/udp \
--amazonec2-open-port 27503/udp \
--amazonec2-open-port 27504/udp \
stockholm
```

This for California (where zone a isn't available):
```
docker-machine create \
--driver amazonec2 \
--amazonec2-access-key <AWS_ACCESS_KEY> \
--amazonec2-secret-key <AWS_SECRET_KEY> \
--amazonec2-root-size 30 \
--amazonec2-region us-west-1 \
--amazonec2-zone b \
--amazonec2-open-port 27500/udp \
--amazonec2-open-port 27501/udp \
--amazonec2-open-port 27502/udp \
--amazonec2-open-port 27503/udp \
--amazonec2-open-port 27504/udp \
california
```

I used this for Dallas Linode:
```
docker-machine create \
--driver linode \
--linode-token <LINODE_API_TOKEN> \
--linode-instance-type g6-nanode-1 \
--linode-region us-central \
dallas
```


## Record and upload demos to [QWTF Demo Archive](https://demos.fortressone.org)

Add the following confiuration to your .env file. Note these are dummy values,
ask in [FortressOne Discord](https://discord.fortressone.org) for credentials

```
export S3_AWS_ACCESS_KEY_ID="ASDASJKDAJSKDJAKSJDA"
export S3_AWS_SECRET_ACCESS_KEY="aADsdalkjdsaDSadsajdlkaDASdsakdjsaldADsa"
export S3_URI="s3://fortressone-demos/timbuktu/"
```

Then restart the app

```
docker-compose restart
```


## To Do

- [x] auto update maps
- [x] auto update qwprogs
- [x] sane default config
- [x] autorecord and mvd file server
- [x] QWFWD
- [ ] qtv
- [ ] stats
