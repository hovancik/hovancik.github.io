---
title: Creating new Rails and Vue.js app with Docker
date: 2017-07-02 12:30 UTC
tags: ruby, rails, docker, vuejs
---

The most of Rails and Docker tutorials either show how to [dockerize](https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application) your existing app, or how to create new Rails app by [installing Rails](https://blog.codeship.com/running-rails-development-environment-docker/) locally and then adding Docker as second step.

It works but it have always struck me as weird idea: *why installing Ruby first*? Isn't the point of Docker, at least in part, that I do not need Ruby locally?

I am not that familiar with Docker so I decided to figure this out. [Vue.js](https://vuejs.org/) included, as it's something I want to try out and there's not a lot of stuff about it out there.

The result should be **basic example of Vue.js and Rails app running inside Docker container**. And for that, I'd like to use [webpacker](https://github.com/rails/webpacker) gem. One more thing: no [CoffeeScript](http://coffeescript.org/) (which is default for Rails).

*I recommend to familiarize yourself with Docker and webpacker, if not already. I am not gonna talk about them a lot.*

## No local Ruby and Rails

As it turns out, it's not that hard.

All I needed to do is go to the official Docker's [Rails example](https://docs.docker.com/compose/rails/#define-the-project). The document shows how to create new Rails app with PostgreSQL database without need to have Rails or Ruby installed on local machine.

Adding Vue.js to the mix changes steps a bit and that's what I will be writing about.

## Docker container

To be able to create new app, we first need to prepare Docker container that can run `rails new fancyapp --force --database=postgresql --webpack=vue --skip-coffee` command. For that we need to have Rails so feel free to initialize your git repo and create basic `Gemfile`.

```ruby
source 'https://rubygems.org'
ruby '2.4.1'
gem 'rails', '~> 5.1', '>= 5.1.1'
```

`Gemfile.lock` is empty at this point.

Now let's install other dependencies via `Dockerfile`.
```
FROM ruby:2.4.1

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - \
&& apt-get install -y nodejs

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

RUN mkdir /fancyapp
WORKDIR /fancyapp

ADD Gemfile /fancyapp/Gemfile
ADD Gemfile.lock /fancyapp/Gemfile.lock

RUN bundle install

ADD . /fancyapp
```
This is pretty straightforward: we install PostgreSQL lib, Node.js and yarn. Then we create directory for our fancy app and add `Gemfile` and `Gemfile.lock` there. Bundle will install Rails so we can use it to create new app.

Think about your app name here, and name the folder accordingly. Rails app will get name from it.

One last thing is `docker-compose.yml`. We will use `docker-compose` to run Docker commands.

```
version: '3'
services:
  db:
    image: postgres
  web:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/fancyapp
    ports:
      - "3000:3000"
    depends_on:
      - db
```

## rails new fancyapp

Now that we are all ready, we need to call `docker-compose build`. Rails and all deps will get installed, so we can `docker-compose run web rails new . --force --database=postgresql --webpack=vue --skip-coffee` to create new app.

We do not set application name in `rails new` command, as we are calling it from inside our app directory. In our case the app will be called *fancyapp*.

The command mentioned will generate new app with example Vue.js code that we will use later. If you're running on Linux, the newly created files might be owned by root. To be able to work with them, run this:
```
sudo chown -R $USER:$USER .
```

Then every time when you create files with `docker-compose run ...`, do it again.

Do not forget to add `ruby '2.4.1'` to Gemfile again. It gets removed when using `--force`.

Now you can run `docker-compose build` again and `docker-compose up`. Your app is available at `localhost:3000`.

## Adding Vue.js

The app running right now is ready to run Vue.js code, but our container is not. Let's change that.

To make things easier, we will add new service in our `docker-compose` running webpacker in [development](https://github.com/rails/webpacker#developing-with-webpacker) enviroment.

```
version: '3'
services:
  db:
    image: postgres
  webpacker:
    build: .
    command: bundle exec bin/webpack-dev-server
    volumes:
      - .:/fancyapp
    ports:
      - "8080:8080"
  web:
    build: .
    command: bundle exec rails s -p 3000 -b '0.0.0.0'
    volumes:
      - .:/fancyapp
    ports:
      - "3000:3000"
    depends_on:
      - db
      - webpacker
```
You might need to run `docker-compose run web yarn install` to get node packages installed. That's one part I haven't figured out yet.

All that is left now is adding some Vue.js code.

The easiest way is to add simple page via Rails generator: `docker-compose run web bundle exec rails g controller home index`. We will only change the Index view by adding example Vue.js code generated in the beginning via `javascript_pack_tag` that will execute code in `app/javascript/packs/hello_vue.js`.

```
<h1><%= javascript_pack_tag 'hello_vue' %></h1>
```

Go `up` with your container and you should see *Hello Vue!* in your browser.

Congratz, you have Rails with Vue.js app!

## Debugging

If you run into any issue (eg. container wont start), it might be helpful to try to run commands not via `docker-compose up`, but via `docker-compose run ...`. This way you may get better error output.

One might `docker-compose run web bundle exec rails s -p 3000 -b '0.0.0.0'` to check whether there is something wrong with Rails starting up.

I had to do that to figure out that pid file of my Rails app was not deleted when container went down.
## Next steps

The `rails new` generated example Vue.js stuff for us, but that's just the start.

As I am not familiar with Vue.js, my next step is doing exactly that. Then I will need to learn more about webpacker. With that knowledge I hope to be able to fully use all the goods that this setup is giving me.
