Build discord-bot:

```
docker build --tag=discord-bot .
```


Run discord-bot:

Create a `.env` file and set bot token, client_id and channel_id values:

```
QWTF_DISCORD_BOT_TOKEN=
QWTF_DISCORD_BOT_CLIENT_ID=
QWTF_DISCORD_BOT_CHANNEL_ID=
```

For the command bot:

```sh
docker run --env-file .env discord-bot server --endpoints \
    sydney.fortressone.org:27500 \
    sydney.fortressone.org:27501 \
    sydney.fortressone.org:27502 \
    sydney.fortressone.org:27503
```

For the watcher bot:

```sh
docker run --env-file .env discord-bot watcher --endpoints \
    sydney.fortressone.org:27500 \
    sydney.fortressone.org:27501 \
    sydney.fortressone.org:27502 \
    sydney.fortressone.org:27503
```


Stop discord-bot:

```sh
docker container ls
docker container stop <hash>
```


Deploy discord-bot:

```sh
docker tag discord-bot fortressone/discord-bot:latest
docker push fortressone/discord-bot:latest
```
