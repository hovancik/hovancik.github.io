---
title: Working with firebase-tools from docker with docker-compose
date: 2020-08-27 17:18 UTC
tags: firebase, docker, docker-compose, svelte
---

`docker` is kinda nice<sup>citation needed</sup> and I like to use it with `docker-compose`. So when I decided to learn how to deploy simple app to `Firebase`, I wanted to do it with them, obviously.

What I wanted to do was:
- create `docker` container
- init `Svelte` app in it
- install `firebase-tools` and deploy the app with them

I won't be talking about getting `Firebase` account and all that jazz and I expect `docker` and `docker-compose` are all up and running.

Also, I am definitely not saying that this is the best way to do this, it's just something that I've tried and worked for me, so I wanna keep it for a future reference.

### Docker container

Let's create a container first. We'll need a few files, but let's start with a empty folder, where we will put some files.

```bash
$ mkdir rather-great-app
```

And files:

#### Dockerfile

```
FROM node:12.14.1
WORKDIR /rather-great-app
RUN npm i -g npm
```
#### docker-compose.yml

```
version: '3'
services:
  web:
    build: .
    volumes:
      - .:/rather-great-app
```

Let's build it (and run this every time we make an update to the `docker` stuff):

```bash
$ docker-compose build
```

### Svelte app

If all went well, we are now ready to play. So let's init basic `Svelte` app:

```bash
$ docker-compose run --rm web npx degit sveltejs/template --force
```
We're using `force` as we are not starting with empty destinantion, but that's fine. We can also install packages:

```bash
$ docker-compose run --rm web npm i
```

Let's update our docker stuff a bit more, so that we can start the app.

#### Dockerfile

```
FROM node:12.14.1
WORKDIR /rather-great-app
COPY package.json package-lock.json ./
RUN npm i -g npm
RUN npm i
COPY . .
```

#### docker-compose.yml

```
version: '3'
services:
  web:
    build: .
    command: npm run dev
    volumes:
      - .:/rather-great-app
    ports:
      - "5000:5000"    
```

#### package.json

We are in `docker`, so we need to update how we run our `Svelte` app (if we wanna access it outside of container). Update `start` in `package.json`:

```json
    "start": "sirv public --host"
```

Now we're good to go:

```bash
$ docker-compose up
```

In browser, on `http://localhost:5000/` we now have our `Svelte` Hello World app running and we can start working on deploy.

### Firebase CLI

Let's make sure our container has the `firebase-tools` installed.

#### Dockerfile

```
FROM node:12.14.1
WORKDIR /rather-great-app
COPY package.json package-lock.json ./
RUN npm i -g npm
RUN npm i
RUN npm install -g firebase-tools
COPY . .
```

### Deploy

Here comes the fun part.

In short, when setting up `Firebase`, you do `firebase login && firebase init && firebase deploy`. Login takes you to a browser, which we don't have in our container, where you login and are redirected to localhost with specific port, so that `firebase-tools` knows it's really you.

We make some changes to `docker`, so that we can do all that browser thingy outside of container.

#### Dockerfile

```
FROM node:12.14.1
WORKDIR /rather-great-app
COPY package.json package-lock.json ./
RUN npm i -g npm
RUN npm i
RUN npm install -g firebase-tools
EXPOSE 9005
COPY . .
```

#### docker-compose.yml

```
version: '3'
services:
  web:
    build: .
    command: npm run dev
    volumes:
      - .:/rather-great-app
    ports:
      - "5000:5000"
      - "9005:9005"
```

Once this is done, we can `up` the container, and try to log in:

```
docker-compose exec web firebase login
```

When you open the suggested link in browser and login, all should go well and `firebase-tools` in your container should recognize you.

Now you can `exec` `firebase init` and `firebase deploy` in similar fashion and access your app online :)
