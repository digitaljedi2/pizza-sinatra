# Runing a sinatra application on Docker

This is sample project for running a pizza application on Docker.
You will need a local mongodb database

## Usage

Create Image

```
docker build -t pizza .
```

Run it !

```
MONGO_ID=$(docker run -d -p 27017:27017 -v ~/data:/data/db mongo)
PIZZA_ID=$(docker run -p 9876:9876 -d pizza)
```

You can access it from your browser, [http://localhost:9876/](http://localhost:9876/).

Check logs. 

```
docker logs $PIZZA_ID
```

Stop it. 

```
docker stop $PIZZA_ID
```

Delete it. 

```
docker rm $PIZZA_ID
```

## OS X

Use Vagrant. In `Vagrantfile`, just add port forwarding settings.

```
vagrant up
```

and

```
vagrant ssh
```
