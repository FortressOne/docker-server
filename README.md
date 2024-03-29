# FortressOne Server Suite

## Dependencies

- [Docker Engine](https://docs.docker.com/compose/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- Optionally GitLab's fork of the deprecated [Docker Machine](https://gitlab.com/gitlab-org/ci-cd/docker-machine)


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

Runs seven automatically updated FortressOne FTE QuakeWorld servers in
different modes and QWfwd proxy.

| Mode     | Port  |
| -------  | ----- |
| Pub      | 27500 |
| Duel     | 27501 |
| Quad     | 27502 |
| Trick    | 27503 |
| Tourney  | 27504 |
| Staging  | 27510 |
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
docker-compose -f production.yml up -d
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


## Force run updater

```sh
docker exec -it docker-server_updater_1 /updater/sync.sh
```


## Create a new server instance in the cloud

Install [Docker Machine](https://docs.docker.com/v17.09/machine/install-machine/).


### AWS

- Create an IAM user with admin access
- Run `docker-machine create` with arguments as in the examples below, or
  create an EC2 instance and open up ports 27500-27504, 27510 on
  udp and tcp
- Edit `.env.production` and source
- Run `eval $(docker-machine env <name>)`
- Run `docker-machine active` to confirm connection
- Run `docker-compose -f production.yaml up -d && docker-compose -f prodction.yaml logs -tf` to start it up.
- Run `docker exec -it docker-server_updater_1 /updater/sync.sh` to update progs
- Update cloudflare to point to newly created EC2 instance
- New regions aren't being added to docker-machine, but generic instructions beow still work.


E.G. I used this for Sydney:
```
docker-machine create \
  --driver amazonec2 \
  --amazonec2-access-key AKIA5Q3DPGBMILTLCFE2 \
  --amazonec2-secret-key AatUNhC/VPut45Mnw8OEgNdMEqguDU6AdEnxL9qL \
  --amazonec2-root-size 30 \
  --amazonec2-region ap-southeast-2 \
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
  --amazonec2-open-port 27510/udp \
  --amazonec2-open-port 27510 \
  --amazonec2-open-port 30000/udp \
  --amazonec2-open-port 28000 \
  sydney
```

Tokyo:
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
  --amazonec2-open-port 27510/udp \
  --amazonec2-open-port 27510 \
  --amazonec2-open-port 30000/udp \
  --amazonec2-open-port 28000 \
  tokyo
```

This for Stockholm, with non-default VPC and where t2.micro isn't available:
```
docker-machine create \
  --driver amazonec2 \
  --amazonec2-instance-type t3.micro \
  --amazonec2-vpc-id <VPC_ID> \
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
  --amazonec2-open-port 27510/udp \
  --amazonec2-open-port 27510 \
  --amazonec2-open-port 30000/udp \
  --amazonec2-open-port 28000 \
  stockholm
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

N.B. On linode if you get:

```
Error creating machine: Error running provisioning: Unable to verify the Docker daemon is listening: Maximum number of retries (10) exceeded
```

Just restart the VPS and it should work after that.


For a generic server:
- Create user with passwordless sudo access
- Add public key to ~/.ssh/authorized_hosts

I used this for guam:

```
docker-machine create \
  --driver generic \
  --generic-ip-address guam.fortressone.org \
  --generic-ssh-user <HOST_USERNAME> \
  guam
```


## Scripts

### Opening ports on AWS

See `scripts/open-ports`


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
- [ ] stats


### Renew AWS after 1 year free period

E.G. for 2021 Virginia I did:
- Create new AWS account
- email: zel+virginia2021@fortressone.org
- password: xxxx
- AWS account name: fortressone-virginia2021
- Company name: FortressOne Team
- Credit card: FortressOne Team credit card
- Basic plan
- Set reminder for a year to renew again :P
- AIM > Add user
  - name: admin
  - access type: Programmatic access
- Create group
  - Group name: admin
  - Tick AdministratorAccess
- Save credentials
- Delete old instance: `docker-machine rm virginia`
- Run `docker-machine create` command from above, with new credentials, region and name
- Update DNS with new IP at cloudflare
- .env file shouldn't change (credentials in env file are for storage).
- `source .env.virginia; eval $(docker-machine env virginia)`
- `docker-compose -f production.yml up -d`
- Close old account in My Account
