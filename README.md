# FortressOne Server Suite

## Dependencies

- [Docker Engine](https://docs.docker.com/compose/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)


## Development

Runs a single FortressOne server on port 27500.


### Configuration

- Locally clone [map-repo](https://github.com/FortressOne/map-repo)
- Clone and compile [server-qwprogs](https://github.com/FortressOne/server-qwprogs)

Edit `.env.example` and save it as `.env`.


### Usage

#### Start server

```sh
docker-compose up -d
```


#### Tail logs

```sh
docker-compose logs -f
```


#### Attach to container

```sh
docker attach <container name>
```

`ctrl-p` `ctrl-q` to detach.


#### Stop server

```sh
docker-compose down
```


## Production

Runs seven automatically updated FortressOne FTE QuakeWorld servers in different modes, two bonus KTX mvdsv servers and QWfwd proxy.

| Mode     | Port  |
| -------  | ----- |
| Pub      | 27500 |
| Duel     | 27501 |
| Clan     | 27502 |
| Quad     | 27503 |
| Trick    | 27504 |
| No Bunny | 27505 |
| Staging  | 27510 |
| KTX DM   | 27600 |
| KTX Race | 27601 |
| QWfwd    | 30000 |


### Configuration

Edit `.env.production_example` and save it as `.env.production`.


### Usage

Before executing commands you must source the production environment file:

```sh
source .env.production
```


#### Start server

```sh
docker-compose up -f production.yml -d
```


#### Tail logs

```sh
docker-compose -f production.yml logs -f
```


#### List containers

```sh
docker ps
```


#### Attach to container

```sh
docker attach <container>
```

`ctrl-p` `ctrl-q` to detach.


#### Stop

```sh
docker-compose -f production.yml down
```


## Create a new server instance in the cloud

Install [Docker Machine](https://docs.docker.com/v17.09/machine/install-machine/).

E.G. I used this for Tokyo AWS:
```
docker-machine create \
  --driver amazonec2 \
  --amazonec2-access-key <AWS_ACCESS_KEY> \
  --amazonec2-secret-key <AWS_SECRET_KEY> \
  --amazonec2-root-size 30 \
  --amazonec2-region ap-northeast-1 \
  --amazonec2-open-port 27500/udp \
  --amazonec2-open-port 27500 \
  --amazonec2-open-port 27501/udp \
  --amazonec2-open-port 27501 \
  --amazonec2-open-port 27502/udp \
  --amazonec2-open-port 27502 \
  --amazonec2-open-port 27503/udp \
  --amazonec2-open-port 27503 \
  --amazonec2-open-port 27504/udp \
  --amazonec2-open-port 27504 \
  --amazonec2-open-port 27505/udp \
  --amazonec2-open-port 27505 \
  --amazonec2-open-port 27510/udp \
  --amazonec2-open-port 27510 \
  --amazonec2-open-port 27600/udp \
  --amazonec2-open-port 27600 \
  --amazonec2-open-port 30000/udp \
  --amazonec2-open-port 28000 \
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
  --amazonec2-open-port 27500 \
  --amazonec2-open-port 27501/udp \
  --amazonec2-open-port 27501 \
  --amazonec2-open-port 27502/udp \
  --amazonec2-open-port 27502 \
  --amazonec2-open-port 27503/udp \
  --amazonec2-open-port 27503 \
  --amazonec2-open-port 27504/udp \
  --amazonec2-open-port 27504 \
  --amazonec2-open-port 27505/udp \
  --amazonec2-open-port 27505 \
  --amazonec2-open-port 27510/udp \
  --amazonec2-open-port 27510 \
  --amazonec2-open-port 27600/udp \
  --amazonec2-open-port 27600 \
  --amazonec2-open-port 30000/udp \
  --amazonec2-open-port 28000 \
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
  --amazonec2-open-port 27500 \
  --amazonec2-open-port 27501/udp \
  --amazonec2-open-port 27501 \
  --amazonec2-open-port 27502/udp \
  --amazonec2-open-port 27502 \
  --amazonec2-open-port 27503/udp \
  --amazonec2-open-port 27503 \
  --amazonec2-open-port 27504/udp \
  --amazonec2-open-port 27504 \
  --amazonec2-open-port 27505/udp \
  --amazonec2-open-port 27505 \
  --amazonec2-open-port 27510/udp \
  --amazonec2-open-port 27510 \
  --amazonec2-open-port 27600/udp \
  --amazonec2-open-port 27600 \
  --amazonec2-open-port 30000/udp \
  --amazonec2-open-port 28000 \
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


## Scripts

### Opening ports on AWS

I had to open port 27600 recently. With correctly configured: ~/.aws/config and ~/.aws/credentials (on Zoho), ports opened with AWS CLI using the following script:

```sh
#!/bin/bash

aws_profiles=( california saopaulo stockholm sydney tokyo virginia )

for p in "${aws_profiles[@]}"
do
echo "${p}"
aws ec2 authorize-security-group-ingress \
    --profile "${p}" \
    --group-name docker-machine \
    --protocol udp \
    --port 27600 \
    --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress \
    --profile "${p}" \
    --group-name docker-machine \
    --protocol tcp \
    --port 27600 \
    --cidr 0.0.0.0/0
done
```


### Set up environment for docker-machine

Requires a `.env.<docker-machine name>` file with FO environment variables set.

```sh
source scripts/connect <docker-machine name>
```


## To Do

- [x] auto update maps
- [x] auto update qwprogs
- [x] sane default config
- [x] autorecord and mvd file server
- [ ] QTV
- [x] QWFWD
- [x] KTX
- [x] race
- [ ] stats
